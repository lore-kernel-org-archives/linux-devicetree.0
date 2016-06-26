From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] iio: potentiometer: mcp4531: Add device tree
 binding documentation
Date: Sun, 26 Jun 2016 23:38:35 +0200
Message-ID: <32d8162f-bb62-2c90-d194-0023320be392@axentia.se>
References: <1466972567-9580-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466972567-9580-3-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466972567-9580-3-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016-06-26 22:22, Florian Vaussard wrote:
> Add the device tree documentation for all the supported parts. Apart =
the
> compatible string and standard I2C binding, no other binding is curre=
ntly
> needed.
>=20
> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
> ---
>  .../devicetree/bindings/i2c/trivial-devices.txt    | 64 ++++++++++++=
++++++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.tx=
t b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> index 53987449..4ffe9a9 100644
> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> @@ -56,6 +56,70 @@ maxim,ds1050		5 Bit Programmable, Pulse-Width Modu=
lator
>  maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
>  maxim,max6625		9-Bit/12-Bit Temperature Sensors with I=C2=B2C-Compat=
ible Serial Interface
>  mc,rv3029c2		Real Time Clock Module with I2C-Bus
> +microchip,mcp4531-502	Microchip 8-bit Single I2C Digital Potentiomet=
er (5k)
                                          ^
You have mixed up 7/8-bit, here and below.

Cheers,
Peter

> +microchip,mcp4531-103	Microchip 8-bit Single I2C Digital Potentiomet=
er (10k)
> +microchip,mcp4531-503	Microchip 8-bit Single I2C Digital Potentiomet=
er (50k)
> +microchip,mcp4531-104	Microchip 8-bit Single I2C Digital Potentiomet=
er (100k)
> +microchip,mcp4532-502	Microchip 8-bit Single I2C Digital Potentiomet=
er (5k)
> +microchip,mcp4532-103	Microchip 8-bit Single I2C Digital Potentiomet=
er (10k)
> +microchip,mcp4532-503	Microchip 8-bit Single I2C Digital Potentiomet=
er (50k)
> +microchip,mcp4532-104	Microchip 8-bit Single I2C Digital Potentiomet=
er (100k)
> +microchip,mcp4541-502	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (5k)
> +microchip,mcp4541-103	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (10k)
> +microchip,mcp4541-503	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (50k)
> +microchip,mcp4541-104	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (100k)
> +microchip,mcp4542-502	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (5k)
> +microchip,mcp4542-103	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (10k)
> +microchip,mcp4542-503	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (50k)
> +microchip,mcp4542-104	Microchip 8-bit Single I2C Digital Potentiomet=
er with NV Memory (100k)
> +microchip,mcp4551-502	Microchip 7-bit Single I2C Digital Potentiomet=
er (5k)
> +microchip,mcp4551-103	Microchip 7-bit Single I2C Digital Potentiomet=
er (10k)
> +microchip,mcp4551-503	Microchip 7-bit Single I2C Digital Potentiomet=
er (50k)
> +microchip,mcp4551-104	Microchip 7-bit Single I2C Digital Potentiomet=
er (100k)
> +microchip,mcp4552-502	Microchip 7-bit Single I2C Digital Potentiomet=
er (5k)
> +microchip,mcp4552-103	Microchip 7-bit Single I2C Digital Potentiomet=
er (10k)
> +microchip,mcp4552-503	Microchip 7-bit Single I2C Digital Potentiomet=
er (50k)
> +microchip,mcp4552-104	Microchip 7-bit Single I2C Digital Potentiomet=
er (100k)
> +microchip,mcp4561-502	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (5k)
> +microchip,mcp4561-103	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (10k)
> +microchip,mcp4561-503	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (50k)
> +microchip,mcp4561-104	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (100k)
> +microchip,mcp4562-502	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (5k)
> +microchip,mcp4562-103	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (10k)
> +microchip,mcp4562-503	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (50k)
> +microchip,mcp4562-104	Microchip 7-bit Single I2C Digital Potentiomet=
er with NV Memory (100k)
> +microchip,mcp4631-502	Microchip 8-bit Dual I2C Digital Potentiometer=
 (5k)
> +microchip,mcp4631-103	Microchip 8-bit Dual I2C Digital Potentiometer=
 (10k)
> +microchip,mcp4631-503	Microchip 8-bit Dual I2C Digital Potentiometer=
 (50k)
> +microchip,mcp4631-104	Microchip 8-bit Dual I2C Digital Potentiometer=
 (100k)
> +microchip,mcp4632-502	Microchip 8-bit Dual I2C Digital Potentiometer=
 (5k)
> +microchip,mcp4632-103	Microchip 8-bit Dual I2C Digital Potentiometer=
 (10k)
> +microchip,mcp4632-503	Microchip 8-bit Dual I2C Digital Potentiometer=
 (50k)
> +microchip,mcp4632-104	Microchip 8-bit Dual I2C Digital Potentiometer=
 (100k)
> +microchip,mcp4641-502	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (5k)
> +microchip,mcp4641-103	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (10k)
> +microchip,mcp4641-503	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (50k)
> +microchip,mcp4641-104	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (100k)
> +microchip,mcp4642-502	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (5k)
> +microchip,mcp4642-103	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (10k)
> +microchip,mcp4642-503	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (50k)
> +microchip,mcp4642-104	Microchip 8-bit Dual I2C Digital Potentiometer=
 with NV Memory (100k)
> +microchip,mcp4651-502	Microchip 7-bit Dual I2C Digital Potentiometer=
 (5k)
> +microchip,mcp4651-103	Microchip 7-bit Dual I2C Digital Potentiometer=
 (10k)
> +microchip,mcp4651-503	Microchip 7-bit Dual I2C Digital Potentiometer=
 (50k)
> +microchip,mcp4651-104	Microchip 7-bit Dual I2C Digital Potentiometer=
 (100k)
> +microchip,mcp4652-502	Microchip 7-bit Dual I2C Digital Potentiometer=
 (5k)
> +microchip,mcp4652-103	Microchip 7-bit Dual I2C Digital Potentiometer=
 (10k)
> +microchip,mcp4652-503	Microchip 7-bit Dual I2C Digital Potentiometer=
 (50k)
> +microchip,mcp4652-104	Microchip 7-bit Dual I2C Digital Potentiometer=
 (100k)
> +microchip,mcp4661-502	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (5k)
> +microchip,mcp4661-103	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (10k)
> +microchip,mcp4661-503	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (50k)
> +microchip,mcp4661-104	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (100k)
> +microchip,mcp4662-502	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (5k)
> +microchip,mcp4662-103	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (10k)
> +microchip,mcp4662-503	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (50k)
> +microchip,mcp4662-104	Microchip 7-bit Dual I2C Digital Potentiometer=
 with NV Memory (100k)
>  national,lm63		Temperature sensor with integrated fan control
>  national,lm75		I2C TEMP SENSOR
>  national,lm80		Serial Interface ACPI-Compatible Microprocessor Syste=
m Hardware Monitor
>=20
