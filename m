From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/3] mtd: hisilicon: add a new nand controller driver for
 hisilicon hip04 Soc
Date: Mon, 30 Jun 2014 11:00:25 +0100
Message-ID: <20140630100025.GA7262@leverpostej>
References: <1404115409-20200-1-git-send-email-wangzhou.bry@gmail.com>
 <1404115409-20200-3-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1404115409-20200-3-git-send-email-wangzhou.bry@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhou Wang <wangzhou.bry@gmail.com>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, Alexander Shiyan <shc_work@mail.ru>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Joern Engel <joern@logfs.org>, Rob Herring <robh+dt@kernel.org>, Pekon Gupta <pekon@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>, Kumar Gala <galak>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 30, 2014 at 09:03:28AM +0100, Zhou Wang wrote:
> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
> ---
>  drivers/mtd/nand/Kconfig     |    5 +
>  drivers/mtd/nand/Makefile    |    1 +
>  drivers/mtd/nand/hisi_nand.c |  847 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 853 insertions(+)
>  create mode 100644 drivers/mtd/nand/hisi_nand.c

[...]

> +struct hinfc_host {
> +       struct nand_chip        *chip;
> +       struct mtd_info         *mtd;
> +       struct device           *dev;
> +       void __iomem            *iobase;
> +       struct completion       cmd_complete;
> +       unsigned int            offset;
> +       unsigned int            command;
> +       int                     chipselect;
> +       unsigned int            addr_cycle;
> +       unsigned int            addr_value[2];
> +       unsigned int            cache_addr_value[2];
> +       char                    *buffer;
> +       dma_addr_t              dma_buffer;
> +       dma_addr_t              dma_oob;
> +       int                     version;
> +       unsigned int            ecc_bits;
> +       unsigned int            irq_status; /* interrupt status */
> +
> +       int (*send_cmd_pageprog)(struct hinfc_host *host);
> +       int (*send_cmd_status)(struct hinfc_host *host);
> +       int (*send_cmd_readstart)(struct hinfc_host *host);
> +       int (*send_cmd_erase)(struct hinfc_host *host);
> +       int (*send_cmd_readid)(struct hinfc_host *host);
> +       int (*send_cmd_reset)(struct hinfc_host *host, int chipselect);
> +};

[...]

> +static int hisi_nfc_probe(struct platform_device *pdev)
> +{
> +       int ret = 0, irq, buswidth, flag, max_chips = HINFC504_MAX_CHIP;
> +       struct device *dev = &pdev->dev;
> +       struct hinfc_host *host;
> +       struct nand_chip  *chip;
> +       struct mtd_info   *mtd;
> +       struct resource   *res;
> +       struct device_node *np = dev->of_node;
> +       struct mtd_part_parser_data ppdata;
> +
> +       host = devm_kzalloc(dev, sizeof(*host) + sizeof(*chip) + sizeof(*mtd),
> +                       GFP_KERNEL);
> +       if (!host)
> +               return -ENOMEM;
> +       host->dev = dev;
> +
> +       platform_set_drvdata(pdev, host);
> +       chip = (struct nand_chip *)&host[1];
> +       mtd  = (struct mtd_info *)&chip[1];

Why not embed the whole struct rather than pointers? Then you can
allocate just the host and extract pointers to the chip and mtd sub
structures.

Thanks,
Mark.
