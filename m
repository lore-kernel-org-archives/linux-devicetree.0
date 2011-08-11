From: Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] Add interrupts property to L2x0 OF binding
Date: Thu, 11 Aug 2011 15:01:56 +0100
Message-ID: <1313071316-3363-1-git-send-email-mark.rutland@arm.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Barry Song <21cnbao@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Following the discussion here:
http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-August/007301.html

The L2x0 L2 Cache Controllers support a combined interrupt line
which can be used for several events (e.g. read/write/parity errors on
tag/data RAM, event counter increment/overflow). Unfortunately the
OF binding does not represent the interrupt.

This patch adds an "interrupts" property to the L2x0 OF binding,
representing the combined interrupt line.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
Cc: Barry Song <21cnbao@gmail.com>
Cc: Will Deacon <will.deacon@arm.com>
---
 Documentation/devicetree/bindings/arm/l2cc.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
index f50e021..7ca5216 100644
--- a/Documentation/devicetree/bindings/arm/l2cc.txt
+++ b/Documentation/devicetree/bindings/arm/l2cc.txt
@@ -28,6 +28,7 @@ Optional properties:
 - arm,filter-ranges : <start length> Starting address and length of window to
   filter. Addresses in the filter window are directed to the M1 port. Other
   addresses will go to the M0 port.
+- interrupts : 1 combined interrupt.
 
 Example:
 
@@ -39,4 +40,5 @@ L2: cache-controller {
         arm,filter-latency = <0x80000000 0x8000000>;
         cache-unified;
         cache-level = <2>;
+	interrupts = <45>;
 };
-- 
1.7.0.4
