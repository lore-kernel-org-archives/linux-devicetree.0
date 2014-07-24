From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 06/11] ARM: dts: zynq: Add DMAC for Parallella
Date: Thu, 24 Jul 2014 16:28:16 -0700
Message-ID: <bc390439-9a5b-43a1-a70c-a4c6517a6cb6@BN1AFFO11FD005.protection.gbl>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
 <1406242820-20140-7-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406242820-20140-7-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-25 at 01:00AM +0200, Andreas F=C3=A4rber wrote:
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v2: New
> =20
>  arch/arm/boot/dts/zynq-7000.dtsi      | 17 +++++++++++++++++
>  arch/arm/boot/dts/zynq-parallella.dts |  4 ++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index eed3df0..1a70277 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -223,6 +223,23 @@
>  			};
>  		};
> =20
> +		dmac_s: dmac@f8003000 {
> +			compatible =3D "arm,pl330", "arm,primecell";
> +			reg =3D <0xf8003000 0x1000>;
> +			status =3D "disabled";
I think for this IP we can omit the 'status' property since it is alway=
s
enabled. I don't see a reason to override it in each board DT.

> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <0 13 4>,
> +			             <0 14 4>, <0 15 4>,
> +			             <0 16 4>, <0 17 4>,
> +			             <0 40 4>, <0 41 4>,
> +			             <0 42 4>, <0 43 4>;
> +			#dma-cells =3D <1>;
> +			#dma-channels =3D <8>;
> +			#dma-requests =3D <4>;
> +			clocks =3D <&clkc 27>;
> +			clock-names =3D "apb_pclk";
> +		};
> +

Acked-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

	S=C3=B6ren
