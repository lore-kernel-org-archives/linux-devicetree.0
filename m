From: "Lei Wang (BSP)" <Wang.Lei@microsoft.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: edac: arm-dmc520.txt
Date: Thu, 23 May 2019 17:51:49 +0000
Message-ID: <BYAPR21MB1319BC4D079B918AB038A4D590010@BYAPR21MB1319.namprd21.prod.outlook.com>
References: <CY1PR0401MB1244062C1738B09D6100F202860A0@CY1PR0401MB1244.namprd04.prod.outlook.com>
 <20190523165841.GD7523@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523165841.GD7523@lakrids.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Lei Wang <leiwang_git@outlook.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Rui Zhao <ruizhao@microsoft.com>, Hang Li <hangl@microsoft.com>, Sasha Levin <Alexander.Levin@microsoft.com>
List-Id: devicetree@vger.kernel.org

(+Rui/Hang/Sasha)

Hi Mark, please see inline with "[Lei]" tag. Thanks! -Lei

-----Original Message-----
From: Mark Rutland <mark.rutland@arm.com>=20
Sent: Thursday, May 23, 2019 9:59 AM
To: Lei Wang <leiwang_git@outlook.com>
Cc: bp@alien8.de; james.morse@arm.com; robh+dt@kernel.org; devicetree@vger.=
kernel.org; linux-kernel@vger.kernel.org; linux-edac@vger.kernel.org; Lei W=
ang (BSP) <Wang.Lei@microsoft.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: edac: arm-dmc520.txt

On Thu, May 16, 2019 at 02:35:47AM +0000, Lei Wang wrote:
> From: Lei Wang <leiwang_git@outlook.com>
>=20
> This is the device tree bindings for new EDAC driver dmc520_edac.c.
>=20
> Signed-off-by: Lei Wang <leiwang_git@outlook.com>
> ---
>  .../devicetree/bindings/edac/arm-dmc520.txt        | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/arm-dmc520.txt
>=20
> diff --git a/Documentation/devicetree/bindings/edac/arm-dmc520.txt b/Docu=
mentation/devicetree/bindings/edac/arm-dmc520.txt
> new file mode 100644
> index 0000000..71e7aa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
> @@ -0,0 +1,26 @@
> +* ARM DMC-520 EDAC node
> +
> +Required properties:
> +- compatible		: "brcm,dmc-520", "arm,dmc-520".
> +- reg			: Address range of the DMC-520 registers.
> +- interrupts		: DMC-520 interrupt numbers. The example below specifies
> +			  two interrupt lines for dram_ecc_errc_int and
> +			  dram_ecc_errd_int.
> +- interrupt-config	: This is an array of interrupt masks. For each of th=
e
> +			  above interrupt line, add one interrupt mask element to
> +			  it. That is, there is a 1:1 mapping from each interrupt
> +			  line to an interrupt mask. An interrupt mask can represent
> +			  multiple interrupts being enabled. Refer to interrupt_control
> +			  register in DMC-520 TRM for interrupt mapping. In the example
> +			  below, the interrupt configuration enables dram_ecc_errc_int
> +			  and dram_ecc_errd_int. And each interrupt is connected to
> +			  a separate interrupt line.

Generally we use interrupt-names to distinguish interrupts.

Do you really have arbitary subsets of lines muxed together?

-----------------------------------------------
[Lei] Yes it is possible to mux multiple interrupt sources into one interru=
pt line for dmc520. For example, in this particular brcm implementation,=20

Line 841: source dram_ecc_errc_int
Line 843: source dram_ecc_errd_int
Line 839: source dram_ecc_errc_int and dram_ecc_errd_int

There are two possibilities for implementing ecc counts for ce/ue. And we c=
hose to use the single source line. But it's possible to implement using th=
e combined-source line too. This dt binding can support both by modifying t=
he properties.
-------------------------------------------------

Thanks,
Mark.

> +
> +Example:
> +
> +dmc0: dmc@200000 {
> +	compatible =3D "brcm,dmc-520", "arm,dmc-520";
> +	reg =3D <0x200000 0x80000>;
> +	interrupts =3D <0x0 0x349 0x4>, <0x0 0x34B 0x4>;
> +	interrupt-config =3D <0x4>, <0x8>;
> +};
> --=20
> 2.7.4
>=20
