From: Vabhav Sharma <vabhav.sharma@nxp.com>
Subject: RE: [PATCH v1 1/4] dt-bindings: arm64: add compatible for LX2160A
Date: Wed, 3 Apr 2019 08:27:38 +0000
Message-ID: <VI1PR04MB480070B517B9D9961C9E8187F3570@VI1PR04MB4800.eurprd04.prod.outlook.com>
References: <1551132245-6089-1-git-send-email-vabhav.sharma@nxp.com>
 <1551132245-6089-2-git-send-email-vabhav.sharma@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551132245-6089-2-git-send-email-vabhav.sharma@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: Leo Li <leoyang.li@nxp.com>, Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>, Andy Tang <andy.tang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Maintainers,
Please merge below patch.

Regards,
Vabhav

> -----Original Message-----
> From: Vabhav Sharma <vabhav.sharma@nxp.com>
> Sent: Tuesday, February 26, 2019 3:41 PM
> To: sudeep.holla@arm.com; oss@buserror.net; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; robh+dt@kernel.org; mark.rutland@arm.com;
> linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> mturquette@baylibre.com; sboyd@kernel.org; rjw@rjwysocki.net;
> viresh.kumar@linaro.org; linux-clk@vger.kernel.org; linux-
> pm@vger.kernel.org; linux-kernel-owner@vger.kernel.org;
> catalin.marinas@arm.com; will.deacon@arm.com;
> gregkh@linuxfoundation.org; arnd@arndb.de;
> kstewart@linuxfoundation.org; yamada.masahiro@socionext.com; Leo Li
> <leoyang.li@nxp.com>; shawnguo@kernel.org
> Cc: linux@armlinux.org.uk; adrian.hunter@intel.com;
> ulf.hansson@linaro.org; Vabhav Sharma <vabhav.sharma@nxp.com>
> Subject: [PATCH v1 1/4] dt-bindings: arm64: add compatible for LX2160A
>=20
> Add compatible for LX2160A SoC,QDS and RDB board Add lx2160a
> compatible for clockgen and dcfg
>=20
> Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/freescale/fsl,layerscape-dcfg.txt           |  2 +-
>  Documentation/devicetree/bindings/arm/fsl.txt                | 12 ++++++=
++++++
>  Documentation/devicetree/bindings/clock/qoriq-clock.txt      |  1 +
>  3 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,layersca=
pe-
> dcfg.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,layerscape=
-
> dcfg.txt
> index b5cb374..dc76046 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-
> dcfg.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-dcf
> +++ g.txt
> @@ -8,7 +8,7 @@ Required properties:
>    - compatible: Should contain a chip-specific compatible string,
>  	Chip-specific strings are of the form "fsl,<chip>-dcfg",
>  	The following <chip>s are known to be supported:
> -	ls1012a, ls1021a, ls1043a, ls1046a, ls2080a.
> +	ls1012a, ls1021a, ls1043a, ls1046a, ls2080a, lx2160a.
>=20
>    - reg : should contain base address and length of DCFG memory-mapped
> registers
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt
> b/Documentation/devicetree/bindings/arm/fsl.txt
> index 7fbc424..baef162 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -235,3 +235,15 @@ Required root node properties:
>  LS2088A ARMv8 based RDB Board
>  Required root node properties:
>      - compatible =3D "fsl,ls2088a-rdb", "fsl,ls2088a";
> +
> +LX2160A SoC
> +Required root node properties:
> +    - compatible =3D "fsl,lx2160a";
> +
> +LX2160A ARMv8 based QDS Board
> +Required root node properties:
> +    - compatible =3D "fsl,lx2160a-qds", "fsl,lx2160a";
> +
> +LX2160A ARMv8 based RDB Board
> +Required root node properties:
> +    - compatible =3D "fsl,lx2160a-rdb", "fsl,lx2160a";
> diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> index c655f28..f322989 100644
> --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> @@ -43,6 +43,7 @@ Required properties:
>  	* "fsl,ls1046a-clockgen"
>  	* "fsl,ls1088a-clockgen"
>  	* "fsl,ls2080a-clockgen"
> +	* "fsl,lx2160a-clockgen"
>  	Chassis-version clock strings include:
>  	* "fsl,qoriq-clockgen-1.0": for chassis 1.0 clocks
>  	* "fsl,qoriq-clockgen-2.0": for chassis 2.0 clocks
> --
> 2.7.4
