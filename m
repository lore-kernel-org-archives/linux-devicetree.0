From: Gyungoh Yoo <gyungoh@gmail.com>
Subject: [RESUBMIT PATCH v4 8/8] devicetree: regulator: sky81452: Add compatible string for device binding
Date: Mon, 13 Oct 2014 14:47:42 +0900
Message-ID: <1413179262-27636-9-git-send-email-jack.yoo@skyworksinc.com>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
 <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, lee.jones@linaro.org, jg1.han@samsung.com, cooloney@gmail.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, shawn.guo@freescale.com, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
---
Changes v4:
Nothing

Changes v3:
Nothing

Changes v2:
Added 'compatible' attribute in the driver

 Documentation/devicetree/bindings/regulator/sky81452-regulator.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
index 882455e..7b9ff18 100644
--- a/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
@@ -1,6 +1,7 @@
 SKY81452 voltage regulator
 
 Required properties:
+- compatible	: Must be "skyworks,sky81452-regulator"
 - any required generic properties defined in regulator.txt
 
 Optional properties:
@@ -9,6 +10,7 @@ Optional properties:
 Example:
 
 	regulator {
+		compatible = "skyworks,sky81452-regulator";
 		/* generic regulator properties */
 		regulator-name = "touch_en";
 		regulator-min-microvolt = <4500000>;
-- 
1.9.1
