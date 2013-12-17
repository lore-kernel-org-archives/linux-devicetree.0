From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 1/9] mtd: nand: davinci: fix driver registration
Date: Tue, 17 Dec 2013 01:24:49 -0800
Message-ID: <20131217092449.GL12034@norris-Latitude-E6410>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1386264358-9738-2-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1386264358-9738-2-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, grygorii.strashko@ti.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 07:25:49PM +0200, Ivan Khoronzhuk wrote:
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -877,6 +877,7 @@ static int __exit nand_davinci_remove(struct platform_device *pdev)
>  }
>  
>  static struct platform_driver nand_davinci_driver = {
> +	.probe		= nand_davinci_probe,
>  	.remove		= __exit_p(nand_davinci_remove),

I believe you need to drop the __exit_p() here. And now that you're
using module_platform_driver(), you need to drop the __init and __exit
from the probe() and remove() routines, to avoid section mismatch
warnings.

>  	.driver		= {
>  		.name	= "davinci_nand",

So on second thought, please resubmit the series with the requested
changes.

Thanks,
Brian
