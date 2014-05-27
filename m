From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Patch v7 3/7] mfd: ti-keystone-devctrl: add bindings for device
 state control
Date: Tue, 27 May 2014 10:24:28 +0100
Message-ID: <20140527092428.GH5875@lee--X1>
References: <1400859812-5761-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1400859812-5761-4-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400859812-5761-4-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, santosh.shilimkar@ti.com, arnd@arndb.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, rdunlap@infradead.org, mturquette@linaro.org, linux@arm.linux.org.uk, grygorii.strashko@ti.com, olof@lixom.net, w-kwok2@ti.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m-karicheri2@ti.com, sergei.shtylyov@cogentembedded.com
List-Id: devicetree@vger.kernel.org

> The Keystone II devices have a set of registers that are used to cont=
rol
> the status of its peripherals. This node is intended to allow access =
to
> this functionality.
>=20
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>

Acked-by: Lee Jones <lee.jones@linaro.org>

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
> index 0000000..20963c7
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
> +- reg:			contains offset/length value for device state control
> +			registers space.
> +
> +Example:
> +
> +devctrl: device-state-control@0x02620000 {
> +	compatible =3D "ti,keystone-devctrl", "syscon";
> +	reg =3D <0x02620000 0x1000>;
> +};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
