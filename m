From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 12/14] arm64: dts: marvell: add AP806 SEI subnode
Date: Mon, 16 Jul 2018 09:31:58 -0600
Message-ID: <20180716153158.GA8527@rob-hp-laptop>
References: <20180705124011.7661-1-miquel.raynal@bootlin.com>
 <20180705124011.7661-13-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180705124011.7661-13-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 05, 2018 at 02:40:09PM +0200, Miquel Raynal wrote:
> Add the System Error Interrupt node, representing an IRQ chip which is
> part of the GIC. The SEI node has two subnodes, one for each interrupt
> domain: wired (from the AP) and not-wired (MSIs from the CPs).

Where are the 2 sub-nodes?

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> index 176e38d54872..4f2a704615b0 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> @@ -124,6 +124,17 @@
>  				interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  
> +			sei: interrupt-controller@3f0200 {
> +				compatible = "marvell,armada-8k-sei";
> +				reg = <0x3f0200 0x40>;
> +				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +				marvell,sei-ap-ranges = <0 21>;
> +				marvell,sei-cp-ranges = <21 43>;
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +				msi-controller;
> +			};
> +
>  			xor@400000 {
>  				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
>  				reg = <0x400000 0x1000>,
> -- 
> 2.14.1
> 
