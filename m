From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] nvmem: imx-ocotp: handling clock
Date: Tue, 19 Apr 2016 07:42:17 -0300
Message-ID: <CAOMZO5CBeMn_m79vUzmk21nA1s+COiFoqfywXUJ2mOS38wBAdg@mail.gmail.com>
References: <1461054788-339-1-git-send-email-van.freenix@gmail.com>
	<1461054788-339-3-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461054788-339-3-git-send-email-van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Fan <van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Peng,

On Tue, Apr 19, 2016 at 5:33 AM, Peng Fan <van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> @@ -46,11 +48,15 @@ static int imx_ocotp_read(void *context, const void *reg, size_t reg_size,
>         if (count > (priv->nregs - index))
>                 count = priv->nregs - index;
>
> +       clk_prepare_enable(priv->clk);

clk_prepare_enable() may fail, so you should better check its return
value and propagate it in the case of error.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
