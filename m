From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Patch v5 3/7] mfd: ti-keystone-devctrl: add bindings for device
 state control
Date: Thu, 22 May 2014 15:14:32 +0100
Message-ID: <20140522141432.GA19747@lee--X1>
References: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1400766516-14537-4-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400766516-14537-4-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, santosh.shilimkar@ti.com, arnd@arndb.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, sergei.shtylyov@cogentembedded.com, linux-doc@vger.kernel.org, w-kwok2@ti.com, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, m-karicheri2@ti.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Why do I only have this patch?  Where is the rest of the set?  Also,
it's on v5 and I don't recall seeing the other 4 versions?

> The Keystone II devices have a set of registers that are used to cont=
rol
> the status of its peripherals. This node is intended to allow access =
to
> this functionality.
>=20
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti-keystone-devctrl.txt   | 19 +++++++++=
++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti-keystone=
-devctrl.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctr=
l.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
> new file mode 100644
> index 0000000..35f7a66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
> @@ -0,0 +1,19 @@
> +* Device tree bindings for Texas Instruments keystone device state c=
ontrol
> +
> +The Keystone II devices have a set of registers that are used to con=
trol
> +the status of its peripherals. This node is intended to allow access=
 to
> +this functionality.
> +
> +Required properties:
> +
> +- compatible:		"ti,keystone-devctrl", "syscon"
> +
> +- reg:			contains offset/length value for pll controller
> +			registers space.

Why have you tabbed out all that way?

> +Example:
> +
> +devctrl: device-state-control {

This node needs an address:

devctrl: device-state-control@02620000 {

> +	compatible =3D "ti,keystone-devctrl", "syscon";
> +	reg =3D <0x02620000 0x1000>;
> +};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
