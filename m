From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH AUTOSEL 5.1 08/39] arm64: dts: ls1028a: Fix CPU idle fail.
Date: Thu, 11 Jul 2019 05:04:24 +0000
Message-ID: <DB8PR04MB6826A4A8CE604F2570DC1EA7F1F30@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190703021514.17727-1-sashal@kernel.org>
 <20190703021514.17727-8-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190703021514.17727-8-sashal@kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xiaobo Xie <xiaobo.xie@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Sasha,=20

    Thanks for helping port this patch to stable.
    May I know if I can submit other bug fixes which has been accepted by u=
pstream to stable by myself?
    If yes, where I can find related process for reference?

Thanks & Regards,
Ran

> -----Original Message-----
> From: Sasha Levin <sashal@kernel.org>
> Sent: Wednesday, July 03, 2019 10:15
> To: linux-kernel@vger.kernel.org; stable@vger.kernel.org
> Cc: Ran Wang <ran.wang_1@nxp.com>; Shawn Guo <shawnguo@kernel.org>;
> Sasha Levin <sashal@kernel.org>; devicetree@vger.kernel.org
> Subject: [PATCH AUTOSEL 5.1 08/39] arm64: dts: ls1028a: Fix CPU idle fail=
.
>=20
> From: Ran Wang <ran.wang_1@nxp.com>
>=20
> [ Upstream commit 53f2ac9d3aa881ed419054076042898b77c27ee4 ]
>=20
> PSCI spec define 1st parameter's bit 16 of function CPU_SUSPEND to indica=
te
> CPU State Type: 0 for standby, 1 for power down. In this case, we want to=
 select
> standby for CPU idle feature. But current setting wrongly select power do=
wn and
> cause CPU SUSPEND fail every time. Need this fix.
>=20
> Fixes: 8897f3255c9c ("arm64: dts: Add support for NXP LS1028A SoC")
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 2896bbcfa3bb..228872549f01 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -28,7 +28,7 @@
>  			enable-method =3D "psci";
>  			clocks =3D <&clockgen 1 0>;
>  			next-level-cache =3D <&l2>;
> -			cpu-idle-states =3D <&CPU_PH20>;
> +			cpu-idle-states =3D <&CPU_PW20>;
>  		};
>=20
>  		cpu1: cpu@1 {
> @@ -38,7 +38,7 @@
>  			enable-method =3D "psci";
>  			clocks =3D <&clockgen 1 0>;
>  			next-level-cache =3D <&l2>;
> -			cpu-idle-states =3D <&CPU_PH20>;
> +			cpu-idle-states =3D <&CPU_PW20>;
>  		};
>=20
>  		l2: l2-cache {
> @@ -53,13 +53,13 @@
>  		 */
>  		entry-method =3D "arm,psci";
>=20
> -		CPU_PH20: cpu-ph20 {
> -			compatible =3D "arm,idle-state";
> -			idle-state-name =3D "PH20";
> -			arm,psci-suspend-param =3D <0x00010000>;
> -			entry-latency-us =3D <1000>;
> -			exit-latency-us =3D <1000>;
> -			min-residency-us =3D <3000>;
> +		CPU_PW20: cpu-pw20 {
> +			  compatible =3D "arm,idle-state";
> +			  idle-state-name =3D "PW20";
> +			  arm,psci-suspend-param =3D <0x0>;
> +			  entry-latency-us =3D <2000>;
> +			  exit-latency-us =3D <2000>;
> +			  min-residency-us =3D <6000>;
>  		};
>  	};
>=20
> --
> 2.20.1
