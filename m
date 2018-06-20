From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 03/15] dt-bindings: qcom_nandc: update for ECC strength and
 step size
Date: Wed, 20 Jun 2018 12:57:30 +0530
Message-ID: <1529479662-4026-4-git-send-email-absahu@codeaurora.org>
References: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Andy Gross <andy.gross@linaro.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

1. If nand-ecc-strength specified in DT, then controller will use
   this ECC strength otherwise ECC strength will be calculated
   according to chip requirement and available OOB size.

2. QCOM NAND controller supports only one step size (512 bytes) but
   nand-ecc-step-size is required property in DT. This DT property
   can be removed and ecc step size can be assigned in driver with
   512 bytes value.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v3:

1. Clubbed following 2 patches into one
   https://patchwork.ozlabs.org/patch/920465/
   https://patchwork.ozlabs.org/patch/920467/

* Changes from v2:
  NONE

* Changes from v1:
  NEW PATCH

 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 73d336be..1123cc6 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -45,11 +45,12 @@ Required properties:
 			number (e.g., 0, 1, 2, etc.)
 - #address-cells:	see partition.txt
 - #size-cells:		see partition.txt
-- nand-ecc-strength:	see nand.txt
-- nand-ecc-step-size:	must be 512. see nand.txt for more details.
 
 Optional properties:
 - nand-bus-width:	see nand.txt
+- nand-ecc-strength:	see nand.txt. If not specified, then ECC strength will
+			be used according to chip requirement and available
+			OOB size.
 
 Each nandcs device node may optionally contain a 'partitions' sub-node, which
 further contains sub-nodes describing the flash partition mapping. See
@@ -77,7 +78,6 @@ nand-controller@1ac00000 {
 		reg = <0>;
 
 		nand-ecc-strength = <4>;
-		nand-ecc-step-size = <512>;
 		nand-bus-width = <8>;
 
 		partitions {
@@ -117,7 +117,6 @@ nand-controller@79b0000 {
 	nand@0 {
 		reg = <0>;
 		nand-ecc-strength = <4>;
-		nand-ecc-step-size = <512>;
 		nand-bus-width = <8>;
 
 		partitions {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
