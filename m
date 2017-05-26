From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/6] dt-bindings: mfd: Add hi6421v530 bindings
Date: Fri, 26 May 2017 14:35:13 +0800
Message-ID: <20170526063518.21246-2-guodong.xu@linaro.org>
References: <20170526063518.21246-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170526063518.21246-1-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DT bindings for hisilicon HI655x PMIC chip.

Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/mfd/hisilicon,hi6421v530.txt          | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt
new file mode 100644
index 0000000..6ffe6f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt
@@ -0,0 +1,25 @@
+Hisilicon Hi6421v530 Power Management Integrated Circuit (PMIC)
+
+The hardware layout for access PMIC Hi6421v530 from AP SoC Hi3660.
+Between PMIC Hi6421v530 and Hi3660, the physical signal channel is SSI.
+We can use memory-mapped I/O to communicate.
+
++----------------+             +-------------+
+|                |             |             |
+|    Hi3660      |   SSI bus   |  Hi6421v530 |
+|                |-------------|             |
+|                |(REGMAP_MMIO)|             |
++----------------+             +-------------+
+
+Required properties:
+- compatible:           Should be "hisilicon,hi6421v530-pmic".
+- reg:                  Base address of PMIC on Hi3660 SoC.
+- interrupt-controller: Hi6421v530 has internal IRQs (has own IRQ domain).
+
+Example:
+	pmic: pmic@fff34000 {
+		compatible = "hisilicon,hi6421v530-pmic";
+		reg = <0x0 0xfff34000 0x0 0x1000>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	}
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
