From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 10/10] tpm/st33zp24/dts/st33zp24-spi: Add dts documentation for st33zp24 spi phy
Date: Tue, 13 Jan 2015 23:13:18 +0100
Message-ID: <1421187198-8503-11-git-send-email-christophe-h.ricard@st.com>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 .../bindings/security/tpm/st33zp24-spi.txt         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt

diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt b/Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt
new file mode 100644
index 0000000..923c55d
--- /dev/null
+++ b/Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt
@@ -0,0 +1,34 @@
+* STMicroelectronics SAS. ST33ZP24 TPM SoC
+
+Required properties:
+- compatible: Should be "st,st33zp24-spi".
+- spi-max-frequency: Maximum SPI frequency (<= 10000000).
+
+Optional ST33ZP24 Properties:
+- interrupt-parent: phandle for the interrupt gpio controller
+- interrupts: GPIO interrupt to which the chip is connected
+- lpcpd-gpios: Output GPIO pin used for ST33ZP24 power management D1/D2 state.
+If set, power must be present when the platform is going into sleep/hibernate mode.
+
+Optional SoC Specific Properties:
+- pinctrl-names: Contains only one value - "default".
+- pintctrl-0: Specifies the pin control groups used for this controller.
+
+Example (for ARM-based BeagleBoard xM with ST33ZP24 on SPI2):
+
+&i2c2 {
+
+        status = "okay";
+
+        st33zp24@0 {
+
+                compatible = "st,st33zp24-spi";
+
+                spi-max-frequency = <10000000>;
+
+                interrupt-parent = <&gpio5>;
+                interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+
+                lpcpd-gpios = <&gpio5 15 GPIO_ACTIVE_HIGH>;
+        };
+};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
