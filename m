From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 19/25] dt-bindings: arm: cpus: Add S500 enable-method
Date: Tue, 28 Feb 2017 07:35:29 +0100
Message-ID: <20170228063535.32069-20-afaerber@suse.de>
References: <20170228063535.32069-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170228063535.32069-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Actions Semi S500 SoC requires a special secondary CPU boot procedure.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v3: new
 
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 698ad1f0..e3e1e2f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -192,6 +192,7 @@ nodes to be present and contain the properties described below.
 			     "spin-table"
 			# On ARM 32-bit systems this property is optional and
 			  can be one of:
+			    "actions,s500-smp"
 			    "allwinner,sun6i-a31"
 			    "allwinner,sun8i-a23"
 			    "arm,realview-smp"
-- 
2.10.2
