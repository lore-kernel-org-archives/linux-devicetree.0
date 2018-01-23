From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: add ARM power domain support
Date: Tue, 23 Jan 2018 14:48:12 +0100
Message-ID: <1516715292.25726.23.camel@pengutronix.de>
References: <1516725734-32745-1-git-send-email-Anson.Huang@nxp.com>
         <1516725734-32745-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516725734-32745-2-git-send-email-Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-imx-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 24.01.2018, 00:42 +0800 schrieb Anson Huang:
> Add ARM power domain in PGC.
> 
> Signed-off-by: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>

Reviewed-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> ---
> this patch should be based on 0001-ARM-dts-imx6sx-add-pu-power-domain-support.patch
>  arch/arm/boot/dts/imx6sx.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> index 42ef4c6..aa29ca6 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -768,6 +768,11 @@
> >  					#address-cells = <1>;
> >  					#size-cells = <0>;
>  
> > +					power-domain@0 {
> > +						reg = <0>;
> > +						#power-domain-cells = <0>;
> > +					};
> +
> > >  					pd_pu: power-domain@1 {
> >  						reg = <1>;
> >  						#power-domain-cells = <0>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
