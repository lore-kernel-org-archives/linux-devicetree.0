From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: dts: imx6ul: 14x14-evk: add the optee node
Date: Sat, 22 Oct 2016 15:24:10 -0200
Message-ID: <CAOMZO5C1F7tRxsF6Q8=rbG45j8UP8XJxn3W_JXoEpUa2s2w85Q@mail.gmail.com>
References: <1477148229-6940-1-git-send-email-jason.hui.liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477148229-6940-1-git-send-email-jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Sat, Oct 22, 2016 at 12:57 PM, Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org> wrote:
> This patch adds the optee node for the i.MX6UL 14x14 evk board
>
> Signed-off-by: Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6ul-14x14-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dts b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
> index e281d50..e68dc19 100644
> --- a/arch/arm/boot/dts/imx6ul-14x14-evk.dts
> +++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
> @@ -30,6 +30,13 @@
>                 status = "okay";
>         };
>
> +       firmware {
> +               optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";

It seems we need to wait until the property lands in mainline.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
