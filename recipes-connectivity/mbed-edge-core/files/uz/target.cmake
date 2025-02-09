MESSAGE ("Building Yocto Linux target")
SET (OS_BRAND Linux)
SET (MBED_CLOUD_CLIENT_DEVICE "uz")
SET (PAL_TARGET_DEVICE "uz")

SET (PAL_USER_DEFINED_CONFIGURATION "\"${TARGET_CONFIG_ROOT}/sotp_fs_uz_yocto.h\"")
SET (BIND_TO_ALL_INTERFACES 0)
SET (PAL_UPDATE_FIRMWARE_DIR "\"/mnt/cache/firmware\"")
SET (ARM_UC_SOCKET_TIMEOUT_MS 300000)

# When PARSEC_TPM_SE_SUPPORT is enabled, most likely you are using PSA trusted
# storage rather than default ESFS to save the provisioning data. In that case, these
# macros are irrelevant. To control the psa storage file location, please modify the
# config/psa_storage_user_config.h.
SET (PAL_FS_MOUNT_POINT_PRIMARY "\"/userdata/mbed/mcc_config\"")
SET (PAL_FS_MOUNT_POINT_SECONDARY "\"/userdata/mbed/mcc_config\"")

if (${FIRMWARE_UPDATE})
  SET (MBED_CLOUD_CLIENT_UPDATE_STORAGE ARM_UCP_LINUX_YOCTO_GENERIC)
endif()

if (${FOTA_ENABLE})
  SET (MBED_CLOUD_CLIENT_MIDDLEWARE curl)
  SET (PLATFORM_TARGET Yocto_Generic_YoctoLinux_mbedtls)
endif()

if(${PARSEC_TPM_SE_SUPPORT})
  SET (MBED_CLOUD_CLIENT_MIDDLEWARE trusted_storage mbedtls parsec_se_driver)
  SET (PLATFORM_TARGET Yocto_Generic_YoctoLinux_mbedtls)
  SET (MBED_CLOUD_CLIENT_OS Linux_Yocto_v2.2)
  SET (MBED_CLOUD_CLIENT_SDK )
  SET (MBED_CLOUD_CLIENT_TOOLCHAIN )
  SET (MBED_CLOUD_CLIENT_BUILD_SYS_MIN_VER 2)
  SET (MBED_CLOUD_CLIENT_NATIVE_SDK False)
endif()

