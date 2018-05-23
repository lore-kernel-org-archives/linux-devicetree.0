From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 02/16] arm64: dts: marvell: fix CP110 ICU node size
Date: Wed, 23 May 2018 09:36:11 +0200
Message-ID: <87wovuygb8.fsf@bootlin.com>
References: <20180522094042.24770-1-miquel.raynal@bootlin.com>
        <20180522094042.24770-3-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180522094042.24770-3-miquel.raynal@bootlin.com> (Miquel
        Raynal's message of "Tue, 22 May 2018 11:40:28 +0200")
Sender: stable-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Haim Boot <hayim@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On mar., mai 22 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> ICU size in CP110 is not 0x10 but at least 0x440 bytes long (from the
> specification).
>
> Fixes: 6ef84a827c37 ("arm64: dts: marvell: enable GICP and ICU on Armada 7K/8K")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied on mvebu/fixes

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> index 48cad7919efa..9fa41c54f69c 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> @@ -146,7 +146,7 @@
>  
>  		CP110_LABEL(icu): interrupt-controller@1e0000 {
>  			compatible = "marvell,cp110-icu";
> -			reg = <0x1e0000 0x10>;
> +			reg = <0x1e0000 0x440>;
>  			#interrupt-cells = <3>;
>  			interrupt-controller;
>  			msi-parent = <&gicp>;
> -- 
> 2.14.1
>

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
