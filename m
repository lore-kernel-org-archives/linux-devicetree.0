From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 2/2] iio: ti-ads868x: Add DT binding documentation
Date: Sun, 27 Sep 2015 15:37:53 +0100
Message-ID: <5607FF41.9030101@kernel.org>
References: <1443162580-28293-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1443162580-28293-2-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443162580-28293-2-git-send-email-sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/09/15 07:29, Sean Nyekjaer wrote:
> Adding binding documentation for Texas Instruments ADS868X ADC.
>=20
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> Reviewed-by: Martin Hundeb=C3=B8ll <martin.hundeboll-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/ti-ads868x.txt         | 18 ++++++++=
++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads8=
68x.txt
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-ads868x.txt=
 b/Documentation/devicetree/bindings/iio/adc/ti-ads868x.txt
> new file mode 100644
> index 0000000..bc3c305
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-ads868x.txt
> @@ -0,0 +1,18 @@
> +* Texas Instruments' ADS8684 and ADS8688 ADC chip
> +
> +Required properties:
> + - compatible: Should be "ti,ads8684" or "ti,ads8688"
> + - reg: spi chip select number for the device
> + - vref-supply: The regulator supply for ADC reference voltage
In the driver it appears that this is optional rather than required.
Whether it is provided or not controls whether the external or internal
reference is used.
> +
> +Recommended properties:
> + - spi-max-frequency: Definition as per
> +		Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Example:
> +adc@0 {
> +	compatible =3D "ti,ads8688";
> +	reg =3D <0>;
> +	vref-supply =3D <&vdd_supply>;
> +	spi-max-frequency =3D <1000000>;
> +};
>=20
