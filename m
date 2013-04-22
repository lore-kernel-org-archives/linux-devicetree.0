From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 18/23] dma: coh901318: add devicetree support
Date: Mon, 22 Apr 2013 16:04:37 +0530
Message-ID: <20130422103437.GX24632@intel.com>
References: <1366624770-6786-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1366624770-6786-1-git-send-email-linus.walleij@stericsson.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Dan Williams <djbw@fb.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 22, 2013 at 11:59:30AM +0200, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> This adds support for probing the COH 901 318 DMA controller
> from the device tree.
> 
> Cc: Vinod Koul <vinod.koul@intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Vinod Koul <vinod.koul@intel.com>

--
~Vinod
> ---
> Hi Vinod, I'm seeking an ACK on this patch to take it through
> the ARM SoC tree.
> ---
>  drivers/dma/coh901318.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
> index 797940e..2855646 100644
> --- a/drivers/dma/coh901318.c
> +++ b/drivers/dma/coh901318.c
> @@ -2758,11 +2758,16 @@ static int __exit coh901318_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct of_device_id coh901318_dt_match[] = {
> +	{ .compatible = "stericsson,coh901318" },
> +	{},
> +};
>  
>  static struct platform_driver coh901318_driver = {
>  	.remove = __exit_p(coh901318_remove),
>  	.driver = {
>  		.name	= "coh901318",
> +		.of_match_table = coh901318_dt_match,
>  	},
>  };
>  
> -- 
> 1.7.11.3
> 
