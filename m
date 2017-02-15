From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 02/11] Documentation: devicetree: arm: Document Actions Semi S500
Date: Wed, 15 Feb 2017 17:55:19 +0100
Message-ID: <20170215165528.10052-3-afaerber@suse.de>
References: <20170215165528.10052-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170215165528.10052-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: contact@linux-xapple.org, mp-cs@actions-semi.com, info@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/arm/acts.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/acts.txt

diff --git a/Documentation/devicetree/bindings/arm/acts.txt b/Documentation/devicetree/bindings/arm/acts.txt
new file mode 100644
index 0000000..a34d647
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/acts.txt
@@ -0,0 +1,19 @@
+Actions Semi platforms device tree bindings
+-------------------------------------------
+
+
+S500 SoC
+========
+
+Required root node properties:
+
+ - compatible :  "acts,s500"
+
+
+Modules:
+
+ - LeMaker Guitar: "lemaker,guitar"
+
+Boards:
+
+ - LeMaker Guitar Base Board rev. B: "lemaker,guitar-bb-rev-b", "lemaker,guitar"
-- 
2.10.2
