From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 0/4] Fix A64/R40 HDMI PHY device tree binding
Date: Sun, 16 Sep 2018 12:34:05 +0800
Message-ID: <20180916043409.62374-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3V267OAKGQEGTBATTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When adding support for A64 HDMI PHY in 4.19, we assumed that the two
PLL-VIDEOs can both feed the HDMI PHY clock. However experiments show
that the mux bit discovered in R40 blob is not applicable on A64. This
is not discovered, as normally with a single display pipeline only
PLL-VIDEO0 will be used.

In this patchset the second PLL is dropped, and a binding specially for
R40 HDMI PHY is added (which seems to have the mux).

PATCH 1 is dropping second PLL for A64 HDMI PHY, and PATCH 2 to 4
are adding R40 HDMI PHY binding, as R40 behaves differently with A64
with this.

This patchset targets v4.19 fixes tree, because the binding is
introduced in v4.19, and if we don't fix it there a wrong binding will
be left in a stable version released. A64 display pipeline support is
not yet in v4.19, but R40 support is in it.

Icenowy Zheng (4):
  drm: sun4i: drop second PLL from A64 HDMI PHY
  dt-bindings: sun4i-drm: add compatible for R40 HDMI PHY
  drm/sun4i: add support for R40 HDMI PHY
  ARM: sun8i: dts: drop A64 HDMI PHY fallback compatible from R40 DT

 .../devicetree/bindings/display/sunxi/sun4i-drm.txt |  5 +++--
 arch/arm/boot/dts/sun8i-r40.dtsi                    |  3 +--
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c              | 13 ++++++++++++-
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.18.0
