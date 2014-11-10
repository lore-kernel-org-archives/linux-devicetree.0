From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 02/11] mfd: syscon: Add Atmel Matrix bus DT binding
 documentation
Date: Mon, 10 Nov 2014 09:55:59 +0000
Message-ID: <20141110095559.GI21424@x1>
References: <1415203287-21517-1-git-send-email-boris.brezillon@free-electrons.com>
 <1415203287-21517-3-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415203287-21517-3-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 05 Nov 2014, Boris Brezillon wrote:

> The Matrix registers are provided to configure internal bus behavior =
on
> at91 SoCs.
> Some registers might be access by several drivers (e.g. to configure
> external memory bus timings), hence we declare this register set as a
> syscon device.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  .../devicetree/bindings/mfd/atmel-matrix.txt       | 24 ++++++++++++=
++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-matri=
x.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt b=
/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> new file mode 100644
> index 0000000..405cac9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> @@ -0,0 +1,24 @@
> +* Device tree bindings for Atmel Bus Matrix
> +
> +The Bus Matrix registers are used to configure Atmel SoCs internal b=
us
> +behavior (master/slave priorities, undefined burst length type, ...)
> +
> +Required properties:
> +- compatible:		should be one of the following
> +			"atmel,at91sam9260-matrix", "syscon"
> +			"atmel,at91sam9261-matrix", "syscon"
> +			"atmel,at91sam9263-matrix", "syscon"
> +			"atmel,at91sam9263-matrix", "syscon"
> +			"atmel,at91sam9g45-matrix", "syscon"
> +			"atmel,at91sam9n12-matrix", "syscon"
> +			"atmel,at91sam9x5-matrix", "syscon"
> +			"atmel,sama5d3-matrix", "syscon"
> +- reg:			contains offset/length value of the Bus Matrix
> +			memory region.

Same comments as before:

Acked-by: Lee Jones <lee.jones@linaro.org>

> +Example:
> +
> +matrix: matrix@ffffec00 {
> +	compatible =3D "atmel,sama5d3-matrix", "syscon";
> +	reg =3D <0xffffec00 0x200>;
> +};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
