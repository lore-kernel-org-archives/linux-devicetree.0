From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 3/4] dt-bindings: Add optional label property for ina2xx
Date: Tue, 20 Aug 2019 16:11:40 +0200
Message-ID: <3c56deb8cc1842d2915b203e622be1eb442414de.1566310292.git.michal.simek@xilinx.com>
References: <cover.1566310292.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1566310292.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1566310292.git.michal.simek@xilinx.com>
References: <cover.1566310292.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Using optional "label" property is adding an option to user to use better
name for device identification.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 Documentation/devicetree/bindings/hwmon/ina2xx.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
index 02af0d94e921..d15bf7e46fd7 100644
--- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
@@ -14,6 +14,8 @@ Optional properties:
 
 - shunt-resistor
 	Shunt resistor value in micro-Ohm
+- label
+	Symbolic name for a power monitor
 
 Example:
 
-- 
2.17.1
