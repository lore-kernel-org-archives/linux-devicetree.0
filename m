From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 5/8] mtd: nand: stm_nand_bch: provide Device Tree documentation
Date: Mon, 18 Aug 2014 11:31:56 +0100
Message-ID: <1408357919-19793-6-git-send-email-lee.jones@linaro.org>
References: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, pekon@pek-sem.com, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

This is where we describe the different new and generic options used by
the ST BCH driver.

Cc: devicetree@vger.kernel.org
Reviewed-By: Pekon Gupta <pekon@pek-sem.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mtd/stm-nand.txt | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/stm-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/stm-nand.txt b/Documentation/devicetree/bindings/mtd/stm-nand.txt
new file mode 100644
index 0000000..5872a39
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/stm-nand.txt
@@ -0,0 +1,74 @@
+STM BCH NAND Support
+--------------------
+
+Required properties:
+
+- compatible		: Should be "st,nand-bch"
+- reg			: Should contain register's location and length
+- reg-names		: "emi_nand" - NAND Controller register map
+			  "emiss" - External Memory Interface Subsystem base
+- interrupts		: Interrupt number
+- interrupt-names	: "nand_irq" - NAND Controller IRQ
+- st,nand-banks		: Subnode representing one or more "banks" of NAND
+			  Flash, connected to an STM NAND Controller (see
+			  description below).
+- nand-ecc-strength	: Generic NAND property (See mtd/nand.txt)
+			  Options are; 0, 18 or 30. If not present, the driver
+			  will choose the strongest scheme compatible if the
+			  OOB size.
+
+Properties describing Bank of NAND Flash ("st,nand-banks"):
+
+- st,nand-csn		: Chip select associated with the Bank.
+
+- st,nand-timing-relax	: [Optional] Number of IP clock cycles by which to
+			  "relax" timing configuration.  Required on some boards
+			  to accommodate board-level limitations. Applies to
+			  ONFI timing mode configuration.
+
+- nand-on-flash-bbt	: Generic NAND property (See mtd/nand.txt)
+
+- partitions		: [Optional] Subnode describing MTD partition map
+			  (see mtd/partition.txt)
+
+Note, during initialisation, the NAND Controller timing registers are configured
+according to one of the following methods, in order of precedence:
+
+	   1. Configuration based on ONFI timing mode, as advertised by the
+	      device during ONFI-probing (ONFI-compliant NAND only).
+
+	   2. Use reset/safe timing values
+
+Example:
+
+	nand@fe901000 {
+		compatible = "st,nand-bch";
+		reg = <0xfe901000 0x1000>, <0xfef00800 0x0800>;
+		reg-names = "emi_nand", "emiss";
+		interrupts = <0 139 0x0>;
+		interrupt-names = "nand_irq";
+		nand-ecc-strength = <30>;
+
+		status = "okay";
+
+		bank0 {
+			/* NAND_BBT_USE_FLASH */
+			nand-on-flash-bbt;
+			st,nand-csn		= <0>;
+
+			partitions {
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				partition@0{
+					label = "NANDFlash1";
+					reg = <0x00000000 0x00800000>;
+				};
+
+				partition@800000{
+					label = "NANDFlash2";
+					reg = <0x00800000 0x0f800000>;
+				};
+			};
+		};
+	};
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
