From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: psci: Fix indentation in DT bindings
Date: Tue, 15 Dec 2015 09:47:35 +0100
Message-ID: <1450169255-669-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix bogus indentation of the PSCI compatible values (each space was
replaced by a TAB?).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/arm/psci.txt | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/psci.txt b/Documentation/devicetree/bindings/arm/psci.txt
index a9adab84e2feb785..fb3a1dd2a9880bda 100644
--- a/Documentation/devicetree/bindings/arm/psci.txt
+++ b/Documentation/devicetree/bindings/arm/psci.txt
@@ -23,17 +23,17 @@ Main node required properties:
 
  - compatible    : should contain at least one of:
 
-				 * "arm,psci" : for implementations complying to PSCI versions prior to
-					0.2. For these cases function IDs must be provided.
+     * "arm,psci" : for implementations complying to PSCI versions prior to
+	0.2. For these cases function IDs must be provided.
 
-				 * "arm,psci-0.2" : for implementations complying to PSCI 0.2. Function
-					IDs are not required and should be ignored by an OS with PSCI 0.2
-					support, but are permitted to be present for compatibility with
-					existing software when "arm,psci" is later in the compatible list.
+     * "arm,psci-0.2" : for implementations complying to PSCI 0.2. Function
+	IDs are not required and should be ignored by an OS with PSCI 0.2
+	support, but are permitted to be present for compatibility with
+	existing software when "arm,psci" is later in the compatible list.
 
-				* "arm,psci-1.0" : for implementations complying to PSCI 1.0. PSCI 1.0 is
-					backward compatible with PSCI 0.2 with minor specification updates,
-					as defined in the PSCI specification[2].
+    * "arm,psci-1.0" : for implementations complying to PSCI 1.0. PSCI 1.0 is
+	backward compatible with PSCI 0.2 with minor specification updates,
+	as defined in the PSCI specification[2].
 
  - method        : The method of calling the PSCI firmware. Permitted
                    values are:
-- 
1.9.1
