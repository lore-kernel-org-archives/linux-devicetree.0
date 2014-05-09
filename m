From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 6/7] clk: sunxi: document PRCM clock
 compatible strings
Date: Fri,  9 May 2014 13:11:50 +0200
Message-ID: <1399633911-7094-7-git-send-email-boris.brezillon@free-electrons.com>
References: <1399633911-7094-1-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBCHQWKNQKGQEPR5E3HI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1399633911-7094-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document new compatible strings for clock provided by the PRCM
(Power/Reset/Clock Management) unit.

Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index a5160d8..d154d9d 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -20,12 +20,16 @@ Required properties:
 	"allwinner,sun5i-a13-ahb-gates-clk" - for the AHB gates on A13
 	"allwinner,sun5i-a10s-ahb-gates-clk" - for the AHB gates on A10s
 	"allwinner,sun7i-a20-ahb-gates-clk" - for the AHB gates on A20
+	"allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
+	"allwinner,sun6i-a31-ahb0-clk" - for the AHB0 multiplexer on A31
 	"allwinner,sun6i-a31-ahb1-mux-clk" - for the AHB1 multiplexer on A31
 	"allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
 	"allwinner,sun4i-a10-apb0-clk" - for the APB0 clock
+	"allwinner,sun6i-a31-apb0-clk" - for the APB0 clock on A31
 	"allwinner,sun4i-a10-apb0-gates-clk" - for the APB0 gates on A10
 	"allwinner,sun5i-a13-apb0-gates-clk" - for the APB0 gates on A13
 	"allwinner,sun5i-a10s-apb0-gates-clk" - for the APB0 gates on A10s
+	"allwinner,sun6i-a31-apb0-gates-clk" - for the APB0 gates on A31
 	"allwinner,sun7i-a20-apb0-gates-clk" - for the APB0 gates on A20
 	"allwinner,sun4i-a10-apb1-clk" - for the APB1 clock
 	"allwinner,sun4i-a10-apb1-mux-clk" - for the APB1 clock muxing
-- 
1.8.3.2
