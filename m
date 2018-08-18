From: Manish Narani <MNARANI@xilinx.com>
Subject: RE: [PATCH v4 4/4] arm64: zynqmp: Add DDRC node
Date: Sat, 18 Aug 2018 10:12:18 +0000
Message-ID: <DM6PR02MB52276B9FB674BC816BC28A82C13C0@DM6PR02MB5227.namprd02.prod.outlook.com>
References: <1533374735-16662-1-git-send-email-manish.narani@xilinx.com>
 <1533374735-16662-5-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533374735-16662-5-git-send-email-manish.narani@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <MNARANI@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Michal Simek <michals@xilinx.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "mdf@kernel.org" <mdf@kernel.org>, Edgar Iglesias <edgari@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Bharat Kumar Gogada <bharatku@xilinx.com>, "stefan.krsmanovic@aggios.com" <stefan.krsmanovic@aggios.com>
Cc: Srinivas Goud <sgoud@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Ping.

> -----Original Message-----
> From: Manish Narani [mailto:manish.narani@xilinx.com]
> Sent: Saturday, August 4, 2018 2:56 PM
> To: robh+dt@kernel.org; mark.rutland@arm.com; catalin.marinas@arm.com;
> will.deacon@arm.com; Michal Simek <michals@xilinx.com>; bp@alien8.de;
> mchehab@kernel.org; mdf@kernel.org; Edgar Iglesias <edgari@xilinx.com>;
> Shubhrajyoti Datta <shubhraj@xilinx.com>; Naga Sureshkumar Relli
> <nagasure@xilinx.com>; Bharat Kumar Gogada <bharatku@xilinx.com>;
> stefan.krsmanovic@aggios.com
> Cc: Srinivas Goud <sgoud@xilinx.com>; Anirudha Sarangi
> <anirudh@xilinx.com>; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> edac@vger.kernel.org; Manish Narani <MNARANI@xilinx.com>
> Subject: [PATCH v4 4/4] arm64: zynqmp: Add DDRC node
>=20
> This patch adds ddrc memory controller node in dts. The size mentioned in=
 dts
> is 0x30000, because we need to access DDR_QOS INTR registers located at
> fd090208 from this driver.
>=20
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index a091e6f..7d6a3cf 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -355,6 +355,13 @@
>  			xlnx,bus-width =3D <64>;
>  		};
>=20
> +		mc: memory-controller@fd070000 {
> +			compatible =3D "xlnx,zynqmp-ddrc-2.40a";
> +			reg =3D <0x0 0xfd070000 0x0 0x30000>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <0 112 4>;
> +		};
> +
>  		gem0: ethernet@ff0b0000 {
>  			compatible =3D "cdns,zynqmp-gem", "cdns,gem";
>  			status =3D "disabled";
> --
> 2.1.1
