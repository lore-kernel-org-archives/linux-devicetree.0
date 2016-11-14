From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3 2/3] ARM: imx: mach-imx6ul: add imx6ull support
Date: Mon, 14 Nov 2016 15:04:21 +0800
Message-ID: <1479107062-15365-3-git-send-email-peter.chen@nxp.com>
References: <1479107062-15365-1-git-send-email-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479107062-15365-1-git-send-email-peter.chen-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

imx6ull is derived SoC from imx6ul.

Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/mach-imx/mach-imx6ul.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/mach-imx6ul.c b/arch/arm/mach-imx/mach-imx6ul.c
index 58a2b88..6cb8a22 100644
--- a/arch/arm/mach-imx/mach-imx6ul.c
+++ b/arch/arm/mach-imx/mach-imx6ul.c
@@ -89,6 +89,7 @@ static void __init imx6ul_init_late(void)
 
 static const char * const imx6ul_dt_compat[] __initconst = {
 	"fsl,imx6ul",
+	"fsl,imx6ull",
 	NULL,
 };
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
