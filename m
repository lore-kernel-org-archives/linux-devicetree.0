From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 01/12] staging: iio: ad2s1200: Remove unneeded
 newline in license
Date: Sun, 20 May 2018 11:52:03 +0100
Message-ID: <20180520115203.56c54d22@archlinux>
References: <cover.1526667118.git.davidjulianveenstra@gmail.com>
 <41ab35e221dd530c8caab5b1063d86e35c7e9544.1526667118.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <41ab35e221dd530c8caab5b1063d86e35c7e9544.1526667118.git.davidjulianveenstra@gmail.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Fri, 18 May 2018 20:21:06 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> Remove unneeded newline in license, as it does not improve readability.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
Applied, thanks

Jonathan

> ---
> Changes in v4:
>  - Introduced in this version.
> 
>  drivers/staging/iio/resolver/ad2s1200.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index ea7336645116..df3b34200a89 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -7,7 +7,6 @@
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
> - *
>   */
>  
>  #include <linux/bitops.h>
