From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: marvell: armada-ap806: reserve PSCI area
Date: Wed, 26 Dec 2018 17:16:37 +0100
Message-ID: <87h8f09sbe.fsf@bootlin.com>
References: <20181221164503.5128-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221164503.5128-1-xypron.glpk@gmx.de> (Heinrich Schuchardt's
        message of "Fri, 21 Dec 2018 17:45:03 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Heinrich,
 
 On ven., déc. 21 2018, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:

> The memory area [0x4000000-0x4200000[ is occupied by the PSCI firmware. Any
> attempt to access it from Linux leads to an immediate crash.
>
> So let's make the same memory reservation as the vendor kernel.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

We got a similar patch one month ago and Russell King pointed that it
didn't match waht he saw on his MACCHIATObin:
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-November/612360.html

on mine under U-Boot I got:

Marvell>> md 0x4000000
04000000: 00000000 00000007 00000005 00000040    ............@...
04000010: 00000001 00001000 00000007 00000001    ................
04000020: 00000008 00000000 00000009 00000000    ................
04000030: 0000000a 00000000 ffffffff ffffffff    ................
04000040: ffffffff ffffffff ffffffff ffffffff    ................
04000050: ffffffff ffffffff ffffffff ffffffff    ................
04000060: ffffffff ffffffff ffffffff ffffffff    ................
04000070: ffffffff ffffffff ffffffff ffffffff    ................
04000080: ffffffff ffffffff ffffffff ffffffff    ................
04000090: ffffffff ffffffff ffffffff ffffffff    ................
040000a0: ffffffff ffffffff ffffffff ffffffff    ................
040000b0: ffffffff ffffffff ffffffff ffffffff    ................
040000c0: ffffffff ffffffff ffffffff ffffffff    ................
040000d0: ffffffff ffffffff ffffffff ffffffff    ................
040000e0: ffffffff ffffffff ffffffff ffffffff    ................
040000f0: ffffffff ffffffff ffffffff ffffffff    ................

In my case I have an old ATF, however this kind of setting should be
done by the bootloader.

I am interested by your claim about causing an immediate crash when
accessing this region. How did you trigger it?

Gregory


> ---
> v2
> 	Move the change from armada-8040-mcbin.dts to armada-ap806.dtsi.
> 	I only have a MACCHIATObin for testing but
> 	https://github.com/MarvellEmbeddedProcessors/linux-marvell
> 	has the reservation in that file.
> ---
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> index 7d94c1fa592a..f8dafef83db0 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> @@ -28,6 +28,17 @@
>  		method = "smc";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		psci-area@4000000 {
> +			reg = <0x0 0x4000000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	ap806 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -- 
> 2.19.2
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
