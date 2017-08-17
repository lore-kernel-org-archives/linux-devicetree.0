From: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 0/2] provide imx rproc driver
Date: Thu, 17 Aug 2017 09:15:24 +0200
Message-ID: <20170817071526.5930-1-o.rempel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org
List-Id: devicetree@vger.kernel.org

this patch set to provide remoteproc functionality on
i.MX7D SoC.

For testing I used this simple counter written in ASM:
======================================
        .syntax unified
        .text
        .thumb
        .int 0x10020000                 @ Initial SP value
        .int reset + 1

reset:

        mov     r0, #0x55
        ldr     r1, =(0x40)
1:
        str     r0, [r1]
        add     r0, 1
        b       1b

        /* Dummy data, required by remoteproc loader */
        /* Please FIXME, this part seem to be incorrect */
        .data
        .section .resource_table, "aw"
        .word   1, 0, 0, 0      /* struct resource_table base */
        .word   0               /* uint32_t offset[1] */
============================================================
compiled with:
${CROSS}as -o imx7m4.o imx7m4.S
${CROSS}ld -Ttext=0x0 -o imx7m4.elf imx7m4.o
cp imx7m4.elf /srv/nfs/sid-armhf/lib/firmware/rproc-imx_rproc-fw

Functionality was confirmed with current OpenOCD master.
OpenOCD cfg file can be found here:
https://github.com/olerem/openocd/blob/imx7-2017.06.14/tcl/target/imx7.cfg

changes:
v3:
 - rename rproc to cm4 (Cortex M4)

v2:
 - use memory-region instead of reg property
 - remove memory ranges from documentation

Oleksij Rempel (2):
  remoteproc: dt: Provide bindings for iMX6SX/7D Remote Processor
    Controller driver
  remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver

 .../devicetree/bindings/remoteproc/imx-rproc.txt   |  33 ++
 drivers/remoteproc/Kconfig                         |  10 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/imx_rproc.c                     | 426 +++++++++++++++++++++
 4 files changed, 470 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
 create mode 100644 drivers/remoteproc/imx_rproc.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
