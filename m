From: Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: msi: Correct msi-controller@c's reg
Date: Sun, 28 Jul 2019 02:30:18 -0700
Message-ID: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The base address of msi-controller@c should be set to c.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 Documentation/devicetree/bindings/interrupt-controller/msi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/msi.txt b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
index c60c034..c20b51d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/msi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/msi.txt
@@ -98,7 +98,7 @@ Example
 	};
 
 	msi_c: msi-controller@c {
-		reg = <0xb 0xf00>;
+		reg = <0xc 0xf00>;
 		compatible = "vendor-b,another-controller";
 		msi-controller;
 		/* Each device has some unique ID */
-- 
2.7.4
