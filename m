From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 0/3] ARM: dts: SDRAM and L2 cache EDAC for Armada SoCs
Date: Tue, 08 Oct 2019 11:57:27 +0200
Message-ID: <87ftk3tv94.fsf@FE-laptop>
References: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

> This series was waiting for the armada_xp edac driver to be accepted.
> Now that it has the relevant nodes can be added to the Armada SoCs. So
> that boards can use the EDAC driver if they have the hardware support.
>
> The db-xc3-24g4xg.dts board doesn't have an ECC chip for it's DDR but it
> can use the L2 cache parity and ecc support.
>
> Chris Packham (3):
>   ARM: dts: armada-xp: enable L2 cache parity and ecc on db-xc3-24g4xg
>   ARM: dts: mvebu: add sdram controller node to Armada-38x
>   ARM: dts: armada-xp: add label to sdram-controller node

Series applied on mvebu/dt

Thanks,

Gregory


>
>  arch/arm/boot/dts/armada-38x.dtsi             | 5 +++++
>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi     | 2 +-
>  arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 5 +++++
>  arch/arm/boot/dts/armada-xp.dtsi              | 2 +-
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> -- 
> 2.23.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
