From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v6 12/14] arm64: dts: marvell: add AP806 SEI subnode
Date: Tue, 02 Oct 2018 16:39:23 +0200
Message-ID: <871s98o1k4.fsf@bootlin.com>
References: <20181001141358.31508-1-miquel.raynal@bootlin.com>
 <20181001141358.31508-13-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181001141358.31508-13-miquel.raynal@bootlin.com> (Miquel
 Raynal's message of "Mon, 1 Oct 2018 16:13:56 +0200")
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,
 
 On lun., oct. 01 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Add the System Error Interrupt node, representing an IRQ chip which is
> part of the GIC. The SEI node aggregates interrupts from the AP through
> wired interrupts, and from the CPs through MSIs.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> index 176e38d54872..92215342b453 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> @@ -124,6 +124,15 @@
>  				interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  
> +			sei: interrupt-controller@3f0200 {
> +				compatible = "marvell,ap806-sei";
> +				reg = <0x3f0200 0x40>;
> +				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +				msi-controller;
> +			};
> +
>  			xor@400000 {
>  				compatible = "marvell,armada-7k-xor", "marvell,xor-v2";
>  				reg = <0x400000 0x1000>,
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
