From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/8] mtd: atmel_nand: Support PMECC on SAMA5D2
Date: Sat, 16 Jan 2016 18:18:43 -0600
Message-ID: <20160117001843.GA11736@rob-hp-laptop>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
 <1452854102-6125-7-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452854102-6125-7-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 15, 2016 at 11:35:00AM +0100, Romain Izard wrote:
> Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
> controller that can correct 32 bits in each sector. This controller is
> not 100% compatible with the previous revision that corrected a maximum
> of 24 bits by sector, as some register addresses overlap.
> 
> Using information from the device tree, we can configure the driver to
> work with both versions.
> 
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> v2: Split rewording of the binding into its own patch
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  5 ++++-

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/mtd/nand/atmel_nand.c                      | 23 +++++++++++++++++++++-
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
>  3 files changed, 32 insertions(+), 4 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
