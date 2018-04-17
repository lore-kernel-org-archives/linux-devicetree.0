From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] ARM: dts: sun8i: h3: Re-enable EMAC on Orange
 Pi One
Date: Tue, 17 Apr 2018 12:17:14 +0800
Message-ID: <20180417041714.27266-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBV7K2XLAKGQELFWJ7KI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

In commit f0842bc5637c ("ARM: dts: sun8i: h3: Enable HDMI output on H3
boards"), the hunk that enabled HDMI for the Orange Pi One did not add a

    status = "okay";

line for the HDMI node, inadvertenly using the one for the EMAC. This
resulted in the EMAC now being disabled. Whether this was due to a
rebase error or some other mishap is unknown.

This patch re-enables the EMAC by adding the status line to its node.

Fixes: f0842bc5637c ("ARM: dts: sun8i: h3: Enable HDMI output on H3 boards")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

First fix for 4.17.

---
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
index 3328fe583c9b..232f124ce62c 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
@@ -117,6 +117,7 @@
 	phy-handle = <&int_mii_phy>;
 	phy-mode = "mii";
 	allwinner,leds-active-low;
+	status = "okay";
 };
 
 &hdmi {
-- 
2.17.0
