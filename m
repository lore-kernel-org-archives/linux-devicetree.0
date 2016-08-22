From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/9] regulator: axp20x: support AXP806 variant
Date: Mon, 22 Aug 2016 17:52:59 +0100
Message-ID: <20160822165259.GS22076@sirena.org.uk>
References: <20160821021125.1521-1-wens@csie.org>
 <20160821021125.1521-5-wens@csie.org>
Reply-To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o/5eNASeIIpuMggS"
Return-path: <linux-sunxi+bncBDQ2L75W5QGBBAG45S6QKGQEE2PWRPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160821021125.1521-5-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--o/5eNASeIIpuMggS
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Aug 21, 2016 at 10:11:20AM +0800, Chen-Yu Tsai wrote:

> +	if (id == AXP806_DCDCB) {
> +		return (((reg & GENMASK(7, 6)) == BIT(6)) ||
> +			((reg & GENMASK(7, 6)) == BIT(7)));
> +	} else if (id == AXP806_DCDCC) {
> +		return ((reg & GENMASK(7, 6)) == BIT(7));
> +	} else if (id == AXP806_DCDCE) {
> +		return !!(reg & BIT(5));
> +	}

This looks like you're trying to write a switch statement, please do
that.
--o/5eNASeIIpuMggS--
