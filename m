From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 09/11] dma: pl330: fix wording in mcbufsz message
Date: 3 Jun 2015 21:26:41 -0000
Message-ID: <14872fc6f86b7f4976d539b47a7899904cd954f6.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: devicetree@vger.kernel.org

The kernel is not trying to increase mcbufsz. It suggests you should try
doing so. Also print the calculated required size of mcbufsz.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/dma/pl330.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 9015a74..00ab733 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -1436,8 +1436,8 @@ static int pl330_submit_req(struct pl330_thread *thrd,
 		goto xfer_exit;
 
 	if (ret > pl330->mcbufsz / 2) {
-		dev_info(pl330->ddma.dev, "%s:%d Trying increasing mcbufsz\n",
-				__func__, __LINE__);
+		dev_info(pl330->ddma.dev, "%s:%d Try increasing mcbufsz (%i/%i)\n",
+				__func__, __LINE__, ret, pl330->mcbufsz / 2);
 		ret = -ENOMEM;
 		goto xfer_exit;
 	}
-- 
2.1.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
