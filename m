From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 33/39] mtd: nand: denali: support 1024 byte ECC step size
Date: Thu, 1 Dec 2016 09:58:26 -0600
Message-ID: <20161201155826.azc7i3bnbxwb5ro3@rob-hp-laptop>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-34-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480183585-592-34-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 27, 2016 at 03:06:19AM +0900, Masahiro Yamada wrote:
> This driver was originally written for the Intel MRST platform with
> several platform specific parameters hard-coded.  Another thing we
> need to fix is the hard-coded ECC step size.  Currently, it is
> defined as follows:
> 
>   #define ECC_SECTOR_SIZE 512
> 
> (somehow, it is defined in both denali.c and denali.h)
> 
> This must be avoided because the Denali IP supports 1024 byte ECC
> size as well.  Add a new flag DENALI_CAPS_ECC_SIZE_1024. If it is
> specified, ecc.size is set to 1024, otherwise set to 512.
> 
> We can use "nand-ecc-step-size" DT property to override the ecc.size
> if we want, but this capability flag can provide the reasonable
> default because it is associated with the DT compatible strings.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  4 ++++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/mtd/nand/denali.c                          | 26 +++++++++++-----------
>  drivers/mtd/nand/denali.h                          |  3 +--
>  3 files changed, 18 insertions(+), 15 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
