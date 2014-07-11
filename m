From: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: document Rockchip saradc
Date: Fri, 11 Jul 2014 23:57:44 +0200
Message-ID: <53C05DD8.9050500@gmx.de>
References: <2959154.xc8BQActsn@diego> <3591595.sBj6Zqo42A@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3591595.sBj6Zqo42A@diego>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?B?ImVkZGllKOiUoeaeqyki?= <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Heiko St=C3=BCbner schrieb:
> This add the necessary binding documentation for the saradc found in =
all recent
> processors from Rockchip.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
Spotted some typos, see inline.
>  .../bindings/iio/adc/rockchip-saradc.txt           | 28 ++++++++++++=
++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/rockchi=
p-saradc.txt
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-sarad=
c.txt b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> new file mode 100644
> index 0000000..603ac9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> @@ -0,0 +1,28 @@
> +Rockhip Successive Approximation Register (SAR) A/D Converter bindin=
gs
Should be "Rockchip".
> +
> +Required properties:
> +- compatible: Should be "rockchip,saradc"
> +- reg: physical base address of the controller and length of memory =
mapped
> +       region.
> +- interrupts: The interrupt number to the cpu. The interrupt specifi=
er format
> +              depends on the interrupt controller.
> +- clocks: Must contain an entry for each entry in clock-names.
> +- clock-names: Shall be "saradc" for the converter-clock, and "apb_p=
clk" for
> +               the peripheral clock.
> +- vref-supply: The regulator supply ADC refrence voltage.
=2E.. reference voltage.
> +- #io-channel-cells: Should be 1, see ../iio-bindings.txt
> +
> +Optional properties :
> +- clock-frequency : converter frequency in Hz. If omitted, 1MHz is u=
sed.
> +
> +Example:
> +	saradc: saradc@2006c000 {
> +		compatible =3D "rockchip,saradc";
> +		reg =3D <0x2006c000 0x100>;
> +		interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
> +		clock-names =3D "saradc", "apb_pclk";
> +		#io-channel-cells =3D <1>;
> +		vref-supply =3D <&vcc18>;
> +		clock-frequency =3D <1000000>;
> +	};
