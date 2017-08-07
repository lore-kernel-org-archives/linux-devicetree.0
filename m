From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/10] ARM: dts: imx6q-apalis-ixora: get rid of obsolete fusion comment
Date: Mon,  7 Aug 2017 12:52:38 +0530
Message-ID: <8281d802e666368f5de0f5c982a39019daecccd4.1502087184.git.maitysanchayan@gmail.com>
References: <cover.1502087184.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-apalis-ixora.dts | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
index a91043d5ac20..ebe5b909c6f9 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -271,10 +271,7 @@
 };
 
 &iomuxc {
-	/*
-	 * Mux the Apalis GPIOs
-	 * GPIO5, 6 used by optional fusion_F0710A kernel module
-	 */
+	/* Mux the Apalis GPIOs */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_apalis_gpio1 &pinctrl_apalis_gpio2
 		     &pinctrl_apalis_gpio3 &pinctrl_apalis_gpio4
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
