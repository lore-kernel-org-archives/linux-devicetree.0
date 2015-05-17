From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 04/10] pinctrl: sunxi: Prepare for
 building SoC specific drivers as modules
Date: Sun, 17 May 2015 16:19:22 +0200
Message-ID: <20150517141922.GE4004@lukather>
References: <1431707940-19372-1-git-send-email-jenskuske@gmail.com>
 <1431707940-19372-5-git-send-email-jenskuske@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZvvH1QDaOFG4lOZN"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNOK4OVAKGQE7Z7F4XA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431707940-19372-5-git-send-email-jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--ZvvH1QDaOFG4lOZN
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, May 15, 2015 at 06:38:54PM +0200, Jens Kuske wrote:
> Add a remove function and export the init and remove function
> to allow us to build the SoC specific drivers as modules.
> 
> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 25 +++++++++++++++++++------
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index f8e171b..4ef6b3d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -856,7 +856,6 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
>  	struct sunxi_pinctrl *pctl;
>  	struct resource *res;
>  	int i, ret, last_pin;
> -	struct clk *clk;
>  
>  	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
>  	if (!pctl)
> @@ -954,13 +953,13 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
>  			goto gpiochip_error;
>  	}
>  
> -	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(clk)) {
> -		ret = PTR_ERR(clk);
> +	pctl->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(pctl->clk)) {
> +		ret = PTR_ERR(pctl->clk);
>  		goto gpiochip_error;
>  	}
>  
> -	ret = clk_prepare_enable(clk);
> +	ret = clk_prepare_enable(pctl->clk);
>  	if (ret)
>  		goto gpiochip_error;
>  
> @@ -1015,10 +1014,24 @@ int sunxi_pinctrl_init(struct platform_device *pdev,
>  	return 0;
>  
>  clk_error:
> -	clk_disable_unprepare(clk);
> +	clk_disable_unprepare(pctl->clk);
>  gpiochip_error:
>  	gpiochip_remove(pctl->chip);
>  pinctrl_error:
>  	pinctrl_unregister(pctl->pctl_dev);
>  	return ret;
>  }
> +EXPORT_SYMBOL(sunxi_pinctrl_init);
> +
> +int sunxi_pinctrl_remove(struct platform_device *pdev)
> +{
> +	struct sunxi_pinctrl *pctl = platform_get_drvdata(pdev);
> +
> +	gpiochip_remove(pctl->chip);
> +	pinctrl_unregister(pctl->pctl_dev);
> +
> +	clk_disable_unprepare(pctl->clk);

We should also remove the domain and the interrupt mapping here.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--ZvvH1QDaOFG4lOZN--
