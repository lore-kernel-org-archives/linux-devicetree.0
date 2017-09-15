From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 3/5] MIPS: jz4780: DTS: Probe the jz4740-watchdog driver from devicetree
Date: Fri, 15 Sep 2017 21:18:36 +0200
Message-ID: <20170915191837.27564-1-malat@debian.org>
References: <20170908183558.1537-3-malat@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908183558.1537-3-malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The jz4740-watchdog driver supports both jz4740 & jz4780.

Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
Changes in v2:
* make the node name generic (Paul Cercueil)

 arch/mips/boot/dts/ingenic/jz4780.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 20e37d2d6008..76055bbc823a 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -263,6 +263,11 @@
 		status = "disabled";
 	};
 
+	watchdog: watchdog@10002000 {
+		compatible = "ingenic,jz4780-watchdog";
+		reg = <0x10002000 0x100>;
+	};
+
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc";
 		reg = <0x13410000 0x10000>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
