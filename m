From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 03/14] dt-bindings: qcom_nandc: make nand-ecc-strength
 optional
Date: Thu,  3 May 2018 17:50:30 +0530
Message-ID: <1525350041-22995-4-git-send-email-absahu@codeaurora.org>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Richard Weinberger <richard@nod.at>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Andy Gross <andy.gross@linaro.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Now, nand-ecc-strength is optional. If specified in DT, then
controller will use this ECC strength otherwise ECC strength will
be calculated according to chip requirement and available OOB size.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
* Changes from v1:

  NEW PATCH

 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 73d336be..f246aa0 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -45,11 +45,13 @@ Required properties:
 			number (e.g., 0, 1, 2, etc.)
 - #address-cells:	see partition.txt
 - #size-cells:		see partition.txt
-- nand-ecc-strength:	see nand.txt
 - nand-ecc-step-size:	must be 512. see nand.txt for more details.
 
 Optional properties:
 - nand-bus-width:	see nand.txt
+- nand-ecc-strength:	see nand.txt. If not specified, then ECC strength will
+			be used according to chip requirement and available
+			OOB size.
 
 Each nandcs device node may optionally contain a 'partitions' sub-node, which
 further contains sub-nodes describing the flash partition mapping. See
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc.
is a member of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
