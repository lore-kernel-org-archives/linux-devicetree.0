From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/3] Allwinner A64 EHCI0/OHCI0 devicetree change
Date: Wed,  5 Apr 2017 20:50:50 +0800
Message-ID: <20170405125053.6170-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBROQSPDQKGQEMEV7HLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset contains devicetree parts of the EHCI0/OHCI0 controllers
on A64 SoC.

The first patch is a devicetree binding change, which has been planned
for 4.12; however, as Maxime Ripard suggested, it should go in 4.11
as it's part of the device's description.

The second patch added pmu0 regs and EHCI/OHCI controllers for USB0.

The third patch enabled EHCI0/OHCI0 for Pine64 board.

This patchset should go in 4.11 as Maxime Ripard suggested.

Icenowy Zheng (3):
  dt: bindings: add pmu0 regs for USB PHYs on Allwinner H3/V3s/A64
  arm64: allwinner: a64: add USB0 OHCI/EHCI related devicetree parts
  arm64: allwinner: a64: enable EHCI0/OHCI0 controller for Pine64

 .../devicetree/bindings/phy/sun4i-usb-phy.txt      |  1 +
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |  8 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 24 ++++++++++++++++++++++
 3 files changed, 33 insertions(+)

-- 
2.12.2
