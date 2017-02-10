From: Velibor Markovski <velibor.markovski@broadcom.com>
Subject: [PATCH INTERNAL 1/2] dt-bindings: arm-ccn: Add bindings info for
 CCN-502 compatible string
Date: Fri, 10 Feb 2017 12:36:26 -0800
Message-ID: <1486758987-23769-2-git-send-email-velibor.markovski@broadcom.com>
References: <1486758987-23769-1-git-send-email-velibor.markovski@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486758987-23769-1-git-send-email-velibor.markovski@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Velibor Markovski <velibor.markovski@broadcom.com>, linux-arm-kernel@lists.infradead.org
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
