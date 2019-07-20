From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 4/8] clk: sunxi-ng: v3s: add missing
 clock slices for MMC2 module clocks
Date: Sat, 20 Jul 2019 11:44:49 +0200
Message-ID: <20190720094449.dh53rbxz3mc74qls@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-5-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bygt3ojtr3w3kmjg"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFGFZPUQKGQEEAQMK2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-5-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bygt3ojtr3w3kmjg
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:30AM +0800, Icenowy Zheng wrote:
> The MMC2 clock slices are currently not defined in V3s CCU driver, which
> makes MMC2 not working.
>
> Fix this issue.
>
> Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> New patch in v4.
>
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> index 4eb68243e310..9c88015d4419 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> @@ -513,6 +513,9 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
>  		[CLK_MMC1]		= &mmc1_clk.common.hw,
>  		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
>  		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
> +		[CLK_MMC2]		= &mmc1_clk.common.hw,
> +		[CLK_MMC2_SAMPLE]	= &mmc1_sample_clk.common.hw,
> +		[CLK_MMC2_OUTPUT]	= &mmc1_output_clk.common.hw,

You're using the same structures than mmc1, I guess it's a copy and
paste mistake?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--bygt3ojtr3w3kmjg--
