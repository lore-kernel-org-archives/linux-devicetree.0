From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/4] iio: adc: lpc32xx: Cleanup headers
Date: Sat, 16 Mar 2019 17:23:27 +0000
Message-ID: <20190316172327.2c1d7751@archlinux>
References: <20190315095231.17001-1-gregory.clement@bootlin.com>
 <20190315095231.17001-3-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190315095231.17001-3-gregory.clement@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sylvain Lemieux <slemieux.tyco@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 10:52:29 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> A few headers is useless: remove them.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  drivers/iio/adc/lpc32xx_adc.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
> index 7084f804504e..f391c1e10136 100644
> --- a/drivers/iio/adc/lpc32xx_adc.c
> +++ b/drivers/iio/adc/lpc32xx_adc.c
> @@ -9,17 +9,11 @@
>  
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> -#include <linux/device.h>
> -#include <linux/err.h>
 -EINVAL comes from asm/errno.h I believe. IS_ERR
is also in this header.  Otherwise, they are fine, so
I'll just leave this one.

>  #include <linux/iio/iio.h>
> -#include <linux/iio/sysfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> -#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
>  #include <linux/platform_device.h>
> -#include <linux/slab.h>
>  
>  /*
>   * LPC32XX registers definitions
