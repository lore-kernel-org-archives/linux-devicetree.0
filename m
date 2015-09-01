From: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone: use one to one address translations
 under netcp
Date: Tue, 01 Sep 2015 14:19:20 -0700
Message-ID: <55E61658.9010207@oracle.com>
References: <1441139324-29296-1-git-send-email-w-kwok2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441139324-29296-1-git-send-email-w-kwok2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: m-karicheri2-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/1/15 1:28 PM, WingMan Kwok wrote:
> Network subsystem NetCP in Keystone-2 devices includes some HW blocks
> that are memory mapped to ranges outside that of the NetCP itself.
> Thus address space of a child node of the NetCP node needs to be
> mapped 1:1 onto the parent address space.  Hence empty ranges
> should be used under the NetCP node.
>
> Signed-off-by: WingMan Kwok <w-kwok2-l0cyMroinI0@public.gmane.org>
> ---
>   arch/arm/boot/dts/k2e-netcp.dtsi  |    8 +++-----
>   arch/arm/boot/dts/k2hk-netcp.dtsi |   14 ++++++--------
>   arch/arm/boot/dts/k2l-netcp.dtsi  |    8 +++-----
>   3 files changed, 12 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm/boot/dts/k2e-netcp.dtsi b/arch/arm/boot/dts/k2e-netcp.dtsi
> index b13b3c9..e103ed9 100644
> --- a/arch/arm/boot/dts/k2e-netcp.dtsi
> +++ b/arch/arm/boot/dts/k2e-netcp.dtsi
> @@ -111,9 +111,7 @@ netcp: netcp@24000000 {
>   	compatible = "ti,netcp-1.0";
>   	#address-cells = <1>;
>   	#size-cells = <1>;
> -
> -	/* NetCP address range */
> -	ranges = <0 0x24000000 0x1000000>;
> +	ranges;
>
What blocks are we talking here. We need to increase the
range if the current range isn't covering entire NETCP
address space. Removing range isn't a solution.

Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
