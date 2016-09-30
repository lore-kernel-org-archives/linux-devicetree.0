From: linshunquan 00354166 <linshunquan1@hisilicon.com>
Subject: [PATCH 2/2] mtd: spi nor: gets resource from HiSilicon Flash Memory
 Controller driver
Date: Fri, 30 Sep 2016 16:59:31 +0800
Message-ID: <1475225971-30152-3-git-send-email-linshunquan1@hisilicon.com>
References: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, dwmw2@infradead.org, computersforpeace@gmail.com
Cc: suwenping@hisilicon.com, robh@kernel.org, devicetree@vger.kernel.org, jalen.hsu@hisilicon.com, howell.yang@hisilicon.com, linux-kernel@vger.kernel.org, raojun@hisilicon.com, jteki@openedev.com, kevin.lixu@hisilicon.com, linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar, lvkuanliang@hisilicon.com, xuejiancheng@hisilicon.com, cyrille.pitchen@atmel.com, Shunquan Lin <linshunquan1@hisilicon.com>
List-Id: devicetree@vger.kernel.org

From: Shunquan Lin <linshunquan1@hisilicon.com>

As the HiSilicon Flash Memory Controller(FMC) driver is a Multi-
function device drivers(MFD) that not only support spi-nor flash
controller, but spi-nand and nand, so moves the register map of
HiSilicon spi-nor flash controller driver to
include/linux/mfd/hisi_fmc.h

Signed-off-by: Shunquan Lin <linshunquan1@hisilicon.com>
---
 drivers/mtd/spi-nor/hisi-sfc.c | 86 +++---------------------------------------
 1 file changed, 6 insertions(+), 80 deletions(-)

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index 20378b0..7f455f4 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -16,80 +16,17 @@
  * You should have received a copy of the GNU General Public License
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
-#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mfd/hisi_fmc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-/* Hardware register offsets and field definitions */
-#define FMC_CFG				0x00
-#define FMC_CFG_OP_MODE_MASK		BIT_MASK(0)
-#define FMC_CFG_OP_MODE_BOOT		0
-#define FMC_CFG_OP_MODE_NORMAL		1
-#define FMC_CFG_FLASH_SEL(type)		(((type) & 0x3) << 1)
-#define FMC_CFG_FLASH_SEL_MASK		0x6
-#define FMC_ECC_TYPE(type)		(((type) & 0x7) << 5)
-#define FMC_ECC_TYPE_MASK		GENMASK(7, 5)
-#define SPI_NOR_ADDR_MODE_MASK		BIT_MASK(10)
-#define SPI_NOR_ADDR_MODE_3BYTES	(0x0 << 10)
-#define SPI_NOR_ADDR_MODE_4BYTES	(0x1 << 10)
-#define FMC_GLOBAL_CFG			0x04
-#define FMC_GLOBAL_CFG_WP_ENABLE	BIT(6)
-#define FMC_SPI_TIMING_CFG		0x08
-#define TIMING_CFG_TCSH(nr)		(((nr) & 0xf) << 8)
-#define TIMING_CFG_TCSS(nr)		(((nr) & 0xf) << 4)
-#define TIMING_CFG_TSHSL(nr)		((nr) & 0xf)
-#define CS_HOLD_TIME			0x6
-#define CS_SETUP_TIME			0x6
-#define CS_DESELECT_TIME		0xf
-#define FMC_INT				0x18
-#define FMC_INT_OP_DONE			BIT(0)
-#define FMC_INT_CLR			0x20
-#define FMC_CMD				0x24
-#define FMC_CMD_CMD1(cmd)		((cmd) & 0xff)
-#define FMC_ADDRL			0x2c
-#define FMC_OP_CFG			0x30
-#define OP_CFG_FM_CS(cs)		((cs) << 11)
-#define OP_CFG_MEM_IF_TYPE(type)	(((type) & 0x7) << 7)
-#define OP_CFG_ADDR_NUM(addr)		(((addr) & 0x7) << 4)
-#define OP_CFG_DUMMY_NUM(dummy)		((dummy) & 0xf)
-#define FMC_DATA_NUM			0x38
-#define FMC_DATA_NUM_CNT(cnt)		((cnt) & GENMASK(13, 0))
-#define FMC_OP				0x3c
-#define FMC_OP_DUMMY_EN			BIT(8)
-#define FMC_OP_CMD1_EN			BIT(7)
-#define FMC_OP_ADDR_EN			BIT(6)
-#define FMC_OP_WRITE_DATA_EN		BIT(5)
-#define FMC_OP_READ_DATA_EN		BIT(2)
-#define FMC_OP_READ_STATUS_EN		BIT(1)
-#define FMC_OP_REG_OP_START		BIT(0)
-#define FMC_DMA_LEN			0x40
-#define FMC_DMA_LEN_SET(len)		((len) & GENMASK(27, 0))
-#define FMC_DMA_SADDR_D0		0x4c
-#define HIFMC_DMA_MAX_LEN		(4096)
-#define HIFMC_DMA_MASK			(HIFMC_DMA_MAX_LEN - 1)
-#define FMC_OP_DMA			0x68
-#define OP_CTRL_RD_OPCODE(code)		(((code) & 0xff) << 16)
-#define OP_CTRL_WR_OPCODE(code)		(((code) & 0xff) << 8)
-#define OP_CTRL_RW_OP(op)		((op) << 1)
-#define OP_CTRL_DMA_OP_READY		BIT(0)
-#define FMC_OP_READ			0x0
-#define FMC_OP_WRITE			0x1
-#define FMC_WAIT_TIMEOUT		1000000
-
-enum hifmc_iftype {
-	IF_TYPE_STD,
-	IF_TYPE_DUAL,
-	IF_TYPE_DIO,
-	IF_TYPE_QUAD,
-	IF_TYPE_QIO,
-};
 
 struct hifmc_priv {
 	u32 chipselect;
@@ -97,7 +34,6 @@ struct hifmc_priv {
 	struct hifmc_host *host;
 };
 
-#define HIFMC_MAX_CHIP_NUM		2
 struct hifmc_host {
 	struct device *dev;
 	struct mutex lock;
@@ -412,7 +348,7 @@ fail:
 static int hisi_spi_nor_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
+	struct hisi_fmc *fmc = dev_get_drvdata(dev->parent);
 	struct hifmc_host *host;
 	int ret;
 
@@ -423,19 +359,10 @@ static int hisi_spi_nor_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 	host->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "control");
-	host->regbase = devm_ioremap_resource(dev, res);
-	if (IS_ERR(host->regbase))
-		return PTR_ERR(host->regbase);
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
-	host->iobase = devm_ioremap_resource(dev, res);
-	if (IS_ERR(host->iobase))
-		return PTR_ERR(host->iobase);
-
-	host->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(host->clk))
-		return PTR_ERR(host->clk);
+	host->regbase = fmc->regbase;
+	host->iobase = fmc->iobase;
+	host->clk = fmc->clk;
+	host->lock = fmc->lock;
 
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
@@ -448,7 +375,6 @@ static int hisi_spi_nor_probe(struct platform_device *pdev)
 	if (!host->buffer)
 		return -ENOMEM;
 
-	mutex_init(&host->lock);
 	clk_prepare_enable(host->clk);
 	hisi_spi_nor_init(host);
 	ret = hisi_spi_nor_register_all(host);
-- 
2.3.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
