From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/3] Allwinner V3s EMAC support
Date: Sat,  3 Feb 2018 02:04:53 +0800
Message-ID: <20180202180456.60378-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB3WQ2LJQKGQENV47OLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Allwinner V3/V3s SoCs have EMAC similar to the one in H3, but on V3s
the external MII is not exported due to packaging. (V3s is eLQFP128;
the BGA-packaged V3 exported the external MII bus.)

Add support for the EMAC on V3s. The external bus is not added yet, and
will be added when adding support for V3.

Icenowy Zheng (3):
  net: stmmac: dwmac-sun8i: drop V3s compatible and add V3 one
  ARM: sun8i: v3s: add V3s EMAC device tree node
  ARM: sun8i: v3s: enable Ethernet port on the Lichee Pi Zero Dock

 .../devicetree/bindings/net/dwmac-sun8i.txt        | 10 ++--
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts |  8 ++++
 arch/arm/boot/dts/sun8i-v3s.dtsi                   | 55 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 10 ++--
 4 files changed, 74 insertions(+), 9 deletions(-)

-- 
2.15.1
