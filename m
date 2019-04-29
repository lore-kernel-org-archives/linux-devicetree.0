From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 5/5] mtd: onenand/samsung: Set name field of mtd_info
 struct
Date: Mon, 29 Apr 2019 10:22:16 +0200
Message-ID: <20190429102216.3235c48c@xps13>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
        <20190426164224.11327-6-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-6-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kyungmin.park@samsung.com, bbrezillon@kernel.org, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Paweł,

Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com> wrote on Fri, 26 Apr 2019
18:42:24 +0200:

> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> This patch adds initialization of .name field of mtd_info struct to
> avoid printing "(null)" in kernel log messages, such as:
> 
> [    1.942519] 1 ofpart partitions found on MTD device (null)
> [    1.949708] Creating 1 MTD partitions on "(null)":
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  drivers/mtd/nand/onenand/samsung.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung.c
> index 0f450604412f..1fda1f324cc6 100644
> --- a/drivers/mtd/nand/onenand/samsung.c
> +++ b/drivers/mtd/nand/onenand/samsung.c
> @@ -886,6 +886,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	this = (struct onenand_chip *) &mtd[1];
> +	mtd->name = dev_name(&pdev->dev);
>  	mtd->priv = this;
>  	mtd->dev.of_node = np;
>  	mtd->dev.parent = &pdev->dev;


Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miquèl
