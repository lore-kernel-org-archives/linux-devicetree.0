From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 4/5] mtd: atmel_nand: Support 32-bit ECC strength
Date: Wed, 13 Jan 2016 19:09:09 -0600
Message-ID: <20160114010909.GA28864@rob-hp-laptop>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-5-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452702857-2240-5-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2016 at 05:34:16PM +0100, Romain Izard wrote:
> As the SAMA5D2 controller supports the 32-bit ECC strength, accept it
> as a valid setting when required by the device tree or the NAND
> parameter page.
> 
> Then configure the controller to do use this new setting.
> 
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  3 ++-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/mtd/nand/atmel_nand.c                      | 23 ++++++++++++++++++----
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  1 +
>  3 files changed, 22 insertions(+), 5 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
