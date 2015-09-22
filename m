From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt-bindings: Fix interrupt documentation
 file path
Date: Tue, 22 Sep 2015 22:56:34 +0100
Message-ID: <20150922215634.GD3442@x1>
References: <1442852740-3390-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442852740-3390-1-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 21 Sep 2015, Andrew F. Davis wrote:

> Fix the incorrect interrupt documentation file path in binding docs.
>=20
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt | 2 +-
>  Documentation/devicetree/bindings/mfd/arizona.txt          | 2 +-
>  Documentation/devicetree/bindings/mfd/palmas.txt           | 2 +-

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>  Documentation/devicetree/bindings/sound/wm8994.txt         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.t=
xt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> index dd5d2c0..4d6c8cd 100644
> --- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> @@ -24,7 +24,7 @@ controller.
>  - #interrupt-cells : Specifies the number of cells needed to encode =
an
>    interrupt.  Shall be set to 2.  The first cell defines the interru=
pt number,
>    the second encodes the triger flags encoded as described in
> -  Documentation/devicetree/bindings/interrupts.txt
> +  Documentation/devicetree/bindings/interrupt-controller/interrupts.=
txt
>  - interrupt-parent : The parent interrupt controller.
>  - interrupts : The interrupt to the parent controller raised when GP=
IOs
>    generate the interrupts.
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Docu=
mentation/devicetree/bindings/mfd/arizona.txt
> index a8fee60..3d361ec 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -24,7 +24,7 @@ Required properties:
>    - #interrupt-cells: the number of cells to describe an IRQ, this s=
hould be 2.
>      The first cell is the IRQ number.
>      The second cell is the flags, encoded as the trigger masks from
> -    Documentation/devicetree/bindings/interrupts.txt
> +    Documentation/devicetree/bindings/interrupt-controller/interrupt=
s.txt
> =20
>    - gpio-controller : Indicates this device is a GPIO controller.
>    - #gpio-cells : Must be 2. The first cell is the pin number and th=
e
> diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Docum=
entation/devicetree/bindings/mfd/palmas.txt
> index eda8989..8ae1a32 100644
> --- a/Documentation/devicetree/bindings/mfd/palmas.txt
> +++ b/Documentation/devicetree/bindings/mfd/palmas.txt
> @@ -24,7 +24,7 @@ and also the generic series names
>  - #interrupt-cells : should be set to 2 for IRQ number and flags
>    The first cell is the IRQ number.
>    The second cell is the flags, encoded as the trigger masks from
> -  Documentation/devicetree/bindings/interrupts.txt
> +  Documentation/devicetree/bindings/interrupt-controller/interrupts.=
txt
>  - interrupt-parent : The parent interrupt controller.
> =20
>  Optional properties:
> diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Doc=
umentation/devicetree/bindings/sound/wm8994.txt
> index e045e90..68c4e8d 100644
> --- a/Documentation/devicetree/bindings/sound/wm8994.txt
> +++ b/Documentation/devicetree/bindings/sound/wm8994.txt
> @@ -30,7 +30,7 @@ Optional properties:
>    - #interrupt-cells: the number of cells to describe an IRQ, this s=
hould be 2.
>      The first cell is the IRQ number.
>      The second cell is the flags, encoded as the trigger masks from
> -    Documentation/devicetree/bindings/interrupts.txt
> +    Documentation/devicetree/bindings/interrupt-controller/interrupt=
s.txt
> =20
>    - clocks : A list of up to two phandle and clock specifier pairs
>    - clock-names : A list of clock names sorted in the same order as =
clocks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
