From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls1088a: Add USB support
Date: Fri, 18 Aug 2017 21:02:25 +0800
Message-ID: <20170818130224.GN7608@dragon>
References: <1503044085-5024-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1503044085-5024-1-git-send-email-yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yinbo.zhu-3arQi8VN3Tc@public.gmane.org
Cc: linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, "open list:" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 04:14:45PM +0800, yinbo.zhu-3arQi8VN3Tc@public.gmane.org wrote:
> From: "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
> 
> Fix the issue that usb is not detected on ls1088ardb
> 
> Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>

You are sending an updated patch.  Please have the version number in
subject prefix ...

> ---

... and a change history here.  There are a lot of good examples on the
list.  Please have a check.

>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |  8 ++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 20 ++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> index 213abb7..6c3c3bc 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> @@ -118,6 +118,14 @@
>  	status = "okay";
>  };
>  
> +&usb0 {
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	status = "okay";
> +};
> +
>  &esdhc {
>  	status = "okay";
>  };

I had already put this on previous version - please sort these labelled
nodes alphabetically.  That said, &usb should go after &sata.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
