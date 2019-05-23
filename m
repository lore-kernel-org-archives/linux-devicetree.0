From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] dt-bindings: arm: fix the document ID for SCMI protocol
 documentation
Date: Thu, 23 May 2019 11:23:35 +0000
Message-ID: <20190523112312.24529-1-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "trivial@kernel.org" <trivial@kernel.org>, Rob Herring <robh+dt@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com

arm,scmi.txt used the wrong document identifier. "ARM DUI 0922B" is
the "ARM Compute Subsystem SCP, Message Interface Protocols". What we
need is the ARM DEN 0056A - "ARM System Control and Management
Interface Platform Design Document".

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 Documentation/devicetree/bindings/arm/arm,scmi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,scmi.txt b/Documentation/devicetree/bindings/arm/arm,scmi.txt
index 5f3719ab7075..317a2fc3667a 100644
--- a/Documentation/devicetree/bindings/arm/arm,scmi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scmi.txt
@@ -6,7 +6,7 @@ that are provided by the hardware platform it is running on, including power
 and performance functions.
 
 This binding is intended to define the interface the firmware implementing
-the SCMI as described in ARM document number ARM DUI 0922B ("ARM System Control
+the SCMI as described in ARM document number ARM DEN 0056A ("ARM System Control
 and Management Interface Platform Design Document")[0] provide for OSPM in
 the device tree.
 
-- 
2.21.0
