From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH] spi/atmel: document clock properties
Date: Tue, 17 Dec 2013 12:01:34 +0100
Message-ID: <1387278095-5118-1-git-send-email-b.brezillon@overkiz.com>
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
To: Rob Landley <rob@landley.net>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon@overkiz.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the clock properties required by the spi-atmel driver.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 .../devicetree/bindings/spi/spi_atmel.txt          |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi_atmel.txt b/Documentation/devicetree/bindings/spi/spi_atmel.txt
index 07e04cd..4f8184d 100644
--- a/Documentation/devicetree/bindings/spi/spi_atmel.txt
+++ b/Documentation/devicetree/bindings/spi/spi_atmel.txt
@@ -5,6 +5,9 @@ Required properties:
 - reg: Address and length of the register set for the device
 - interrupts: Should contain spi interrupt
 - cs-gpios: chipselects
+- clock-names: tuple listing input clock names.
+	Required elements: "spi_clk"
+- clocks: phandles to input clocks.
 
 Example:
 
@@ -14,6 +17,8 @@ spi1: spi@fffcc000 {
 	interrupts = <13 4 5>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	clocks = <&spi1_clk>;
+	clock-names = "spi_clk";
 	cs-gpios = <&pioB 3 0>;
 	status = "okay";
 
-- 
1.7.9.5
