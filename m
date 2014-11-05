From: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 2/3] dt-bindings: Add Reset Controller for MediaTek SoC
Date: Wed, 5 Nov 2014 22:21:31 +0800
Message-ID: <1415197292-10546-3-git-send-email-flora.fu@mediatek.com>
References: <1415197292-10546-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415197292-10546-1-git-send-email-flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings.

Signed-off-by: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/reset/mediatek,reset.txt   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,reset.txt

diff --git a/Documentation/devicetree/bindings/reset/mediatek,reset.txt b/Documentation/devicetree/bindings/reset/mediatek,reset.txt
new file mode 100644
index 0000000..a876407
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/mediatek,reset.txt
@@ -0,0 +1,50 @@
+MediaTek SoC Reset Controller
+======================================
+The reset controller driver accesses registers through the syscon regmap. It
+is a child node of syscon.
+
+Required properties:
+- compatible : "mediatek,reset"
+- #reset-cells: 1
+- reg: The register region can be accessed from syscon. The first parameter is
+  reset base address offset. The second parameter is byte width of reset registers.
+
+example:
+infracfg: syscon@10001000 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "mediatek,mt8135-infracfg", "syscon";
+	reg = <0 0x10001000 0 0x1000>;
+
+	infrarst: reset-controller@30 {
+		#reset-cells = <1>;
+		compatible = "mediatek,mt8135-infracfg-reset", "mediatek,reset";
+		reg = <0x30 0x8>;
+	};
+};
+
+Specifying reset lines connected to IP modules
+==============================================
+
+The reset controller(mtk-reset) manages various reset sources. Those device nodes should
+specify the reset line on the rstc in their resets property, containing a phandle to the
+rstc device node and a RESET_INDEX specifying which module to reset, as described in
+reset.txt.
+
+For MediaTek SoC, RESET_INDEX is reset bit defined in INFRACFG or PERICFG registers.
+
+example:
+pwrap: pwrap@1000f000 {
+	compatible = "mediatek,mt8135-pwrap";
+	reg = <0 0x1000f000 0 0x1000>,
+		<0 0x11017000 0 0x1000>;
+	reg-names = "pwrap-base",
+		"pwrap-bridge-base";
+	resets = <&infrarst MT8135_INFRA_PMIC_WRAP_RST>,
+		<&perirst MT8135_PERI_PWRAP_BRIDGE_SW_RST>;
+	reset-names = "infrarst", "perirst";
+};
+
+Definitions for the supported resets by IC:
+MT8135:
+include/dt-bindings/reset-controller/mt8135-resets.h
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
