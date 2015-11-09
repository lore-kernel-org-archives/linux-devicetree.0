From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/2] iio: ti-ads8688: Add DT binding documentation
Date: Mon, 9 Nov 2015 09:57:59 -0600
Message-ID: <20151109155759.GA23092@rob-hp-laptop>
References: <1447073580-17889-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1447073580-17889-2-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447073580-17889-2-git-send-email-sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 09, 2015 at 01:53:00PM +0100, Sean Nyekjaer wrote:
> Adding binding documentation for Texas Instruments ADS8688 ADC.
>=20
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> Reviewed-by: Martin Hundeb=F8ll <martin.hundeboll-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> Changes since v2:
> - Moved vref-supply to Optional properties
>=20
>  .../devicetree/bindings/iio/adc/ti-ads8688.txt       | 20 ++++++++++=
++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads8=
688.txt
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt=
 b/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt
> new file mode 100644
> index 0000000..a02337d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-ads8688.txt
> @@ -0,0 +1,20 @@
> +* Texas Instruments' ADS8684 and ADS8688 ADC chip
> +
> +Required properties:
> + - compatible: Should be "ti,ads8684" or "ti,ads8688"
> + - reg: spi chip select number for the device
> +
> +Recommended properties:
> + - spi-max-frequency: Definition as per
> +		Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Optional properties:
> + - vref-supply: The regulator supply for ADC reference voltage
> +
> +Example:
> +adc@0 {
> +	compatible =3D "ti,ads8688";
> +	reg =3D <0>;
> +	vref-supply =3D <&vdd_supply>;
> +	spi-max-frequency =3D <1000000>;
> +};
> --=20
> 2.6.2
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
