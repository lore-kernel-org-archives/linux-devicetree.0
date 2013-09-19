From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH RESEND 0/3] ARM: dts: mxs: add pinctrl header files
Date: Thu, 19 Sep 2013 08:59:46 +0200
Message-ID: <1379573990-27556-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches add header files for the MXS arch and convert the DTS
files to use the pad definitions from those files rather than
hardcoding the numerical pinctrl values.

The conversion from numerical representation to symbolic names has
been done with a perl script that checked the definitions for
consistency of the pin function comments and the numerical values
used. This revealed an inconsistency in:
arch/arm/boot/dts/imx28-apx4devkit.dts, which pretended to use
MX28_PAD_SSP2_SS0__GPIO_2_19 (equivalent to 0x2133) in the comment,
but actually was using MX28_PAD_SSP2_SS0__AUART3_TX by the numerical
value 0x2131.

I decided to use the (possibly unintended) assignment
MX28_PAD_SSP2_SS0__AUART3_TX because that is what is actually
configured without this patch.

 arch/arm/boot/dts/imx23-evk.dts                                 |    6 
 arch/arm/boot/dts/imx23-olinuxino.dts                           |   12 
 arch/arm/boot/dts/imx23-stmp378x_devb.dts                       |    6 
 arch/arm/boot/dts/imx23.dtsi                                    |   58 -
 arch/arm/boot/dts/imx28-apf28dev.dts                            |   12 
 arch/arm/boot/dts/imx28-apx4devkit.dts                          |   22 
 arch/arm/boot/dts/imx28-cfa10036.dts                            |   18 
 arch/arm/boot/dts/imx28-cfa10037.dts                            |   12 
 arch/arm/boot/dts/imx28-cfa10049.dts                            |   72 -
 arch/arm/boot/dts/imx28-cfa10055.dts                            |   24 
 arch/arm/boot/dts/imx28-cfa10056.dts                            |   18 
 arch/arm/boot/dts/imx28-cfa10057.dts                            |   18 
 arch/arm/boot/dts/imx28-cfa10058.dts                            |   12 
 arch/arm/boot/dts/imx28-evk.dts                                 |   24 
 arch/arm/boot/dts/imx28-m28evk.dts                              |   12 
 arch/arm/boot/dts/imx28-sps1.dts                                |    6 
 arch/arm/boot/dts/imx28.dtsi                                    |  242 ++---
 b/Documentation/devicetree/bindings/pinctrl/fsl,mxs-pinctrl.txt |  859 ------------------
 b/arch/arm/boot/dts/imx23-evk.dts                               |   10 
 b/arch/arm/boot/dts/imx23-olinuxino.dts                         |    6 
 b/arch/arm/boot/dts/imx23-pinfunc.h                             |  333 ++++++
 b/arch/arm/boot/dts/imx23-stmp378x_devb.dts                     |    6 
 b/arch/arm/boot/dts/imx23.dtsi                                  |  163 +--
 b/arch/arm/boot/dts/imx28-apf28.dts                             |    2 
 b/arch/arm/boot/dts/imx28-apf28dev.dts                          |   24 
 b/arch/arm/boot/dts/imx28-apx4devkit.dts                        |   38 
 b/arch/arm/boot/dts/imx28-cfa10036.dts                          |    8 
 b/arch/arm/boot/dts/imx28-cfa10037.dts                          |    6 
 b/arch/arm/boot/dts/imx28-cfa10049.dts                          |   84 -
 b/arch/arm/boot/dts/imx28-cfa10055.dts                          |   56 -
 b/arch/arm/boot/dts/imx28-cfa10056.dts                          |   20 
 b/arch/arm/boot/dts/imx28-cfa10057.dts                          |   48 -
 b/arch/arm/boot/dts/imx28-cfa10058.dts                          |   12 
 b/arch/arm/boot/dts/imx28-evk.dts                               |   32 
 b/arch/arm/boot/dts/imx28-m28evk.dts                            |   16 
 b/arch/arm/boot/dts/imx28-pinfunc.h                             |  506 ++++++++++
 b/arch/arm/boot/dts/imx28-sps1.dts                              |    8 
 b/arch/arm/boot/dts/imx28.dtsi                                  |  337 +++----
 b/arch/arm/boot/dts/mxs-pinfunc.h                               |   31 
 39 files changed, 1628 insertions(+), 1551 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
