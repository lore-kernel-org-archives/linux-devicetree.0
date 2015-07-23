From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] devicetree: xilinx: add rtc node to zynqmp dtsi
Date: Thu, 23 Jul 2015 06:58:42 -0700
Message-ID: <20150723135842.GG2531@xsjsorenbubuntu>
References: <1437648740-7587-1-git-send-email-suneel.garapati@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437648740-7587-1-git-send-email-suneel.garapati@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suneel Garapati <suneel.garapati@xilinx.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@vger.kernel.org, michals@xilinx.com, sorenb@xilinx.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hi Suneel,

On Thu, 2015-07-23 at 04:22PM +0530, Suneel Garapati wrote:
> adds rtc controller node to zynqmp devicetree.
>=20
> Signed-off-by: Suneel Garapati <suneel.garapati@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 4 ++++
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 9 +++++++++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64=
/boot/dts/xilinx/zynqmp-ep108.dts
> index 0a3f40e..b48ce47 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
> @@ -45,3 +45,7 @@
>  &uart0 {
> 	status =3D "okay";
>  };
> +
> +&rtc {
> +	status =3D "okay";
> +};
> \ No newline at end of file
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot=
/dts/xilinx/zynqmp.dtsi
> index 11e0b00..b76ede1 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -220,6 +220,15 @@
> 			#size-cells =3D <0>;
> 		};
>=20
> +		rtc: rtc@ffa60000 {
> +			compatible =3D "xlnx,zynqmp-rtc";
> +			status =3D "disabled";

do we need the status disabled here?

> +			reg =3D <0x0 0xffa60000 0x100>;
> +			interrupt-parent =3D <&gic>;
> +			interrupts =3D <0 26 4>, <0 27 4>;
> +			interrupt-names =3D "alm", "sec";

Descriptive names would be nice. What is 'alm' supposed to mean?

	Thanks,
	S=C3=B6ren
