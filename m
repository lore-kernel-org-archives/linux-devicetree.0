From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 04/11] mfd: syscon: Add Atmel SMC binding doc
Date: Mon, 10 Nov 2014 09:55:02 +0000
Message-ID: <20141110095502.GH21424@x1>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
 <1415203287-21517-5-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415203287-21517-5-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 05 Nov 2014, Boris Brezillon wrote:

> The SMC registers are used to configure Atmel EBI (External Bus Inter=
face)
> to interface with standard memory devices (NAND, NOR, SRAM or special=
ized
> devices like FPGAs).
>=20
> Declare this memory region as a syscon, so that different drivers can
> configure the SMC interface (mostly timing configuration) according t=
o
> their need.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-smc.txt | 19 +++++++++++=
++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-smc.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-smc.txt b/Do=
cumentation/devicetree/bindings/mfd/atmel-smc.txt
> new file mode 100644
> index 0000000..0c0cc3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> @@ -0,0 +1,19 @@
> +* Device tree bindings for Atmel SMC (Static Memory Controller)
> +
> +The SMC registers are used to configure Atmel EBI (External Bus Inte=
rface)
> +to interface with standard memory devices (NAND, NOR, SRAM or specia=
lized
> +devices like FPGAs).
> +
> +Required properties:
> +- compatible:		should be one of the following
> +			"atmel,at91sam9260-smc", "syscon"
> +			"atmel,sama5d3-smc", "syscon"
> +- reg:			contains offset/length value of the SMC memory
> +			region.

I'd be happier if the sentences started with uppercase letters, but
nothing too offensive or controversial here:

Acked-by: Lee Jones <lee.jones@linaro.org>

> +Example:
> +
> +smc: smc@ffffc000 {
> +	compatible =3D "atmel,sama5d3-smc", "syscon";
> +	reg =3D <0xffffc000 0x1000>;
> +};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
