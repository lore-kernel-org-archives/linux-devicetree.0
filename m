From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: sun8i-h3-nanopi-m1-plus:
 enable HDMI output
Date: Thu, 20 Sep 2018 14:41:47 +0200
Message-ID: <20180920124147.u2f72ygfch5my5sa@flea>
References: <1537388051-39623-1-git-send-email-clabbe@baylibre.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="75hr75ezvexduvs4"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFVLR3OQKGQETNC5S2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1537388051-39623-1-git-send-email-clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--75hr75ezvexduvs4
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi!

On Wed, Sep 19, 2018 at 08:14:11PM +0000, Corentin Labbe wrote:
> This patch enable HDMI output on sun8i-h3-nanopi-m1-plus.
> 
> Signed-off-by: Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> index 65cba1050802..88b5ff6b66b6 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> @@ -67,6 +67,21 @@
>  		pinctrl-names = "default";
>  		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
>  	};
> +
> +	connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint = <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&de {
> +	status = "okay";
>  };
>  
>  &ehci1 {
> @@ -94,6 +109,17 @@
>  	};
>  };
>  
> +&hdmi {
> +	status = "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint = <&hdmi_con_in>;
> +	};
> +	status = "okay";

you don't need that status property here

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--75hr75ezvexduvs4--
