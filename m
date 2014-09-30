From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 4/6] hwrng: atmel: Add TRNG DT binding doc
Date: Tue, 30 Sep 2014 18:19:45 +0200
Message-ID: <1412093987-30241-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Peter Korsgaard <jacmet@sunsite.dk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document DT bindings of Atmel's TRNG (True Random Number Generator) IP.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/devicetree/bindings/hwrng/atmel-trng.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwrng/atmel-trng.txt

diff --git a/Documentation/devicetree/bindings/hwrng/atmel-trng.txt b/Documentation/devicetree/bindings/hwrng/atmel-trng.txt
new file mode 100644
index 0000000..4ac5aaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwrng/atmel-trng.txt
@@ -0,0 +1,16 @@
+Atmel TRNG (True Random Number Generator) block
+
+Required properties:
+- compatible : Should be "atmel,at91sam9g45-trng"
+- reg : Offset and length of the register set of this block
+- interrupts : the interrupt number for the TRNG block
+- clocks: should contain the TRNG clk source
+
+Example:
+
+trng@fffcc000 {
+	compatible = "atmel,at91sam9g45-trng";
+	reg = <0xfffcc000 0x4000>;
+	interrupts = <6 IRQ_TYPE_LEVEL_HIGH 0>;
+	clocks = <&trng_clk>;
+};
-- 
1.9.1
