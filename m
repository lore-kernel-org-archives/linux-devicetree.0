From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 07/12] arm64: dts: allwinner: orange-pi-3:
 Enable ethernet
Date: Mon, 8 Apr 2019 09:40:42 +0200
Message-ID: <20190408074042.74s5qckukcpore3e@flea>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-8-megous@megous.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b4c2cydsu6ghev6c"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBAXWVPSQKGQEF4ZEPPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190405234514.6183-8-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev@v
List-Id: devicetree@vger.kernel.org


--b4c2cydsu6ghev6c
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sat, Apr 06, 2019 at 01:45:09AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> Orange Pi 3 has two regulators that power the Realtek RTL8211E.
> According to the phy datasheet, both regulators need to be enabled
> at the same time, but we can only specify a single phy-supply in
> the DT.
>
> This can be achieved by making one regulator depedning on the
> other via vin-supply. While it's not a technically correct
> description of the hardware, it achieves the purpose.
>
> All values of RX/TX delay were tested exhaustively and a middle
> one of the working values was chosen.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> index 644946749088..5270142527f5 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -15,6 +15,7 @@
>
>  	aliases {
>  		serial0 = &uart0;
> +		ethernet0 = &emac;
>  	};
>
>  	chosen {
> @@ -64,6 +65,27 @@
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
>  	};
> +
> +	/*
> +	 * The board uses 2.5V RGMII signalling. Power sequence
> +	 * to enable the phy is to enable GMAC-2V5 and GMAC-3V3 (aldo2)
> +	 * power rails at the same time and to wait 100ms.
> +	 */
> +	reg_gmac_2v5: gmac-2v5 {
> +                compatible = "regulator-fixed";
> +                regulator-name = "gmac-2v5";
> +                regulator-min-microvolt = <2500000>;
> +                regulator-max-microvolt = <2500000>;
> +                startup-delay-us = <100000>;
> +                enable-active-high;
> +                gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */

Is enable-active-high still needed? It's redundant with the
GPIO_ACTIVE_HIGH flag.

The indentation is wrong here as well.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--b4c2cydsu6ghev6c--
