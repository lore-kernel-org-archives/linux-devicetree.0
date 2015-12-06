From: alchaiken-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 2/2] ARM: dts: imx6qdl-sabreauto: enable partitions for parallel NOR
Date: Sat,  5 Dec 2015 19:30:57 -0800
Message-ID: <1449372657-18496-3-git-send-email-alison_chaiken@mentor.com>
References: <1449372657-18496-1-git-send-email-alison_chaiken@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449372657-18496-1-git-send-email-alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Add a 'partitions' property to the nor child of the WEIM bus so
that ofpart will allow partiton creation.

Signed-off-by: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index 530b4d6..10293f2 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -626,5 +626,9 @@
 		fsl,weim-cs-timing = <0x00620081 0x00000001 0x1c022000
 				0x0000c000 0x1404a38e 0x00000000>;
 		nor-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
+		partitions@0 {
+			label = "pnor";
+			reg = <0x0 0x1000000>;
+		};
 	};
 };
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
