From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/16] ST33 I2C TPM driver cleanup
Date: Tue,  7 Oct 2014 22:02:53 +0200
Message-ID: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

The following patchset brings:
- Some few code clean up from code style up to structure
- Device tree support keeping static platform data configuration support.
- Fix irq support.
- Update the GPLv2 license header

This patchset apply on top of James Morris linux-security tree
on top of 594081ee7145cc30a3977cb4e218f81213b63dc5 on next branch
Hope i am targetting to correct tree.

The full patchset got also crosschecked by Jean-Luc here in copy.

Best Regards
Christophe

Christophe Ricard (16):
  tpm/tpm_i2c_stm_st33: Update Kconfig in order to be inline to other
    similar product
  tpm/tpm_i2c_stm_st33: Fix few coding style error reported by
    scripts/checkpatch.pl
  tpm/tpm_i2c_stm_st33: Move tpm registers to tpm_i2c_stm_st33.c
  tpm/tpm_i2c_stm_st33: Add new tpm_stm_dev structure and remove
    tpm_i2c_buffer[0], [1] buffer.
  tpm/tpm_i2c_stm_st33: Replace err/rc/ret by r for a function return
    code
  tpm/tpm_i2c_stm_st33: Replace tpm_st33_* function with tpm_stm_*
  tpm/tpm_i2c_stm_st33: Add devicetree structure
  tpm: dts: st33zp24_i2c: Add DTS Documentation
  tpm/tpm_i2c_stm_st33: Few code cleanup
  tpm/tpm_i2c_stm_st33: Replace wait_for_serirq_timeout by
    wait_for_tpm_stat
  tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers
  tpm/tpm_i2c_stm_st33: Change License header to have up to date address
    information
  tpm/tpm_i2c_stm_st33: Add tpm_lock mutex for safe irq management
  tpm/tpm_i2c_stm_st33: Fix potential bug in tpm_stm_i2c_send
  tpm/tpm_i2c_stm_st33: Add delay before release_locality to make sure
    irq are cleared
  tpm: Increment driver version to 1.2.1.

 .../devicetree/bindings/security/tpm/st33zp24.txt  |  35 ++
 drivers/char/tpm/Kconfig                           |  20 +-
 drivers/char/tpm/tpm_i2c_stm_st33.c                | 680 +++++++++++----------
 drivers/char/tpm/tpm_i2c_stm_st33.h                |  61 --
 include/linux/platform_data/tpm_i2c_stm_st33.h     |  40 ++
 5 files changed, 458 insertions(+), 378 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24.txt
 delete mode 100644 drivers/char/tpm/tpm_i2c_stm_st33.h
 create mode 100644 include/linux/platform_data/tpm_i2c_stm_st33.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
