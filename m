From: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: net: wireless: Add sg parameters dts parsing
Date: Mon, 11 Dec 2017 10:55:18 +0100
Message-ID: <5A2E5606.8010707@broadcom.com>
References: <20171211081144.GA140567@aremote07.aus.cypress.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211081144.GA140567-Oa2joqsrgCQFtx9iUY/I1CAzFfycyo/qAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list <brcm80211-dev-list-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, brcm80211-dev-list.pdl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/11/2017 9:11 AM, Chi-Hsien Lin wrote:
> broken_sg_support, sd_head_align, and sd_sgentry_align are used in
> brcmfmac code but not configurable in dts file. Add the parsing logic.
> Now they can be configured like below in dts:
> 	brcm,broken_sg_support;
> 	brcm,sd_head_align = <4>;
> 	brcm,sd_sgentry_align = <4>;
>
> Signed-off-by: Chi-hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>
> ---
>   .../devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt        | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> index 86602f2..4d42f0d 100644
> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> @@ -17,6 +17,11 @@ Optional properties:
>   	When not specified the device will use in-band SDIO interrupts.
>    - interrupt-names : name of the out-of-band interrupt, which must be set
>   	to "host-wake".
> + - broken_sg_support : flag for broken sg list support of SDIO host controller.
> +	Set this to true if the SDIO host controller has higher align
> +	requirement than 32 bytes for each scatterlist item.

In DT context, this does not characterize the device but as described it 
is about the SDIO host controller. I think the same applies to the 
properties below, but not entirely sure about that.

> + - sg_head_align : alignment requirement for start of data buffer.
> + - sg_sgentry_align : length alignment requirement for each sg entry.

Regards,
Arend

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
