From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: marvell: armada-ap806: reserve PSCI area
Date: Thu, 10 Jan 2019 12:04:46 +0100
Message-ID: <874lagpycx.fsf@FE-laptop>
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


Applied on mvebu/fixes

I added a comment about the use with a mainline /U-Boot

Thanks,

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
