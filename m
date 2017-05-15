From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/9] dt-bindings: arm: mediatek: update for MT7623n SoC
 and relevant boards
Date: Mon, 15 May 2017 09:53:37 +0200
Message-ID: <33b3a8a3-006b-91b3-e30d-56518fb9ae7a@gmail.com>
References: <cover.1494574682.git.sean.wang@mediatek.com>
 <e8f5dc8578c3980ac9c6411ad7fae1c8d747f567.1494574682.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e8f5dc8578c3980ac9c6411ad7fae1c8d747f567.1494574682.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/05/17 09:56, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Because there are two versions of MT7623 SoC that is MT7623a and MT7623n
> respectively. So update the part of MT7623n bindings to allow that people
> tend to differentiate which MT7623 SoC the boards applies.
> 
> Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/arm/mediatek.txt | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
> index c860b24..0924b62 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek.txt
> @@ -1,6 +1,6 @@
>   MediaTek mt65xx, mt67xx & mt81xx Platforms Device Tree Bindings
>   
> -Boards with a MediaTek mt65xx/mt67xx/mt81xx SoC shall have the
> +Boards with a MediaTek mt65xx/mt67xx/mt762x/mt81xx SoC shall have the
>   following property:
>   
>   Required root node property:
> @@ -12,7 +12,7 @@ compatible: Must contain one of
>      "mediatek,mt6592"
>      "mediatek,mt6755"
>      "mediatek,mt6795"
> -   "mediatek,mt7623"
> +   "mediatek,mt7623" which is referred to MT7623N SoC
>      "mediatek,mt8127"
>      "mediatek,mt8135"
>      "mediatek,mt8173"
> @@ -38,9 +38,9 @@ Supported boards:
>   - Evaluation board for MT6795(Helio X10):
>       Required root node properties:
>         - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
> -- Evaluation board for MT7623:
> +- Reference  board for MT7623n with NAND:
>       Required root node properties:
> -      - compatible = "mediatek,mt7623-evb", "mediatek,mt7623";
> +      - compatible = "mediatek,mt7623n-rfb-nand", "mediatek,mt7623";

Please explain in the commit message why you change this binding and why 
this is not problematic. Either in this patch or add a new one.

For convenience for the device-tree maintainer, add the binding patches 
at the beginning of your patch list. It makes their life easier and a 
review faster, a clear win-win situation :)

Thanks,
Matthias

>   - MTK mt8127 tablet moose EVB:
>       Required root node properties:
>         - compatible = "mediatek,mt8127-moose", "mediatek,mt8127";
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
