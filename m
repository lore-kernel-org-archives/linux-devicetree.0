From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: dts: sunxi: Banana Pi: increase
 startup-delay for the GMAC PHY regulator
Date: Sun,  9 Nov 2014 14:28:34 +0100
Message-ID: <1415539714-7652-2-git-send-email-merker@debian.org>
References: <1415539714-7652-1-git-send-email-merker@debian.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBXWY7WRAKGQEWNRSHEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1415539714-7652-1-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On the LeMaker Banana Pi, probing the external ethernet PHY connected
to the SoC's internal GMAC module sometimes fails.  The PHY power
supply is handled via a GPIO-controlled regulator, and the existing
regulator startup-delay of 50000us is too short to make sure that the
PHY is always fully powered up when it is queried by phylib.  To
guarantee a reliable PHY detection, the startup-delay has to be
increased to 60000us.

Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 3de847d..36065d1 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -207,7 +207,7 @@
 		regulator-name = "gmac-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <50000>;
+		startup-delay-us = <60000>;
 		enable-active-high;
 		gpio = <&pio 7 23 0>;
 	};
-- 
1.7.10.4
