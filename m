From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 00/15] ST33 I2C TPM driver cleanup
Date: Mon,  1 Dec 2014 19:32:45 +0100
Message-ID: <1417458780-25977-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi Peter,

I have seen one mistake done during the rebase on v5 on patch
0010-tpm-tpm_i2c_stm_st33-Add-devicetree-structure.
~~ Please discard v5. ~~

This new patchset version is taking into account as much as possible
Jason Gunthorpe feedbacks as well as yours. I hope, i am not missing any.

I have also aligned dts compatible string with other drivers and rephrase one part
of the st33zp24 dts documentation as pointed by Mark Rutland.

It still brings:
- Some few code clean up from code style up to structure
- Device tree support keeping static platform data configuration support.
- Fixes & improvement for irq support.
- Update the GPLv2 license header

I have moved previous patch 0013 tpm/tpm_i2c_stm_st33: Fix potential bug in
tpm_stm_i2c_send to 0001 as per your request. I have fixed as some build errors
seen during the rebase :(. My bad.
I have also changed the convention in the driver from r to ret.

This patchset apply on top of James Morris linux-security tree
on top of ac14ae25b676d721b6bfcfb046dc53a9f7760d83 on next branch
Hope i am targetting the correct tree.

Best Regards
Christophe

Christophe Ricard (15):
  tpm/tpm_i2c_stm_st33: Fix potential bug in tpm_stm_i2c_send
  tpm/tpm_i2c_stm_st33: Update Kconfig in order to be inline to other
    similar product
  tpm/tpm_i2c_stm_st33: Change License header to have up to date address
    information
  tpm/tpm_i2c_stm_st33: Fix few coding style error reported by
    scripts/checkpatch.pl
  tpm/tpm_i2c_stm_st33: Move tpm registers to tpm_i2c_stm_st33.c
  tpm/tpm_i2c_stm_st33: Add new tpm_stm_dev structure and remove
    tpm_i2c_buffer[0], [1] buffer.
  tpm/tpm_i2c_stm_st33: Remove reference to io_serirq
  tpm/tpm_i2c_stm_st33: Replace err/rc/ret by ret for a function return
    code
  tpm/tpm_i2c_stm_st33: Replace tpm_st33_* function with tpm_stm_*
  tpm/tpm_i2c_stm_st33: Add devicetree structure
  tpm/tpm_i2c_stm_st33/dts/st33zp24_i2c: Add DTS Documentation
  tpm/tpm_i2c_stm_st33: Few code cleanup
  tpm/tpm_i2c_stm_st33: Interrupt management improvement
  tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers
  tpm/tpm_i2c_stm_st33: Increment driver version to 1.2.1.

 .../devicetree/bindings/security/tpm/st33zp24.txt  |  36 ++
 drivers/char/tpm/Kconfig                           |   4 +-
 drivers/char/tpm/Makefile                          |   2 +-
 drivers/char/tpm/tpm_i2c_stm_st33.c                | 643 ++++++++++++---------
 drivers/char/tpm/tpm_i2c_stm_st33.h                |  61 --
 include/linux/platform_data/tpm_i2c_stm_st33.h     |  39 ++
 6 files changed, 434 insertions(+), 351 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24.txt
 delete mode 100644 drivers/char/tpm/tpm_i2c_stm_st33.h
 create mode 100644 include/linux/platform_data/tpm_i2c_stm_st33.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
