From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 1/3] ARM: dts: enable L2 cache parity and ecc on db-xc3-24g4xg board
Date: Wed, 10 Jan 2018 09:24:04 +0100
Message-ID: <87y3l66s0r.fsf@free-electrons.com>
References: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
        <20180108223158.21930-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180108223158.21930-2-chris.packham@alliedtelesis.co.nz> (Chris
        Packham's message of "Tue, 9 Jan 2018 11:31:56 +1300")
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: jlu@pengutronix.de, linux@armlinux.org.uk, bp@alien8.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

 On mar., janv. 09 2018, Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

Could you have add a (even small) message in the commit log?

Also could you improve the title by specify that it applies on
armada-xp, like this:

ARM: dts: armada-xp: enable L2 cache parity and ecc on db-xc3-24g4xg


> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
> index 06fce35d7491..00ca489fc788 100644
> --- a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
> +++ b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
> @@ -70,6 +70,11 @@
>  	};
>  };
>  
> +&L2 {
> +	arm,parity-enable;
> +	marvell,ecc-enable;

It is not a problem for me to already applied the device tree change
even if the driver is not merged yet. But I would like to have an
acked-by on this new property by either a device tree maintainer or at
least the EDAC maintainer, of course having both acked-by would be
perfect ! :)

Thanks,

Gregory




> +};
> +
>  &devbus_bootcs {
>  	status = "okay";
>  
> -- 
> 2.15.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
