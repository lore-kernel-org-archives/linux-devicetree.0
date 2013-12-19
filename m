From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] mfd: AS3722: add dt node properties for system power controller
Date: Thu, 19 Dec 2013 18:27:00 +0530
Message-ID: <1387457821-12509-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: anton@enomsg.org, dwmw2@infradead.org
Cc: mark.rutland@arm.com, rob@landley.net, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

ams AS3722 device supports the power off by turning off its all rails.

Add dt node properties to enable this functionality on this device.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 Documentation/devicetree/bindings/mfd/as3722.txt |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Documentation/devicetree/bindings/mfd/as3722.txt
index fc2191e..1e54937 100644
--- a/Documentation/devicetree/bindings/mfd/as3722.txt
+++ b/Documentation/devicetree/bindings/mfd/as3722.txt
@@ -112,6 +112,15 @@ Following are properties of regulator subnode.
 		ams,enable-tracking: Enable tracking with SD1, only supported
 			by LDO3.
 
+Power-off:
+=========
+AS3722 supports the system power off by turning off all its rail. The power off
+is provided through pm power off.
+The device node should have the following properties to enable power-off
+functionality from ams AS3722:
+ams,system-power-controller: To enable the power off functionality through
+	device.
+
 Example:
 --------
 #include <dt-bindings/mfd/as3722.h>
-- 
1.7.9.5
