From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 2/4] ARM: dt: mvebu: ix4-300d: move partitions to partition sub-node
Date: Mon, 30 Nov 2015 15:17:12 +0100
Message-ID: <87lh9f607r.fsf@free-electrons.com>
References: <1448709248-21177-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1448709248-21177-3-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448709248-21177-3-git-send-email-sebastian.hesselbarth@gmail.com>
	(Sebastian Hesselbarth's message of "Sat, 28 Nov 2015 12:14:06 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Benoit Masson <yahoo@perenite.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,
 
 On sam., nov. 28 2015, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:

> NAND flash partitions should be part of a partitions sub-node
> not the flash node itself. Move the partitions which will also
> allow different bootloaders get rid of the stock partitions
> easily by removing the partitions node.
>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory

> ---
> Cc: Jason Cooper <jason@lakedaemon.net> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@free-electrons.com> 
> Cc: Rob Herring <robh+dt@kernel.org> 
> Cc: Pawel Moll <pawel.moll@arm.com> 
> Cc: Mark Rutland <mark.rutland@arm.com> 
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk> 
> Cc: Kumar Gala <galak@codeaurora.org> 
> Cc: Russell King <linux@arm.linux.org.uk> 
> Cc: Benoit Masson <yahoo@perenite.com>
> Cc: linux-arm-kernel@lists.infradead.org 
> Cc: devicetree@vger.kernel.org 
> Cc: linux-kernel@vger.kernel.org 
> ---
>  arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 67 +++++++++++++------------
>  1 file changed, 36 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> index 30a0a6eac645..76781fd18624 100644
> --- a/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> +++ b/arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
> @@ -151,37 +151,42 @@
>  				marvell,nand-enable-arbiter;
>  				nand-on-flash-bbt;
>  
> -				partition@0 {
> -					label = "u-boot";
> -					reg = <0x0000000 0xe0000>;
> -					read-only;
> -				};
> -
> -				partition@e0000 {
> -					label = "u-boot-env";
> -					reg = <0xe0000 0x20000>;
> -					read-only;
> -				};
> -
> -				partition@100000 {
> -					label = "u-boot-env2";
> -					reg = <0x100000 0x20000>;
> -					read-only;
> -				};
> -
> -				partition@120000 {
> -					label = "zImage";
> -					reg = <0x120000 0x400000>;
> -				};
> -
> -				partition@520000 {
> -					label = "initrd";
> -					reg = <0x520000 0x400000>;
> -				};
> -
> -				partition@xE00000 {
> -					label = "boot";
> -					reg = <0xE00000 0x3F200000>;
> +				partitions {
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					partition@0 {
> +						label = "u-boot";
> +						reg = <0x0000000 0xe0000>;
> +						read-only;
> +					};
> +
> +					partition@e0000 {
> +						label = "u-boot-env";
> +						reg = <0xe0000 0x20000>;
> +						read-only;
> +					};
> +
> +					partition@100000 {
> +						label = "u-boot-env2";
> +						reg = <0x100000 0x20000>;
> +						read-only;
> +					};
> +
> +					partition@120000 {
> +						label = "zImage";
> +						reg = <0x120000 0x400000>;
> +					};
> +
> +					partition@520000 {
> +						label = "initrd";
> +						reg = <0x520000 0x400000>;
> +					};
> +
> +					partition@xE00000 {
> +						label = "boot";
> +						reg = <0xE00000 0x3F200000>;
> +					};
>  				};
>  			};
>  		};
> -- 
> 2.1.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
