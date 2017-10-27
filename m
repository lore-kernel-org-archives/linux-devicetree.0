From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 00/10] Allwinner H3/H5/A64(DE2) SimpleFB support
Date: Fri, 27 Oct 2017 23:06:48 +0800
Message-ID: <20171027150658.18509-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBRUXZXHQKGQEN4L7SKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the SimpleFB on Allwinner SoCs with
"Display Engine 2.0".

PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.

PATCH 4 adds the pipeline strings for DE2 SimpleFB.

PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and SimpleFB)
for H3/H5 SoCs.

PATCH 8 to 10 are for Allwinner A64 SoC to enable SimpleFB.

Icenowy Zheng (10):
  dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
  clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
  clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU
  dt-bindings: simplefb-sunxi: add pipelines for DE2
  ARM: sun8i: h3/h5: add DE2 CCU device node for H3
  arm64: allwinner: h5: add compatible string for DE2 CCU
  ARM: sunxi: h3/h5: add simplefb nodes
  dt-bindings: add binding for A64 DE2 CCU SRAM
  arm64: allwinner: a64: add DE2 CCU for A64 SoC
  arm64: allwinner: a64: add simplefb for A64 SoC

 .../devicetree/bindings/clock/sun8i-de2.txt        | 10 +++-
 .../bindings/display/simple-framebuffer-sunxi.txt  |  4 ++
 arch/arm/boot/dts/sun8i-h3.dtsi                    |  4 ++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 43 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 65 ++++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |  4 ++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 53 +++++++++++++++++-
 7 files changed, 178 insertions(+), 5 deletions(-)

-- 
2.13.6
