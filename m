From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 0/2] arm64: Add support for Juno development board
Date: Mon, 10 Nov 2014 11:27:53 +0000
Message-ID: <1415618875-8469-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Olof, Arnd and Kevin,

I have sent these patches a week ago but I have not properly addressed
them to you, so you might have missed them. The original submission is
here: http://lkml.org/lkml/2014/10/31/372.

Changes vs v1: Dropped the defconfig change that is now in mainline.

Please consider this series for addition to the arm-soc tree.

This patchset adds device tree support for ARM's AArch64 Juno development
board. It enables use of various peripherals on the board, from USB and
networking to I2C and PL011 UART.

The patches can also be found in the repository at:

   git://github.com/ARM-software/linux.git juno/dts-for-armsoc

for you to fetch.

Best regards,
Liviu

Liviu Dudau (2):
  arm64: Create link to include/dt-bindings to enable C preprocessor use.
  arm64: Add Juno SoC device tree.

 arch/arm64/boot/dts/Makefile            |   2 +-
 arch/arm64/boot/dts/include/dt-bindings |   1 +
 arch/arm64/boot/dts/juno.dts            | 374 ++++++++++++++++++++++++++++++++
 3 files changed, 376 insertions(+), 1 deletion(-)
 create mode 120000 arch/arm64/boot/dts/include/dt-bindings
 create mode 100644 arch/arm64/boot/dts/juno.dts

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
