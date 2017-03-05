From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v7 0/6] Allwinner H5 and Orange Pi PC2 support
Date: Mon,  6 Mar 2017 07:31:32 +0800
Message-ID: <20170305233138.64574-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB5V76LCQKGQELVCETRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H5 is a 64-bit SoC with a design like the 32-bit
H3, and it's pin-to-pin compatible with H3.

This patchset adds support for it, along with the first available
board -- Orange Pi PC2.

Several H5 boards by Sinovoip Banana Pi and FriendlyARM Nano Pi
are coming, so we should get ready for them.

CCU changes are already said to be merged by Maxime Ripard, so
this patchset now contains only device tree patches.

Some cleanups applied to H3 DTSI is extracted to separated commits,
according to the suggestion of Maxime.

This patchset depends on patchset [1] to finally take effect. At
least the patch 1 of that patchset is needed if you want to test
the kernel image -- without it the pinctrl driver won't be built
and the kernel will become unusable without pinctrl.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2017-March/490780.html

Andre Przywara (3):
  arm: dts: sun8i: split Allwinner H3 .dtsi
  arm64: dts: allwinner: add Allwinner H5 .dtsi
  arm64: dts: sunxi: add support for the Orange Pi PC 2 board

Icenowy Zheng (3):
  ARM: dts: sun8i: drop skeleton.dtsi inclusion in H3 DTSI
  ARM: dts: sun8i: drop pinctrl-a10.h inclusion for H3 DTSI
  ARM: dts: sun8i: correct the GIC compatible in H3 to gic-400

 arch/arm/boot/dts/sun8i-h3.dtsi                    | 602 ++-------------------
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 586 ++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 163 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       | 124 +++++
 arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi     |   1 +
 6 files changed, 915 insertions(+), 562 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunxi-h3-h5.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
 create mode 120000 arch/arm64/boot/dts/allwinner/sunxi-h3-h5.dtsi

-- 
2.11.1
