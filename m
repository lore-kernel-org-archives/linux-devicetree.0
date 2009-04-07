From: Stefan Roese <sr@denx.de>
Subject: [PATCH 4/4 v2] mtd/powerpc: Describe multiple "reg" tuples usage
Date: Tue,  7 Apr 2009 10:39:43 +0200
Message-ID: <1239093583-12201-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Stefan Roese <sr@denx.de>
CC: Grant Likely <grant.likely@secretlab.ca>
---
 Documentation/powerpc/dts-bindings/mtd-physmap.txt |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/Documentation/powerpc/dts-bindings/mtd-physmap.txt b/Documentation/powerpc/dts-bindings/mtd-physmap.txt
index ab1115e..a3fa9e0 100644
--- a/Documentation/powerpc/dts-bindings/mtd-physmap.txt
+++ b/Documentation/powerpc/dts-bindings/mtd-physmap.txt
@@ -5,7 +5,10 @@ file systems on embedded devices.
 
  - compatible : should contain the specific model of flash chip(s)
    used, if known, followed by either "cfi-flash" or "jedec-flash"
- - reg : Address range of the flash chip
+ - reg : Address range(s) of the flash chip(s)
+   It's possible to (optionally) define multiple "reg" tuples so that the
+   Intel P30 48F4400 chip which consists internally of 2 non-identical
+   NOR chips on one die can also be supported.
  - bank-width : Width (in bytes) of the flash bank.  Equal to the
    device width times the number of interleaved chips.
  - #address-cells, #size-cells : Must be present if the flash has
@@ -58,3 +61,18 @@ Example:
 			read-only;
 		};
 	};
+
+Here an example with multiple "reg" tuples (e.g. Intel P30):
+
+	flash@f0000000,0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "cfi-flash";
+		reg = <0 0x00000000 0x02000000
+		       0 0x02000000 0x02000000>;
+		bank-width = <2>;
+		partition@0 {
+			label = "test-part1";
+			reg = <0 0x04000000>;
+		};
+	};
-- 
1.6.2.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
