From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 5/7] staging:iio:ad2s90: Replace license text w/ SPDX
 identifier
Date: Sat, 1 Dec 2018 15:38:36 +0000
Message-ID: <20181201153836.35cb6318@archlinux>
References: <20181124002312.6923-1-matheus.bernardino@usp.br>
 <20181124002312.6923-6-matheus.bernardino@usp.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181124002312.6923-6-matheus.bernardino@usp.br>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Matheus Tavares <matheus.bernardino@usp.br>
Cc: Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>, Alexandru Ardelean <alexandru.ardelean@analog.com>, victorcolombo@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2018 22:23:10 -0200
Matheus Tavares <matheus.bernardino@usp.br> wrote:

> This patch removes the license boilerplate text at the top of ad2s90.c
> and, instead, adds the SPDX GPL-2.0 license identifier, which solves the
> checkpatch.pl warning:
> "WARNING: Missing or malformed SPDX-License-Identifier tag in line 1".
> 
> Signed-off-by: Matheus Tavares <matheus.bernardino@usp.br>
Applied,

Thanks,

Jonathan

> ---
> Changes in v3:
>  - none
> 
> Changes in v2:
>  - Changed GPL-2.0-only identifier to GPL-2.0
>  - Removed license boilerplate text
>  - Rewritten patch message to reflect these modifications
> 
>  drivers/staging/iio/resolver/ad2s90.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s90.c b/drivers/staging/iio/resolver/ad2s90.c
> index 4721e9bbb8b0..678351dabe6b 100644
> --- a/drivers/staging/iio/resolver/ad2s90.c
> +++ b/drivers/staging/iio/resolver/ad2s90.c
> @@ -1,12 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * ad2s90.c simple support for the ADI Resolver to Digital Converters: AD2S90
>   *
>   * Copyright (c) 2010-2010 Analog Devices Inc.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - *
>   */
>  #include <linux/types.h>
>  #include <linux/mutex.h>
