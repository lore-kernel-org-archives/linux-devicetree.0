From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 0/3] Allwinner H6 Ethernet support
Date: Sat,  3 Nov 2018 20:32:35 +0800
Message-ID: <20181103123238.4665-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB6VK63PAKGQERCJP4PI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset introduces Allwinner H6 Ethernet support with code already
available for A64.

As the EMAC on H6 is similar to A64 ones, support for them are directly
reused, by using fallback compatible strings.

Patches about system controller in v1 is sent by Jernej Skabrec as part
of his H6 display patchset, and already gets applied.

NOTE: This patchset targets the final version of Pine H64, and also
supports the early sample of Pine H64 model B. However, it's not
compatible with the early sample of Pine H64 model A. Please DO NOT test
this patchset on the Pine H64 model A samples.

Icenowy Zheng (3):
  dt-binding: dwmac-sun8i: add H6 compatible string (w/ A64 fallback)
  arm64: allwinner: h6: add EMAC device nodes
  arm64: allwinner: h6: add support for the Ethernet on Pine H64

 .../devicetree/bindings/net/dwmac-sun8i.txt   |  1 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts | 20 +++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 28 +++++++++++++++++++
 3 files changed, 49 insertions(+)

-- 
2.18.1
