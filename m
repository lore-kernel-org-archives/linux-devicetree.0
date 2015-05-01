From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: sunxi: Add SPI aliases on
 A10s Olinuxino.
Date: Fri, 1 May 2015 22:24:14 +0200
Message-ID: <20150501202414.GL6062@lukather>
References: <cover.1430295711.git.hramrach@gmail.com>
 <b37eb9810d805ec1ac6e1e3f9d860c081ed87966.1430295711.git.hramrach@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IuJpT0rwbUevm2bB"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH6CR6VAKGQETQSVFOY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b37eb9810d805ec1ac6e1e3f9d860c081ed87966.1430295711.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--IuJpT0rwbUevm2bB
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Apr 29, 2015 at 09:41:17AM +0200, Michal Suchanek wrote:
> SPI aliases give nicer spidev device node names.
> 
> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
> index cd8d08a..a49fc6a 100644
> --- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
> +++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
> @@ -63,6 +63,9 @@
>  		serial0 = &uart0;
>  		serial1 = &uart2;
>  		serial2 = &uart3;
> +		spi0 = &spi0;
> +		spi1 = &spi1;
> +		spi2 = &spi2;

That patch should be merged with the patch 3, and since there's only
spi2 in use on that board, it should be aliased to spi0.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--IuJpT0rwbUevm2bB--
