From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 4/5] iio:adc:lpc32xx Cleanup headers
Date: Sat, 9 Feb 2019 17:16:46 +0000
Message-ID: <20190209171646.49c75afc@archlinux>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
 <20190208160944.13281-5-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208160944.13281-5-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Hartmut Knaack <knaack.h@gmx.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri,  8 Feb 2019 17:09:43 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> A few headers was useless: remove them, and also sort them in alphabetic
> order.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Hmm. Given the headers in question are mostly only useless (I think)
in the sense they are always included by something else, I'm
not sure this patch is worth the churn.

It's also tricky to see which ones were actually removed
given the combination with sorting.
I think it's just kernel.h, device.h, err.h all of which
are used in various ways and often directly included.

The other one is the iio/sysfs.h file.  That one we could
do to eventually kill off entirely, so happy to see that
one alone go.

Jonathan

> ---
>  drivers/iio/adc/lpc32xx_adc.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
> index e361c1532a75..f391c1e10136 100644
> --- a/drivers/iio/adc/lpc32xx_adc.c
> +++ b/drivers/iio/adc/lpc32xx_adc.c
> @@ -7,20 +7,13 @@
>   *  Copyright (C) 2011, 2012 Roland Stigge <stigge@antcom.de>
>   */
>  
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
> -#include <linux/interrupt.h>
> -#include <linux/device.h>
> -#include <linux/kernel.h>
> -#include <linux/slab.h>
> -#include <linux/io.h>
>  #include <linux/clk.h>
> -#include <linux/err.h>
>  #include <linux/completion.h>
> -#include <linux/of.h>
> -
>  #include <linux/iio/iio.h>
> -#include <linux/iio/sysfs.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
>  
>  /*
>   * LPC32XX registers definitions
