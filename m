From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/8] dt: bindings: ux500: Add documentation for PM domains
Date: Tue, 14 Oct 2014 11:12:54 +0200
Message-ID: <1413277981-27451-2-git-send-email-ulf.hansson@linaro.org>
References: <1413277981-27451-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413277981-27451-1-git-send-email-ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jinkun Hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/ux500/power_domain.txt

diff --git a/Documentation/devicetree/bindings/arm/ux500/power_domain.txt b/Documentation/devicetree/bindings/arm/ux500/power_domain.txt
new file mode 100644
index 0000000..5679d17
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ux500/power_domain.txt
@@ -0,0 +1,35 @@
+* ST-Ericsson UX500 PM Domains
+
+UX500 supports multiple PM domains which are used to gate power to one or
+more peripherals on the SOC.
+
+The implementation of PM domains for UX500 are based upon the generic PM domain
+and use the corresponding DT bindings.
+
+==PM domain providers==
+
+Required properties:
+ - compatible: Must be "stericsson,ux500-pm-domains".
+ - #power-domain-cells : Number of cells in a power domain specifier, must be 1.
+
+Example:
+	pm_domains: pm_domains0 {
+		compatible = "stericsson,ux500-pm-domains";
+		#power-domain-cells = <1>;
+	};
+
+==PM domain consumers==
+
+Required properties:
+ - power-domains: A phandle and PM domain specifier. Below are the list of
+		valid specifiers:
+
+		Index	Specifier
+		-----	---------
+		0	DOMAIN_VAPE
+
+Example:
+	sdi0_per1@80126000 {
+		compatible = "arm,pl18x", "arm,primecell";
+		power-domains = <&pm_domains DOMAIN_VAPE>
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
