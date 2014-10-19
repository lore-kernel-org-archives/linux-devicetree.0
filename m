From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 00/15] ST33 I2C TPM driver cleanup
Date: Sun, 19 Oct 2014 23:11:10 +0200
Message-ID: <1413753085-9958-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

This new patchset version is taking into account as much as possible
Jason Gunthorpe feedbacks. I hope, i am not missing any.

It still brings:
- Some few code clean up from code style up to structure
- Device tree support keeping static platform data configuration support.
- Fixes & improvement for irq support.
- Update the GPLv2 license header

I am also adding the mention Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
on all those patches. 
Jason, please feel free to let me know if i am mistaking here. :).

This patchset apply on top of James Morris linux-security tree
on top of 594081ee7145cc30a3977cb4e218f81213b63dc5 on next branch
Hope i am targetting to correct tree.

The full patchset got also crosschecked by Jean-Luc here in copy.

Best Regards
Christophe

Christophe Ricard (15):
  tpm/tpm_i2c_stm_st33: Update Kconfig in order to be inline to other
    similar product
  tpm/tpm_i2c_stm_st33: Fix few coding style error reported by
    scripts/checkpatch.pl
  tpm/tpm_i2c_stm_st33: Move tpm registers to tpm_i2c_stm_st33.c
  tpm/tpm_i2c_stm_st33: Add new tpm_stm_dev structure and remove
    tpm_i2c_buffer[0], [1] buffer.
  tpm/tpm_i2c_stm_st33: Remove reference to io_serirq
  tpm/tpm_i2c_stm_st33: Replace err/rc/ret by r for a function return
    code
  tpm/tpm_i2c_stm_st33: Replace tpm_st33_* function with tpm_stm_*
  tpm/tpm_i2c_stm_st33: Add devicetree structure
  tpm/tpm_i2c_stm_st33/dts/st33zp24_i2c: Add DTS Documentation
  tpm/tpm_i2c_stm_st33: Few code cleanup
  tpm/tpm_i2c_stm_st33: Interrupt management improvement
  tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers
  tpm/tpm_i2c_stm_st33: Fix potential bug in tpm_stm_i2c_send
  tpm/tpm_i2c_stm_st33: Change License header to have up to date address
    information
  tpm/tpm_i2c_stm_st33: Increment driver version to 1.2.1.

 .../devicetree/bindings/security/tpm/st33zp24.txt  |  36 ++
 drivers/char/tpm/Kconfig                           |   4 +-
 drivers/char/tpm/Makefile                          |   2 +-
 drivers/char/tpm/tpm_i2c_stm_st33.c                | 675 +++++++++++----------
 drivers/char/tpm/tpm_i2c_stm_st33.h                |  61 --
 include/linux/platform_data/tpm_i2c_stm_st33.h     |  39 ++
 6 files changed, 449 insertions(+), 368 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24.txt
 delete mode 100644 drivers/char/tpm/tpm_i2c_stm_st33.h
 create mode 100644 include/linux/platform_data/tpm_i2c_stm_st33.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
