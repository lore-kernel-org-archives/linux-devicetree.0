From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH -next] mtd: orion_nand: convert to use devm_* APIs
Date: Wed, 17 Jul 2013 09:45:33 +0200
Message-ID: <20130717074533.GA1026@lunn.ch>
References: <CAPgLHd8upcmfnQqHAWnqP7YBVYDVyoYKQ3WCh3c5+uY-EKr1jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd8upcmfnQqHAWnqP7YBVYDVyoYKQ3WCh3c5+uY-EKr1jg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: andrew@lunn.ch, artem.bityutskiy@linux.intel.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, wfp5p@virginia.edu, linux-mtd@lists.infradead.org, grant.likely@linaro.org, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2013 at 10:09:10AM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Convert to use devm_* APIs to avoid resources leak on error handling case.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/mtd/nand/orion_nand.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index 46f308d..ce711b4 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -85,25 +85,23 @@ static int __init orion_nand_probe(struct platform_device *pdev)
>  	int ret = 0;
>  	u32 val = 0;
>  
> -	nc = kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), GFP_KERNEL);
> +	nc = devm_kzalloc(&pdev->dev,
> +			  sizeof(struct nand_chip) + sizeof(struct mtd_info),
> +			  GFP_KERNEL);
>  	if (!nc) {
>  		printk(KERN_ERR "orion_nand: failed to allocate device structure.\n");
> -		ret = -ENOMEM;
> -		goto no_res;
> +		return -ENOMEM;
>  	}
>  	mtd = (struct mtd_info *)(nc + 1);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		ret = -ENODEV;
> -		goto no_res;
> -	}
> +	if (!res)
> +		return -ENODEV;
>  
> -	io_base = ioremap(res->start, resource_size(res));
> +	io_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
>  	if (!io_base) {
>  		printk(KERN_ERR "orion_nand: ioremap failed\n");
> -		ret = -EIO;
> -		goto no_res;
> +		return -EIO;

Hi Wei

Thanks for working on this.

The above code can be further simplified:

        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
        io_base = devm_ioremap_resource(&pdev->dev, res);
        if (IS_ERR(io_base))
                return PTR_ERR(io_base); 


While you are editing this file, it would be nice to replace all the
printk() statements with dev_err(), dev_info() etc. Please do that as
a separate patch.

Thanks
	Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
