From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: sun7i: Convert to CCU
Date: Mon, 1 May 2017 18:05:53 +0200
Message-ID: <20170501160553.fa67agqy5ltpwo7p@lukather>
References: <cover.908ce010a25e503bb5ad0967759c723219c6ed0d.1493235134.git-series.plaes@plaes.org>
 <560676328328d23f344468f5c43ff1b1533f36f0.1493235134.git-series.plaes@plaes.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="amwjgju27qxirult"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBYVZTXEAKGQEDLLT5LY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <560676328328d23f344468f5c43ff1b1533f36f0.1493235134.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--amwjgju27qxirult
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Wed, Apr 26, 2017 at 10:32:24PM +0300, Priit Laes wrote:
>  			compatible = "allwinner,simple-framebuffer",
>  				     "simple-framebuffer";
>  			allwinner,pipeline = "de_be0-lcd0-hdmi";
> -			clocks = <&ahb_gates 36>, <&ahb_gates 43>,
> -				 <&ahb_gates 44>, <&de_be0_clk>,
> -				 <&tcon0_ch1_clk>, <&dram_gates 26>;
> +			clocks = <&ccu CLK_AHB_LCD0>, <&ccu CLK_AHB_HDMI0>,
> +				 <&ccu CLK_AHB_DE_BE0>, <&ccu CLK_DE_BE0>,
> +				 <&ccu CLK_TCON0_CH1>, <&ccu CLK_DRAM_DE_BE0>,
> +				 <&ccu CLK_HDMI>;

In order to make merging those patches *much* easier, could you just
use the raw IDs (ie not the defines, but the numbers) for now?

And ideally, send a patch after 4.13-rc1 that will switch to the
defines.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--amwjgju27qxirult--
