From: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: stm32-quadspi: change license text
Date: Sun, 29 Oct 2017 18:51:25 +0100
Message-ID: <6d132904-bea7-2ecc-f9d9-73c7cc5f0c3d@wedev4u.fr>
References: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
 <1509030755-19044-4-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509030755-19044-4-git-send-email-ludovic.Barre-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 26/10/2017 à 17:12, Ludovic Barre a écrit :
> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> 
> -Change the license text with long template.
> -Change Copyright to STMicroelectronics.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

Applied to the spi-nor/next branch of l2-mtd

Thanks!
> ---
>  drivers/mtd/spi-nor/stm32-quadspi.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
> index 70710be..b3c7f6a 100644
> --- a/drivers/mtd/spi-nor/stm32-quadspi.c
> +++ b/drivers/mtd/spi-nor/stm32-quadspi.c
> @@ -1,9 +1,22 @@
>  /*
> - * stm32_quadspi.c
> + * Driver for stm32 quadspi controller
>   *
> - * Copyright (C) 2017, Ludovic Barre
> + * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
> + * Author(s): Ludovic Barre author <ludovic.barre-qxv4g6HH51o@public.gmane.org>.
>   *
> - * License terms: GNU General Public License (GPL), version 2
> + * License terms: GPL V2.0.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
> + * details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * This program. If not, see <http://www.gnu.org/licenses/>.
>   */
>  #include <linux/clk.h>
>  #include <linux/errno.h>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
