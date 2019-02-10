From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-gxbb-odroidc2: enable I2C bus B
Date: Sun, 10 Feb 2019 11:56:14 +0100
Message-ID: <5C60034E.5030706@baylibre.com>
References: <20190209155005.18458-1-stijn@linux-ipv6.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190209155005.18458-1-stijn@linux-ipv6.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stijn Tintel <stijn@linux-ipv6.be>, khilman@baylibre.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Le 09/02/2019 16:50, Stijn Tintel a =E9crit :
> The ODROID C2 has 2 I2C buses, so enable both of them.

Thanks for the change, but this I2C bus is on the 40-pin header,
until we have a way to add support for HATs/CAPEs/<whatever hooks on the he=
ader>
upstream, we prefer not enabling any functions on these pins by default.

You can, if you want add support for most functions, but "disabled" with a
proper description of pins used by these functions.

You can also maintain a set of overlay files like it's done for the
libretech-cc boards https://github.com/libre-computer-project/libretech-ove=
rlays/tree/for-4.13.y/overlays
and use them with the Armbian mainline based latest image for example.

Neil

> =

> Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/a=
rm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 1cc9dc68ef00..ee666471a580 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -180,6 +180,12 @@
>  	pinctrl-names =3D "default";
>  };
>  =

> +&i2c_B {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&i2c_b_pins>;
> +	pinctrl-names =3D "default";
> +};
> +
>  &ir {
>  	status =3D "okay";
>  	pinctrl-0 =3D <&remote_input_ao_pins>;
> =
