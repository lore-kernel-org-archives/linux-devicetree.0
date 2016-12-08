From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 3/5] Documentation: dt: mtd: add chip support for "jedec,
 spi-nor"
Date: Thu, 8 Dec 2016 17:23:02 +0800
Message-ID: <1481188984-43683-4-git-send-email-yao.yuan@freescale.com>
References: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org
Cc: devicetree@vger.kernel.org, yao.yuan@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

"sst25wf040b" and "en25s64" are also chip compatible with SPI NOR flash.

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 2c91c03..86614ee 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -13,6 +13,7 @@ Required properties:
                  at25df321a
                  at25df641
                  at26df081a
+                 en25s64
                  mr25h256
                  mx25l4005a
                  mx25l1606e
@@ -29,6 +30,7 @@ Required properties:
                  s25fl008k
                  s25fl064k
                  sst25vf040b
+                 sst25wf040b
                  m25p40
                  m25p80
                  m25p16
-- 
2.1.0.27.g96db324
