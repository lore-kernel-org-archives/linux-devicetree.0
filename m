From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun6i: ippo-q8h-v5: Fix serial0 alias
Date: Thu, 25 Dec 2014 13:25:19 +0100
Message-ID: <1419510319-32400-2-git-send-email-hdegoede@redhat.com>
References: <1419510319-32400-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBOUE6CSAKGQEAA4KAJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1419510319-32400-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Ippo q8h has its serial console connected to the r-uart. Adjust the
serial0 alias to match.

This fixes the kernel serial console no longer working since 3.19-rc1, because
8250_dw.c now honors dt aliases, causing the serial console to be ttyS5 rather
then being ttyS0, as it was in 3.18 and before.

Note that adjusting bootargs instead is not an acceptable fix, because
console=ttyS0,115200 is used by a lot of bootscripts, etc. and this should
continue to work.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
index 7f2117c..32ad808 100644
--- a/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
+++ b/arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts
@@ -55,6 +55,10 @@
 	model = "Ippo Q8H Dual Core Tablet (v5)";
 	compatible = "ippo,q8h-v5", "allwinner,sun8i-a23";
 
+	aliases {
+		serial0 = &r_uart;
+	};
+
 	chosen {
 		bootargs = "earlyprintk console=ttyS0,115200";
 	};
-- 
2.1.0
