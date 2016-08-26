From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 04/10] dt-bindings: spi-nor: Update bindings for LS1012A
Date: Fri, 26 Aug 2016 17:26:54 -0500
Message-ID: <1472250414.13245.3.camel@buserror.net>
References: <1472207269-18499-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
         <1472207269-18499-4-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472207269-18499-4-git-send-email-Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-08-26 at 15:57 +0530, Bhaskar Upadhaya wrote:
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 2c91c03..fc99ef2 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -13,6 +13,7 @@ Required properties:
>                   at25df321a
>                   at25df641
>                   at26df081a
> +		 eon,en25s64
>                   mr25h256
>                   mx25l4005a
>                   mx25l1606e
> @@ -29,6 +30,7 @@ Required properties:
>                   s25fl008k
>                   s25fl064k
>                   sst25vf040b
> +		 sst,sst25wf040b
>                   m25p40
>                   m25p80
>                   m25p16

Whitespace doesn't match what's already there.

Why are these the only lines that have a vendor prefix?

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
