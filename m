From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] arm64: dts: marvell: add missing #interrupt-cells property
Date: Tue, 18 Jun 2019 10:17:07 +0200
Message-ID: <20190618081706.GD23549@piout.net>
References: <E1hcsxH-0007Vv-0l@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <E1hcsxH-0007Vv-0l@rmk-PC.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 17/06/2019 15:49:55+0100, Russell King wrote:
> The GPIO interrupt controllers are missing their required
> #interrupt-cells property, which prevents GPIO interrupts being
> specified in DT.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> index 4d6e4a097f72..f71afb1de18f 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
> @@ -238,6 +238,7 @@
>  					<85 IRQ_TYPE_LEVEL_HIGH>,
>  					<84 IRQ_TYPE_LEVEL_HIGH>,
>  					<83 IRQ_TYPE_LEVEL_HIGH>;
> +				#interrupt-cells = <2>;
>  				status = "disabled";
>  			};
>  
> @@ -253,6 +254,7 @@
>  					<81 IRQ_TYPE_LEVEL_HIGH>,
>  					<80 IRQ_TYPE_LEVEL_HIGH>,
>  					<79 IRQ_TYPE_LEVEL_HIGH>;
> +				#interrupt-cells = <2>;
>  				status = "disabled";
>  			};
>  		};
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
