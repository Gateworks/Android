#
# Makefile targets for generating ubifs filesystems
#

RAMDISK_TARGET_UBIFS := $(PRODUCT_OUT)/boot.ubifs
$(RAMDISK_TARGET_UBIFS): $(MKUBIFS) $(PRODUCT_OUT)/boot.img
	$(MKUBIFS) $(TARGET_MKUBIFS_ARGS) -d $(PRODUCT_OUT)/boot -o $@

RAMDISK_RECOVERY_TARGET_UBIFS := $(PRODUCT_OUT)/recovery.ubifs
$(RAMDISK_RECOVERY_TARGET_UBIFS): $(MKUBIFS) $(PRODUCT_OUT)/recovery.img
	$(MKUBIFS) $(TARGET_MKUBIFS_ARGS) -d $(PRODUCT_OUT)/recovery -o $@

SYSTEM_TARGET_UBIFS := $(PRODUCT_OUT)/system.ubifs
$(SYSTEM_TARGET_UBIFS): $(MKUBIFS) $(PRODUCT_OUT)/system.img
	$(MKUBIFS) $(TARGET_MKUBIFS_ARGS) -s -d $(PRODUCT_OUT)/system -o $@

USERDATA_TARGET_UBIFS := $(PRODUCT_OUT)/userdata.ubifs
$(USERDATA_TARGET_UBIFS): $(PRODUCT_OUT)/userdata.img
	$(MKUBIFS) $(TARGET_MKUBIFS_ARGS) -s -d $(PRODUCT_OUT)/data -o $@

droidcore: $(RAMDISK_TARGET_UBIFS) $(RAMDISK_RECOVERY_TARGET_UBIFS) $(SYSTEM_TARGET_UBIFS) $(USERDATA_TARGET_UBIFS)
