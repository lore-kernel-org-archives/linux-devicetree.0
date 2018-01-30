From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 5/6] arm: dts: sun8i: a83t: bananapi-m3:
 Enable IR controller
Date: Tue, 30 Jan 2018 09:40:16 +0100
Message-ID: <20180130084016.4uyrd425qpzyiyql@flea.lan>
References: <20180129155810.7867-1-embed3d@gmail.com>
 <20180129155810.7867-6-embed3d@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q22bqurpyklj4yxv"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7G6YDJQKGQEZHVBNJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180129155810.7867-6-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--q22bqurpyklj4yxv
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jan 29, 2018 at 04:58:09PM +0100, Philipp Rossak wrote:
> The Bananapi M3 has an onboard IR receiver.
> This enables the onboard IR receiver subnode.
> Unlike the other IR receivers this one needs a base clock frequency
> of 3000000 Hz (3 MHz), to be able to work.
> 
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> index 6550bf0e594b..ffc6445fd281 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
> @@ -82,6 +82,13 @@
>  	};
>  };
>  
> +&cir {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&cir_pins>;

If this is the only muxing option (like your node name suggests), you
can put it directly in the DTSI to remove boilerplate from all the
DTS.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--q22bqurpyklj4yxv--
