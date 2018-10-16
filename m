From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 7/9] ARM: dts: bcm2835-rpi: add onboard audio device
Date: Tue, 16 Oct 2018 09:18:10 -0700
Message-ID: <877eih6f25.fsf@anholt.net>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de> <20181016150228.16994-8-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-8-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Nicolas Saenz Julienne <nsaenzjulienne@suse.de> writes:

> The audio device interfaces with VCHIQ to send audio through the rpi's
> Headphones & HDMI.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  arch/arm/boot/dts/bcm2835-rpi.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index cb2d6d78a7fb..6cc580d17862 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -35,6 +35,11 @@
>  			reg = <0x7e00b840 0xf>;
>  			interrupts = <0 2>;
>  		};
> +
> +		audio: audio {
> +			compatible = "brcm,bcm2835-audio";
> +			brcm,pwm-channels = <8>;
> +		};
>  	};
>  };

Assuming the DT binding gets acked,

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlvGD0IACgkQtdYpNtH8
nuif9xAApg+DGvoIpJnp//LGcqJbH9rM/So9OtjNIl8pZLp+dJ3L0j0g9EToe2/N
fc8gDUBbeSH81O/a+rsm+DN+sp37SZ5UzFbTpuaiuDKBKcS/E577xzIfk+NRcqT7
GmAAerqj3b3jN8nJ6INXvYX6FYxoOpyvJETkjCaZuJIcGBKsAdAonghwxMJPOrCA
OUnMOrHmDvl/qXJ2yIKuJj3Tk3CRTe1HMN0EkoYIqjhHZ3UZJCS3IDtqYfTPxJZT
exLLEsol6E5T4AZddNq1bX5nLT+XO39gZZ4bg6AA2N1kfAIotp/kGjNXM2swN8ks
IjqIByjDoPiv0Ow+JoZwaD0y1AKT5EsLNKxJleZu4vRaSOa+0xcPWtcwSFYSonR0
UT5IZwNpo0EQ2rlPld1f1sqbtqNs3Is0RUXiIpJrFIoxEFsWESwMoBuCSoVz0H6j
DPpALctlRBvDqnj0lNEi5iHA0I+PbH9tbLckukeXecpIsmb/wXVlk1ZPUElyrfK7
badEgKijZn1MUJuNQoYZO704iWwDRbvm0itw6FOMgGhzMAoEBAqYaqL6kJAo0O2r
hsbcxh2geqmgVk/Qe4AmMmqklpD47xVCbuUNQm6kZ+DfY55gQL+QDZBI+JQZrMB+
pIJap0492wXd63R5ZTGrCitrF6v99D45Wqym2BFQhMZZi8inOjE=
=9slk
-----END PGP SIGNATURE-----
--=-=-=--
