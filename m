From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 3/5] iio:adc:lpc32xx use SPDX-License-Identifier
Date: Sat, 9 Feb 2019 17:10:18 +0000
Message-ID: <20190209171004.0741f68e@archlinux>
References: <20190208160944.13281-1-gregory.clement@bootlin.com>
 <20190208160944.13281-4-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190208160944.13281-4-gregory.clement@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Hartmut Knaack <knaack.h@gmx.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri,  8 Feb 2019 17:09:42 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Convert the driver to SPDX license description which allow removing
> several lines in the file.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/lpc32xx_adc.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/iio/adc/lpc32xx_adc.c b/drivers/iio/adc/lpc32xx_adc.c
> index 20b36690fa4f..e361c1532a75 100644
> --- a/drivers/iio/adc/lpc32xx_adc.c
> +++ b/drivers/iio/adc/lpc32xx_adc.c
> @@ -1,23 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   *  lpc32xx_adc.c - Support for ADC in LPC32XX
>   *
>   *  3-channel, 10-bit ADC
>   *
>   *  Copyright (C) 2011, 2012 Roland Stigge <stigge@antcom.de>
> - *
> - *  This program is free software; you can redistribute it and/or modify
> - *  it under the terms of the GNU General Public License as published by
> - *  the Free Software Foundation; either version 2 of the License, or
> - *  (at your option) any later version.
> - *
> - *  This program is distributed in the hope that it will be useful,
> - *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *  GNU General Public License for more details.
> - *
> - *  You should have received a copy of the GNU General Public License
> - *  along with this program; if not, write to the Free Software
> - *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>   */
>  
>  #include <linux/module.h>
