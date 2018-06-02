OVMF_URL		:= https://github.com/tianocore/edk2

OVMF:
	git clone $(OVMF_URL) edk2
	patch edk2/OvmfPkg/OvmfPkgX64.fdf < patches/OvmfPkgX64.fdf.patch
	bash -c 'cd edk2; . edksetup.sh; make -C BaseTools; build -t GCC5 -D HTTP_BOOT_ENABLE -a X64 -p OvmfPkg/OvmfPkgX64.dsc -b RELEASE'

.SILENT:

.PHONY: OVMF
