From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/3] arm64: Add support for Juno development board
Date: Fri, 31 Oct 2014 16:04:17 +0000
Message-ID: <1414771460-7340-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds device tree support for ARM's AArch64 Juno development
board. It enables use of various peripherals on the board, from USB and
networking to I2C and PL011 UART.

The device tree file might end up not being merged in the kernel if Mark
Rutland's plans to create a separate repositories for .dts files pan out,
but I would like the first two patches to be added to arch/arm64.

Best regards,
Liviu


Liviu Dudau (3):
  arm64: defconfig: Enable support for generic EHCI and OHCI platforms
  arm64: Create link to include/dt-bindings to enable C preprocessor use.
  arm64: Add Juno SoC device tree.

 arch/arm64/boot/dts/Makefile            |   2 +-
 arch/arm64/boot/dts/include/dt-bindings |   1 +
 arch/arm64/boot/dts/juno.dts            | 374 ++++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig            |   5 +
 4 files changed, 381 insertions(+), 1 deletion(-)
 create mode 120000 arch/arm64/boot/dts/include/dt-bindings
 create mode 100644 arch/arm64/boot/dts/juno.dts

-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
