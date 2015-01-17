From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2 08/10] tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in 2 layers (core + phy)
Date: Sat, 17 Jan 2015 14:32:14 +0100
Message-ID: <201501171432.16578.PeterHuewe@gmx.de>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com> <1421187198-8503-9-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-9-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 13. Januar 2015, 23:13:16 schrieb Christophe Ricard:
> tpm_i2c_stm_st33 is a TIS 1.2 TPM with a core interface which can be used
> by different phy such as i2c or spi. The core part is called st33zp24 which
> is also the main part reference.
> 
> include/linux/platform_data/tpm_stm_st33.h is renamed consequently.
> The driver is also split into an i2c phy in charge of sending/receiving
> data as well as managing platform data or dts configuration.
> 
> Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>


Fails to link for me ;(

 make -j24 
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  LD      drivers/char/tpm/built-in.o
  CC [M]  drivers/char/tpm/tpm-interface.o
  CHK     kernel/config_data.h
  CC [M]  drivers/char/tpm/tpm-dev.o
  CC [M]  drivers/char/tpm/tpm-sysfs.o
  CC [M]  drivers/char/tpm/tpm-chip.o
  CC [M]  drivers/char/tpm/tpm2-cmd.o
  CC [M]  drivers/char/tpm/tpm_ppi.o
  CC [M]  drivers/char/tpm/tpm_acpi.o
  CC [M]  drivers/char/tpm/tpm_eventlog.o
  CC [M]  drivers/char/tpm/tpm_tis.o
  CC [M]  drivers/char/tpm/tpm_i2c_infineon.o
  CC [M]  drivers/char/tpm/tpm_i2c_atmel.o
  CC [M]  drivers/char/tpm/tpm_i2c_nuvoton.o
  CC [M]  drivers/char/tpm/tpm_atmel.o
  CC [M]  drivers/char/tpm/tpm_nsc.o
  CC [M]  drivers/char/tpm/tpm_infineon.o
  CC [M]  drivers/char/tpm/tpm_crb.o
  LD      drivers/char/tpm/st33zp24/built-in.o
  CC [M]  drivers/char/tpm/st33zp24/st33zp24.o
  CC [M]  drivers/char/tpm/st33zp24/i2c.o
  CC [M]  drivers/char/tpm/st33zp24/spi.o
  LD [M]  drivers/char/tpm/tpm.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24_spi.o
  LD [M]  drivers/char/tpm/st33zp24/tpm_st33zp24.o
  Building modules, stage 2.
Kernel: arch/x86/boot/bzImage is ready  (#195)
  MODPOST 817 modules
ERROR: "st33zp24_probe" [drivers/char/tpm/st33zp24/tpm_st33zp24_spi.ko] 
undefined!
ERROR: "st33zp24_pm_suspend" [drivers/char/tpm/st33zp24/tpm_st33zp24_spi.ko] 
undefined!
ERROR: "st33zp24_remove" [drivers/char/tpm/st33zp24/tpm_st33zp24_spi.ko] 
undefined!
ERROR: "st33zp24_pm_resume" [drivers/char/tpm/st33zp24/tpm_st33zp24_spi.ko] 
undefined!
ERROR: "st33zp24_probe" [drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.ko] 
undefined!
ERROR: "st33zp24_pm_suspend" [drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.ko] 
undefined!
ERROR: "st33zp24_remove" [drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.ko] 
undefined!
ERROR: "st33zp24_pm_resume" [drivers/char/tpm/st33zp24/tpm_st33zp24_i2c.ko] 
undefined!
scripts/Makefile.modpost:90: recipe for target '__modpost' failed
make[1]: *** [__modpost] Error 1
Makefile:1099: recipe for target 'modules' failed
make: *** [modules] Error 2


Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
