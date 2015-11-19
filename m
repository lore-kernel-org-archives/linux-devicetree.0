From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: add document of mediatek efuse driver
Date: Thu, 19 Nov 2015 18:46:52 +0800
Message-ID: <1447930014-19579-2-git-send-email-andrew-ct.chen@mediatek.com>
References: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447930014-19579-1-git-send-email-andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Mediatek MT8173 EFUSE Devicetree binding file

Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
new file mode 100644
index 0000000..74cf529
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
@@ -0,0 +1,36 @@
+= Mediatek MTK-EFUSE device tree bindings =
+
+This binding is intended to represent MTK-EFUSE which is found in most Mediatek SOCs.
+
+Required properties:
+- compatible: should be "mediatek,mt8173-efuse" or "mediatek,efuse"
+- reg: Should contain registers location and length
+
+= Data cells =
+Are child nodes of MTK-EFUSE, bindings of which as described in
+bindings/nvmem/nvmem.txt
+
+Example:
+
+	efuse: efuse@10206000 {
+		compatible = "mediatek,mt8173-efuse";
+		reg	   = <0 0x10206000 0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* Data cells */
+		thermal_calibration: calib@528 {
+			reg = <0x528 0xc>;
+		};
+	};
+
+= Data consumers =
+Are device nodes which consume nvmem data cells.
+
+For example:
+
+	thermal {
+		...
+		nvmem-cells = <&thermal_calibration>;
+		nvmem-cell-names = "calibration";
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
