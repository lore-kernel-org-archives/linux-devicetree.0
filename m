From: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: at91: dt: at91sam9n12ek: enable udp
Date: Mon, 9 Feb 2015 11:04:04 +0100
Message-ID: <20150209100404.GA17242@gradator.net>
References: <1423472572-19824-1-git-send-email-voice.shen@atmel.com>
 <1423472572-19824-4-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1423472572-19824-4-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Bo,

On Mon, Feb 09, 2015 at 05:02:52PM +0800, Bo Shen wrote:
> Enable usb device port on at91sam9n12ek board.
>=20
> Signed-off-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>=20
>  arch/arm/boot/dts/at91sam9n12ek.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/=
at91sam9n12ek.dts
> index 13bb24e..3e572e5 100644
> --- a/arch/arm/boot/dts/at91sam9n12ek.dts
> +++ b/arch/arm/boot/dts/at91sam9n12ek.dts
> @@ -120,6 +120,11 @@
>  				};
>  			};
> =20
> +			usb1: gadget@f803c000 {
> +				atmel,vbus-gpio =3D <&pioB 16 GPIO_ACTIVE_HIGH>;
> +				status =3D "okay";
> +			};
> +

There is an external resistor divider on PB16, acting like a pull-down=20
(R22+R23). PB16 reset state is input, pull-up, schmitt trigger, you nee=
d=20
to disable the pull-up in pinctrl this way:

usb1: gadget@f803c000 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pinctrl_board_usb1>;
	=E2=80=A6
}

pinctrl =E2=80=A6 {
	usb1 {
		pinctrl_board_usb1: usb1-board {
			atmel,pins =3D <AT91_PIOB 16 AT91_PERIPH_GPIO AT91_PINCTRL_DEGLITCH>=
;    /* PB16, no pull up and deglitch */
		};
	};
};


Sylvain
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
