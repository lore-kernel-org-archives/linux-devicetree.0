From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/1] ARM: dts: sun8i: NanoPi NEO Air add
 WiFi / eMMC
Date: Fri, 24 Mar 2017 16:46:14 +0100
Message-ID: <20170324154614.mjfl6dnvwddp364b@lukather>
References: <20170323212444.20685-1-jelle@vdwaa.nl>
 <20170323212444.20685-2-jelle@vdwaa.nl>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6a3borbt5syvx4u"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBR762TDAKGQE3WODIHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170323212444.20685-2-jelle-oJJ1AqDjjO4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--d6a3borbt5syvx4u
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Thu, Mar 23, 2017 at 10:24:44PM +0100, Jelle van der Waa wrote:
> Enable the WiFi (AP6212) chip and eMMC support for the NanoPi NEO Air.
> 
> Signed-off-by: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts | 45 +++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
> index 3ba081c1f555..457a28e56514 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts
> @@ -73,6 +73,13 @@
>  			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
>  		};
>  	};
> +
> +	wifi-pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi-en-nanopi-neo-air>;

Could you please drop that pinctrl group for that GPIO? It will help
us prevent a bug in the future in the pinctrl driver that allows two
GPIO users to claim the same pin.

Unfortunately, that will require removing all those pinctrl properties
for the GPIOs, so we'd better not introduce them in the first place :)

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--d6a3borbt5syvx4u--
