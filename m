From: linshunquan 00354166 <linshunquan1@hisilicon.com>
Subject: [PATCH 0/2] Add the HiSilicon Flash Memory Controller driver
Date: Fri, 30 Sep 2016 16:59:29 +0800
Message-ID: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, dwmw2@infradead.org, computersforpeace@gmail.com
Cc: suwenping@hisilicon.com, robh@kernel.org, devicetree@vger.kernel.org, jalen.hsu@hisilicon.com, howell.yang@hisilicon.com, linux-kernel@vger.kernel.org, raojun@hisilicon.com, jteki@openedev.com, kevin.lixu@hisilicon.com, linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar, lvkuanliang@hisilicon.com, xuejiancheng@hisilicon.com, cyrille.pitchen@atmel.com, linshunquan 00354166 <linshunquan1@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Brief:
The HiSilicon Flash Memory Controller(FMC) is feature-rich that supports
3 interfaces: SPI Nor, SPI Nand and Parallel Nand, choosed by the different
chipselect and boot media of board, these sub-controllers share the same
register block. The transmission protocol of each interface is different
depends on their own framework.

The HiSilicon Spi Nor framework you can refer to:
drivers/mtd/spi-nor/hisi-sfc.c
Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt

Shunquan Lin (2):
  mfd: Add HiSilicon Flash Memory Controller(FMC) driver
  mtd: spi nor: gets resource from HiSilicon Flash Memory Controller
    driver

 .../devicetree/bindings/mfd/hisilicon,hisi-fmc.txt |  62 ++++++++++++
 drivers/mfd/Kconfig                                |  10 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/hisi_fmc.c                             | 109 +++++++++++++++++++++
 drivers/mtd/spi-nor/hisi-sfc.c                     |  86 ++--------------
 include/linux/mfd/hisi_fmc.h                       |  92 +++++++++++++++++
 6 files changed, 280 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
 create mode 100644 drivers/mfd/hisi_fmc.c
 create mode 100644 include/linux/mfd/hisi_fmc.h

-- 
2.3.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
