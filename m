From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: Document ibm,cffps compatible string
Date: Wed,  9 Oct 2019 14:11:01 -0500
Message-ID: <1570648262-25383-2-git-send-email-eajames@linux.ibm.com>
References: <1570648262-25383-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570648262-25383-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net, mark.rutland@arm.com, robh+dt@kernel.org, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Document this string that indicates that any version of the power supply
may be connected. In this case, the driver must detect the version
automatically.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
index 1036f65..d9a2719 100644
--- a/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
+++ b/Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt
@@ -5,6 +5,9 @@ Required properties:
  - compatible				: Must be one of the following:
 						"ibm,cffps1"
 						"ibm,cffps2"
+						or "ibm,cffps" if the system
+						must support any version of the
+						power supply
  - reg = < I2C bus address >;		: Address of the power supply on the
 					  I2C bus.
 
-- 
1.8.3.1
