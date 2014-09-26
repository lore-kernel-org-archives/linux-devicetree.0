From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 4/4] arch: arm: boot: dts: Added correct vendor-prefix
 with device name to compatible property
Date: Fri, 26 Sep 2014 14:50:47 +0100
Message-ID: <20140926135047.GH7422@leverpostej>
References: <1411734292-10910-1-git-send-email-darshanapadmadas@gmail.com>
 <1411734292-10910-5-git-send-email-darshanapadmadas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411734292-10910-5-git-send-email-darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Sep 26, 2014 at 01:24:52PM +0100, Darshana Padmadas wrote:
> This patch adds the correct vendor-prefix listed in Documentation/devicetree/bindings/vendor-prefixes.txt
> with the device name to compatible property.
> 
> Signed-off-by: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> index 2063795..491fed6 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
> +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
> @@ -187,7 +187,7 @@
>  
>  		/* ALS and Proximity sensor */
>  		isl29028@44 {
> -			compatible = "isil,isl29028";
> +			compatible = "isl,isl29028", "isil,isl29028";

Please either drop the old string, or don't add the new string.

For compatibility with old DTBs, the kernel must continue to support the
old string. So the old string will alone will work -- it's not necessary
to add the new one to DTs just because the kernel now supports it.

However, this DTB need not work with older kernels, so you could simply
replace the string with the new one if your aim is to remove instances
of "isil" to ensure consistency going forwards. If so, please mention
that in the commit message.

Additionally, please Cc the Tegra maintainers if you touch their DTs,
along with arm-soc. They both need to have some visibility of this and
might not be subscribed to the devicetree mailing list. You should be
able to find a list of people to Cc by using get_maintainer.pl.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
