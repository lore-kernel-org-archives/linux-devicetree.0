From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 5/6] documentation: Add nvmem bindings documentation
Date: Wed, 29 Jun 2016 14:34:15 +0200
Message-ID: <1467203656-14381-6-git-send-email-carlo@caione.org>
References: <1467203656-14381-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467203656-14381-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bjdooks-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

This patch add the bindings document of Amlogic eFuse driver.

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/nvmem/amlogic-efuse.txt    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
new file mode 100644
index 0000000..fafd85b
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
@@ -0,0 +1,39 @@
+= Amlogic eFuse device tree bindings =
+
+Required properties:
+- compatible: should be "amlogic,meson-gxbb-efuse"
+
+= Data cells =
+Are child nodes of eFuse, bindings of which as described in
+bindings/nvmem/nvmem.txt
+
+Example:
+
+	efuse: efuse {
+		compatible = "amlogic,meson-gxbb-efuse";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		sn: sn@14 {
+			reg = <0x14 0x10>;
+		};
+
+		eth_mac: eth_mac@34 {
+			reg = <0x34 0x10>;
+		};
+
+		bid: bid@46 {
+			reg = <0x46 0x30>;
+		};
+	};
+
+= Data consumers =
+Are device nodes which consume nvmem data cells.
+
+For example:
+
+	eth_mac {
+		...
+		nvmem-cells = <&eth_mac>;
+		nvmem-cell-names = "eth_mac";
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
