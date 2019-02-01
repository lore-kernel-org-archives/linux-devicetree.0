From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] mtd: add DT bindings for the Intel IXP4xx Flash
Date: Fri,  1 Feb 2019 11:04:20 +0100
Message-ID: <20190201100421.27504-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Intel IXP4xx
flash controller, a simple physmap which however need a
specific big-endian or mixed-endian access pattern to the
memory.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/mtd/intel,ixp4xx-flash.txt       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt b/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
new file mode 100644
index 000000000000..4bdcb92ae381
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt
@@ -0,0 +1,22 @@
+Flash device on Intel IXP4xx SoC
+
+This flash is regular CFI compatible (Intel or AMD extended) flash chips with
+specific big-endian or mixed-endian memory access pattern.
+
+Required properties:
+- compatible : must be "intel,ixp4xx-flash", "cfi-flash";
+- reg : memory address for the flash chip
+- bank-width : width in bytes of flash interface, should be <2>
+
+For the rest of the properties, see mtd-physmap.txt.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+flash@50000000 {
+	compatible = "intel,ixp4xx-flash", "cfi-flash";
+	reg = <0x50000000 0x01000000>;
+	bank-width = <2>;
+};
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
