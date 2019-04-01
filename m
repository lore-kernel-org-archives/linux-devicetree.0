From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ARM: dts: sun8i: tbs-a711: Add node
 for BMA250 accelerometer
Date: Mon, 1 Apr 2019 14:54:18 +0200
Message-ID: <20190401125418.udh5dfid2rqzqxi4@flea>
References: <20190401115616.21337-1-megous@megous.com>
 <20190401115616.21337-2-megous@megous.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mc77lh6hyeikdfbm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB7UTRDSQKGQEJ5MEDKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190401115616.21337-2-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mc77lh6hyeikdfbm
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Mon, Apr 01, 2019 at 01:56:12PM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> A711 tablet has BMA250 accelerometer connected to I2C1 bus. Enable
> both the I2C1 bus and add the accelerometer device to it.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> index 1e840ab5a541..d70fe04b66f0 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> @@ -156,6 +156,19 @@
>  	status = "okay";
>  };
>
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* Accelerometer */
> +	accelerometer@18 {
> +		compatible = "bosch,bma250";
> +		reg = <0x18>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <7 10 IRQ_TYPE_EDGE_RISING>; /* PH10 / EINT10 */
> +	};
> +};

I've dropped the comment, since it's pretty obvious now, and applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--mc77lh6hyeikdfbm--
