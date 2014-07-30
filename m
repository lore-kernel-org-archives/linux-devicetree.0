From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] regulator: userspace-consumer: add DT binding details
Date: Wed, 30 Jul 2014 19:24:00 +0530
Message-ID: <1406728440-17837-2-git-send-email-ldewangan@nvidia.com>
References: <1406728440-17837-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406728440-17837-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add DT binding document and details DT binding for the driver
regulator/userspace-consumer.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../bindings/regulator/userspace-consumer.txt      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/userspace-consumer.txt

diff --git a/Documentation/devicetree/bindings/regulator/userspace-consumer.txt b/Documentation/devicetree/bindings/regulator/userspace-consumer.txt
new file mode 100644
index 0000000..73c651c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/userspace-consumer.txt
@@ -0,0 +1,26 @@
+Userspace consumer regulators
+
+Required properties:
+- compatible		: Must be "reg-userspace-consumer".
+- regulator-supplies: Supply names for this regulator. This can be
+	multiple strings.
+
+Optional properties:
+- regulator-name: Name of the consumer line.
+- regulator-boot-on: Enable regulator on booting.
+
+With all supply names, there should be <supply-name>-supply to pass regulators
+handle as defined in regulator.txt.
+
+Example:
+
+	userspace-consumer {
+		compatible = "reg-userspace-consumer";
+
+		regulator-name = "gps-consumer";
+		regulator-boot-on;
+		regulator-supplies = "vdd", "vcc", "vdd-3v3";
+		vdd-supply = <&reg1>;
+		vcc-supply = <&reg2>;
+		vdd-3v3-supply = <&reg3>;
+	};
-- 
1.8.1.5
