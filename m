From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/6] ARM: sunxi: Add basic support for Allwinner
 A80 SoC
Date: Sun, 21 Sep 2014 22:58:07 +0800
Message-ID: <1411311493-24344-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBFGP7OQAKGQEJRIZHMQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, yhf-HcjymKqD97rQT0dZR+AlfA@public.gmane.org, ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This patch series adds very basic support for Allwinner's A80 SoC,
a big.LITTLE architecture with 4 Cortex-A7s and 4 Cortex-A15s.

Development is done on the A80 Optimus Board, the defacto development
board for the A80, with the accompanying SDK as a reference. 

So far I've been unable to get the board to boot from MMC, or
using Android fastboot. I'm using Allwinner's FEL mode to load
the bootloader and kernel+dtb image over USB. Notes on my attempts
can be found here: http://linux-sunxi.org/User:Wens#A80_Optimus


Patch 1 introduces the compatible string for the A80.

Patch 2 adds options to use UART0 on the A80 as the debug port for
earlyprintk.

Patch 3 adds a barebone dtsi with just the cpu, memory and uart nodes.

Patch 4 adds a barebone dts for the A80 Optimus Board.

Patch 5 documents the vendor prefix for Merrii Technology Co., Ltd,
the designer and vendor of the A80 Optimus Board.

Patch 6 documents all the Allwinner SoCs we currently support.


Cheers
ChenYu

Chen-Yu Tsai (6):
  ARM: sunxi: Introduce Allwinner A80 support
  ARM: sunxi: Add debug uart used by sun9i (Allwinner A80)
  ARM: dts: sunxi: Add Allwinner A80 dtsi
  ARM: dts: sun9i: Add A80 Optimus Board support
  devicetree: bindings: Add vendor prefix for Merrii Technology Co.,
    Ltd.
  devicetree: bindings: Document supported Allwinner sunxi SoCs

 Documentation/devicetree/bindings/arm/sunxi.txt    |  12 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/Kconfig.debug                             |  10 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/sun9i-a80-optimus.dts            |  66 +++++
 arch/arm/boot/dts/sun9i-a80.dtsi                   | 280 +++++++++++++++++++++
 arch/arm/mach-sunxi/Kconfig                        |   5 +
 arch/arm/mach-sunxi/sunxi.c                        |   9 +
 8 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi.txt
 create mode 100644 arch/arm/boot/dts/sun9i-a80-optimus.dts
 create mode 100644 arch/arm/boot/dts/sun9i-a80.dtsi

-- 
2.1.0
