From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH RESEND v5 1/5] misc: sram: add ability to limit used sram
 areas
Date: Fri, 25 Oct 2013 20:55:11 +0100
Message-ID: <20131025195511.D0C82C404EA@trevor.secretlab.ca>
References: <201310221724.21550.heiko@sntech.de>
 <201310221725.50942.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6671649787592118170=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201310221725.50942.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Matt Sealey <neko@bakuhatsu.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, arm@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Ulrich Prinz <ulrich.prinz@googlemail.com>
List-Id: devicetree@vger.kernel.org

--===============6671649787592118170==
Content-Type: text/plain

On Tue, 22 Oct 2013 17:25:50 +0200, Heiko Stübner <heiko@sntech.de> wrote:
> Some SoCs need parts of their sram for special purposes. So while being part
> of the peripheral, it should not be part of the genpool controlling the sram.
> 
> Therefore add an option available to keep arbitrary portions of the
> sram from being part of the pool. If available is not present, all
> sram is used.
> 
> Suggested-by: Rob Herring <robherring2@gmail.com>
> move from marking reserved space to available space
> Suggested-by: Matt Sealey <neko@bakuhatsu.net>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Ulrich Prinz <ulrich.prinz@googlemail.com>
> ---
>  Documentation/devicetree/bindings/misc/sram.txt |    8 ++++
>  drivers/misc/sram.c                             |   51 ++++++++++++++++++++---
>  2 files changed, 53 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Documentation/devicetree/bindings/misc/sram.txt
> index 4d0a00e..8be552f 100644
> --- a/Documentation/devicetree/bindings/misc/sram.txt
> +++ b/Documentation/devicetree/bindings/misc/sram.txt
> @@ -8,9 +8,17 @@ Required properties:
>  
>  - reg : SRAM iomem address range
>  
> +Optional properties:
> +
> +- available: optional list of available chunks inside the sram that the
> +  OS can use. Without available, the whole range is usable for the OS.
> +  Format is <base size>, <base size>, ...; with base being relative to the
> +  reg property base.

I think it would make more sense to specify reserved regions of the
memory instead of the valid ranges. Carving out reserved regions is
closer to the patterns for reserved memory that we'll be using
elsewhere.

g.

> +
>  Example:
>  
>  sram: sram@5c000000 {
>  	compatible = "mmio-sram";
>  	reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
> +	available = <0x100 0x3ff00>;
>  };
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index afe66571..755e640 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -42,6 +42,8 @@ static int sram_probe(struct platform_device *pdev)
>  	struct sram_dev *sram;
>  	struct resource *res;
>  	unsigned long size;
> +	const __be32 *avail_list = NULL;
> +	int avail_size = 0;
>  	int ret;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -65,12 +67,49 @@ static int sram_probe(struct platform_device *pdev)
>  	if (!sram->pool)
>  		return -ENOMEM;
>  
> -	ret = gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
> -				res->start, size, -1);
> -	if (ret < 0) {
> -		if (sram->clk)
> -			clk_disable_unprepare(sram->clk);
> -		return ret;
> +	if (pdev->dev.of_node) {
> +		avail_list = of_get_property(pdev->dev.of_node,
> +						"available",
> +						&avail_size);
> +		if (avail_list) {
> +			avail_size /= sizeof(*avail_list);
> +			if (!avail_size || avail_size % 2) {
> +				dev_warn(&pdev->dev, "wrong number of arguments in available property\n");
> +				avail_list = NULL;
> +			}
> +		}
> +	}
> +
> +	if (!avail_list) {
> +		ret = gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
> +					res->start, size, -1);
> +		if (ret < 0) {
> +			if (sram->clk)
> +				clk_disable_unprepare(sram->clk);
> +			return ret;
> +		}
> +	} else {
> +		unsigned int astart;
> +		unsigned int asize;
> +		int i;
> +
> +		for (i = 0; i < avail_size; i += 2) {
> +			/* get the next available block */
> +			astart = be32_to_cpu(*avail_list++);
> +			asize = be32_to_cpu(*avail_list++);
> +
> +			dev_dbg(&pdev->dev, "found available block 0x%x-0x%x\n",
> +				 astart, astart + asize);
> +
> +			ret = gen_pool_add_virt(sram->pool,
> +					(unsigned long)virt_base + astart,
> +					res->start + astart, asize, -1);
> +			if (ret < 0) {
> +				if (sram->clk)
> +					clk_disable_unprepare(sram->clk);
> +				return ret;
> +			}
> +		}
>  	}
>  
>  	platform_set_drvdata(pdev, sram);
> -- 
> 1.7.10.4
> 



--===============6671649787592118170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6671649787592118170==--
