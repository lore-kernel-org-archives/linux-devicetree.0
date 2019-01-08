From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 1/3] dt-bindings: clock: ti,
 sci-clk: Add support for parsing clock info from DT
Date: Tue, 8 Jan 2019 15:30:21 +0200
Message-ID: <1546954223-9738-2-git-send-email-t-kristo@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

By default, the available clock info is queried from firmware, which can
be quite a lengthy operation if there is a very large amount of clocks
available. Add option for parsing the used clocks from DT instead, and
only register these which can improve the boot time of the device quite
a lot.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 Documentation/devicetree/bindings/clock/ti,sci-clk.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
index 4e59dc6..c757ae1 100644
--- a/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
+++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.txt
@@ -18,6 +18,13 @@ Required properties:
   and clocks IDs for 66AK2G SoC are documented at
   http://processors.wiki.ti.com/index.php/TISCI#66AK2G02_Data
 
+Optional properties:
+-------------------
+- ti,scan-clocks-from-dt: Scan clock tree info from DT. By default,
+  clocks are queried from firmware, which can be rather slow operation,
+  especially if there is a really large number of clocks available out
+  of which only a handful are ever used by kernel.
+
 Examples:
 --------
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
