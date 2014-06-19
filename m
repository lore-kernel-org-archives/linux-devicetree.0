From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: Fix missing binding documentation for Armada
 38x
Date: Thu, 19 Jun 2014 20:32:00 +0400
Message-ID: <53A31080.40707@cogentembedded.com>
References: <1403186871-28204-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403186871-28204-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/19/2014 06:07 PM, Gregory CLEMENT wrote:

> For the Armada 380 and Armada 385 SoCs, the common bindings for those
> 2 SoCs, was forgotten. This patch add the documentation for the
> marvell,aramda38x property.

> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Hi,

> This fix should be merged in 3.16. For 3.15 I am not sure as it is not
> a regression.

> Thanks,
> Gregory

>   Documentation/devicetree/bindings/arm/armada-38x.txt | 4 ++++
>   1 file changed, 4 insertions(+)

> diff --git a/Documentation/devicetree/bindings/arm/armada-38x.txt b/Documentation/devicetree/bindings/arm/armada-38x.txt
> index 11f2330a6554..b68bcb80d2de 100644
> --- a/Documentation/devicetree/bindings/arm/armada-38x.txt
> +++ b/Documentation/devicetree/bindings/arm/armada-38x.txt
> @@ -6,5 +6,9 @@ following property:
>
>   Required root node property:
>
> +compatible: must contain "marvell,armada38x"
> +
> +Required root node property:

    Duplicate statement with the above?

> +
>    - compatible: must contain either "marvell,armada380" or
>      "marvell,armada385" depending on the variant of the SoC being used.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
