From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 4/6] reset: sunxi: Add Allwinner H3 bus resets
Date: Wed, 28 Oct 2015 12:42:35 +0100
Message-ID: <1446032555.12590.34.camel@pengutronix.de>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
	 <1445964626-6484-5-git-send-email-jenskuske@gmail.com>
Reply-To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDUKXHHSSIJBBOXJYKYQKGQEVLLOIGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1445964626-6484-5-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jens,

Am Dienstag, den 27.10.2015, 17:50 +0100 schrieb Jens Kuske:
[...]
> --- a/drivers/reset/reset-sunxi.c
> +++ b/drivers/reset/reset-sunxi.c
> @@ -75,7 +75,9 @@ static struct reset_control_ops sunxi_reset_ops = {
>  	.deassert	= sunxi_reset_deassert,
>  };
>  
> -static int sunxi_reset_init(struct device_node *np)
> +static int sunxi_reset_init(struct device_node *np,
> +			    int (*of_xlate)(struct reset_controller_dev *rcdev,
> +				    const struct of_phandle_args *reset_spec))

I'd add a tab to the indentation and drop the of_xlate parameter names.
If you agree to this change, I'll fix it up when I apply it.

best regards
Philipp
