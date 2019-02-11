From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: marvell: mcbin: Adding SPI-NOR Flash
 Config
Date: Mon, 11 Feb 2019 17:27:37 +0000
Message-ID: <3040714f-471c-6773-57dd-455e7d1f195c@arm.com>
References: <20190211171401.434-1-alex@asyring.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211171401.434-1-alex@asyring.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Syring <alex@asyring.de>, Russell King <linux@armlinux.org.uk>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/02/2019 17:14, Alexander Syring wrote:
> According to U-Boot dts file enabling the SPI-NOR flash for use in
> Linux
> 
> Signed-off-by: Alexander Syring <alex@asyring.de>
> ---
>  .../boot/dts/marvell/armada-8040-mcbin.dtsi   | 23 +++++++++++++++----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index 329f8ceeebea..83994ff46e2d 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -333,11 +333,24 @@
>  	status = "okay";
>  
>  	spi-flash@0 {
> -		compatible = "st,w25q32";
> -		spi-max-frequency = <50000000>;
> -		reg = <0>;
> -	};
> -};
> +		compatible = "st,w25q32", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <50000000>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +
> +			partition@0 {
> +				label = "U-Boot";
> +				reg = <0 0x200000>;
> +			};
> +			partition@400000 {
> +				label = "U-Boot Env";
> +				reg = <0x200000 0xce0000>;
> +			};
> +		};
> +	};
> +};
>  
>  &cp1_usb3_0 {
>  	/* CPS Lane 2 - CON7 */
> 

Really?

My mcbin SPI flash doesn't have this partitioning, and doesn't have
u-boot at all. This should be provided by the bootloader itself, and not
baked into the reference DT.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
