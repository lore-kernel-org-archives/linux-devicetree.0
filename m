From: Velibor Markovski <velibor.markovski@broadcom.com>
Subject: [PATCH 1/2] dt-bindings: arm-ccn: Add bindings info for CCN-502 compatible string
Date: Fri, 10 Feb 2017 12:42:47 -0800
Message-ID: <1486759368-24067-2-git-send-email-velibor.markovski@broadcom.com>
References: <1486759368-24067-1-git-send-email-velibor.markovski@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486759368-24067-1-git-send-email-velibor.markovski@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Velibor Markovski <velibor.markovski@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add CCN-502 to the list of supported devices by ARM CCN PMU driver.

Signed-off-by: Velibor Markovski <velibor.markovski@broadcom.com>
---
 Documentation/devicetree/bindings/arm/ccn.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ccn.txt b/Documentation/devicetree/bindings/arm/ccn.txt
index b100d38..2980145 100644
--- a/Documentation/devicetree/bindings/arm/ccn.txt
+++ b/Documentation/devicetree/bindings/arm/ccn.txt
@@ -3,6 +3,7 @@
 Required properties:
 
 - compatible: (standard compatible string) should be one of:
+	"arm,ccn-502"
 	"arm,ccn-504"
 	"arm,ccn-508"
 
-- 
1.9.1
