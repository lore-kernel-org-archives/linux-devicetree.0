From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/10] dt-bindings: spi-nor: Update bindings for LS1012A
Date: Tue, 30 Aug 2016 18:09:08 -0500
Message-ID: <CAL_Jsq+bXYeKJSKzpVaUsKAbX-4TFk1QerqQHDudurGhtRzb3Q@mail.gmail.com>
References: <1472207269-18499-1-git-send-email-Bhaskar.Upadhaya@nxp.com> <1472207269-18499-4-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472207269-18499-4-git-send-email-Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 5:27 AM, Bhaskar Upadhaya
<Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org> wrote:

Make the subject reflect what the patch does.

> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 2c91c03..fc99ef2 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -13,6 +13,7 @@ Required properties:
>                   at25df321a
>                   at25df641
>                   at26df081a
> +                eon,en25s64

To answer Scott's question, see the paragraph above this.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
