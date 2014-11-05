From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 02/11] mfd: syscon: Add Atmel Matrix bus DT binding
 documentation
Date: Wed,  5 Nov 2014 17:01:18 +0100
Message-ID: <1415203287-21517-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Matrix registers are provided to configure internal bus behavior on
at91 SoCs.
Some registers might be access by several drivers (e.g. to configure
external memory bus timings), hence we declare this register set as a
syscon device.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/mfd/atmel-matrix.txt       | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel-matrix.txt

diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
new file mode 100644
index 0000000..405cac9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
@@ -0,0 +1,24 @@
+* Device tree bindings for Atmel Bus Matrix
+
+The Bus Matrix registers are used to configure Atmel SoCs internal bus
+behavior (master/slave priorities, undefined burst length type, ...)
+
+Required properties:
+- compatible:		should be one of the following
+			"atmel,at91sam9260-matrix", "syscon"
+			"atmel,at91sam9261-matrix", "syscon"
+			"atmel,at91sam9263-matrix", "syscon"
+			"atmel,at91sam9263-matrix", "syscon"
+			"atmel,at91sam9g45-matrix", "syscon"
+			"atmel,at91sam9n12-matrix", "syscon"
+			"atmel,at91sam9x5-matrix", "syscon"
+			"atmel,sama5d3-matrix", "syscon"
+- reg:			contains offset/length value of the Bus Matrix
+			memory region.
+
+Example:
+
+matrix: matrix@ffffec00 {
+	compatible = "atmel,sama5d3-matrix", "syscon";
+	reg = <0xffffec00 0x200>;
+};
-- 
1.9.1
