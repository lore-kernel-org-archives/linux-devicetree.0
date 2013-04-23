From: Simon Horman <horms@verge.net.au>
Subject: Re: [RFC PATCH v2 09/13] ARM: mach-shmobile: cpus/cpu nodes dts
 updates
Date: Tue, 23 Apr 2013 10:55:11 +0900
Message-ID: <20130423015511.GK12017@verge.net.au>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366644455-16550-10-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1366644455-16550-10-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Viresh Kumar <viresh.kumar@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Barry
List-Id: devicetree@vger.kernel.org

On Mon, Apr 22, 2013 at 04:27:31PM +0100, Lorenzo Pieralisi wrote:
> This patch updates the in-kernel dts files according to the latest cpus
> and cpu bindings updates for ARM.

Sorry to be a pain, but I would appreciate two separate patches,
one per-Soc.

> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> ---
>  arch/arm/boot/dts/r8a7740.dtsi | 3 +++
>  arch/arm/boot/dts/sh7372.dtsi  | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> index 798fa35..b47bb36 100644
> --- a/arch/arm/boot/dts/r8a7740.dtsi
> +++ b/arch/arm/boot/dts/r8a7740.dtsi
> @@ -14,8 +14,11 @@
>  	compatible = "renesas,r8a7740";
>  
>  	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		cpu@0 {
>  			compatible = "arm,cortex-a9";
> +			reg = <0x0>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/sh7372.dtsi b/arch/arm/boot/dts/sh7372.dtsi
> index 677fc60..78478af 100644
> --- a/arch/arm/boot/dts/sh7372.dtsi
> +++ b/arch/arm/boot/dts/sh7372.dtsi
> @@ -14,8 +14,12 @@
>  	compatible = "renesas,sh7372";
>  
>  	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		cpu@0 {
>  			compatible = "arm,cortex-a8";
> +			reg = <0x0>;
>  		};
>  	};
>  };
> -- 
> 1.7.12
> 
> 
