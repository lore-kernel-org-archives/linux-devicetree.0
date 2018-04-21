From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 01/13] staging: iio: ad2s1200: Remove unneeded include
Date: Sat, 21 Apr 2018 17:45:25 +0100
Message-ID: <20180421174525.6acdec02@archlinux>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
 <08612b1148da933e8ac8ca190250db4c58f6a682.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <08612b1148da933e8ac8ca190250db4c58f6a682.1524247563.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: David Veenstra <davidjulianveenstra@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, 20 Apr 2018 21:28:32 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> This patches removes unneeded slab.h header.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
This one surprised me, but indeed there are no direct
users of any memory allocation in this file.

Applied to the togreg branch of iio.git and pushed out as
testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
> Changes in v2:
>   - Introduced in this version.
> 
> drivers/staging/iio/resolver/ad2s1200.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index aa62c64e9bc4..5d7ed0034422 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -13,7 +13,6 @@
>  #include <linux/mutex.h>
>  #include <linux/device.h>
>  #include <linux/spi/spi.h>
> -#include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/delay.h>
>  #include <linux/gpio.h>
