From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 02/13] staging: iio: ad2s1200: Sort includes
 alphabetically
Date: Sat, 21 Apr 2018 17:46:06 +0100
Message-ID: <20180421174606.7d17f2b1@archlinux>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
 <37b5b04518480fc1dbc273c84082b648d55eeecc.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <37b5b04518480fc1dbc273c84082b648d55eeecc.1524247563.git.davidjulianveenstra@gmail.com>
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

On Fri, 20 Apr 2018 21:28:52 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> This patches sorts all the includes in alphabetic order.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
Applied,

Thanks

Jonathan

> ---
>  drivers/staging/iio/resolver/ad2s1200.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index 5d7ed0034422..ffcdf4e8eb92 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -9,15 +9,15 @@
>   * published by the Free Software Foundation.
>   *
>   */
> -#include <linux/types.h>
> -#include <linux/mutex.h>
> -#include <linux/device.h>
> -#include <linux/spi/spi.h>
> -#include <linux/sysfs.h>
> +#include <linux/bitops.h>
>  #include <linux/delay.h>
> +#include <linux/device.h>
>  #include <linux/gpio.h>
>  #include <linux/module.h>
> -#include <linux/bitops.h>
> +#include <linux/mutex.h>
> +#include <linux/spi/spi.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
