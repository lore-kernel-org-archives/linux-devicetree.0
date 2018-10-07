From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add PNI RM3100 device tree binding.
Date: Sun, 7 Oct 2018 16:18:08 +0100
Message-ID: <20181007161808.44a61d45@archlinux>
References: <20180925031724.21399-1-songqiang1304521@gmail.com>
        <20181002143812.3661-1-songqiang1304521@gmail.com>
        <20181002143812.3661-3-songqiang1304521@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002143812.3661-3-songqiang1304521@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Song Qiang <songqiang1304521@gmail.com>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, himanshujha199640@gmail.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  2 Oct 2018 22:38:11 +0800
Song Qiang <songqiang1304521@gmail.com> wrote:

> Signed-off-by: Song Qiang <songqiang1304521@gmail.com>
> ---
>  .../bindings/iio/magnetometer/pni,rm3100.txt  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/pn=
i,rm3100.txt
>=20
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/pni,rm310=
0.txt b/Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.txt
> new file mode 100644
> index 000000000000..4677690fc5d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.txt
> @@ -0,0 +1,20 @@
> +* PNI RM3100 3-axis magnetometer sensor
> +
> +Required properties:
> +
> +- compatible : should be "pni,rm3100"
> +- reg : the I2C address or SPI chip select number of the sensor.
> +
> +Optional properties:
> +
> +- interrupts: data ready (DRDY) from the chip.
> +  The interrupts can be triggered on rising edges.
=46rom Phil's response this appears to be incorrect and
it's actually a level sensitive interrupt.
I haven't checked the data sheet to confirm this.

That'll bring all sorts of pain if you have a host that can only
do edge sensitive so I'm hoping that's not true for you
(edge sensitive only interrupts on hosts are pretty unusual
though it cause me a lot of problems when I started out
with IIO years ago :(

The docs aren't super clear on this.  The subtlety is
whether there is a guaranteed 'low' time between reading the
data and it going high again due to another reading.  This usually
only matters if you are running very quickly though so may be
fine here.

This will only become relevant with continuous mode if you
add support for that later (I think!)

Jonathan

> +
> +Example:
> +
> +rm3100: rm3100@20 {
> +	compatible =3D "pni,rm3100";
> +	reg =3D <0x20>;
> +	interrupt-parent =3D <&gpio0>;
> +	interrupts =3D <4 IRQ_TYPE_EDGE_RISING>;
> +};
