From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH v2 12/13] ARM: mach-vt8500: cpus/cpu nodes dts updates
Date: Tue, 23 Apr 2013 10:26:38 +0100
Message-ID: <20130423092637.GC22946@e102568-lin.cambridge.arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366644455-16550-13-git-send-email-lorenzo.pieralisi@arm.com>
 <5175F564.8030405@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5175F564.8030405@prisktech.co.nz>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tony Prisk <linux@prisktech.co.nz>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, rob.
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2013 at 03:43:48AM +0100, Tony Prisk wrote:
> On 23/04/13 03:27, Lorenzo Pieralisi wrote:
> > This patch updates the in-kernel dts files according to the latest cpus
> > and cpu bindings updates for ARM.
> >
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > ---
> >   arch/arm/boot/dts/wm8505.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/wm8505.dtsi b/arch/arm/boot/dts/wm8505.dtsi
> > index e74a1c0..a470808 100644
> > --- a/arch/arm/boot/dts/wm8505.dtsi
> > +++ b/arch/arm/boot/dts/wm8505.dtsi
> > @@ -13,7 +13,7 @@
> >   
> >   	cpus {
> >   		cpu@0 {
> > -			compatible = "arm,arm926ejs";
> > +			compatible = "arm,arm926";
> >   		};
> >   	};
> >   
> The more I look at this, the more wrong it is :/
> 
>  From the new binding documentation,
> 
> +	A cpus node must define the following properties:
> +
> +	- #address-cells
> +		Usage: required
> +		Value type: <u32>
> +		Definition: must be set to 1 for 32-bit systems and 2 for
> +			    64-bit systems
> +	- #size-cells
> +		Usage: required
> +		Value type: <u32>
> +		Definition: must be set to 0
> 
> ...
> 
> +- cpu node
> +
> +	Description: Describes a CPU in an ARM based system
> +
> +	PROPERTIES
> +
> +	- device_type
> +		Usage: required
> +		Value type: <string>
> +		Definition: must be "cpu"
> 

This property is required since DT was invented, again, I should not be
in charge of adding it.

> Three required properties that aren't present in the patch.
> 
> cpus {
>      #size-cells = <0>;
>      #address-cells = <1>;
> 
>      cpu {
>          device_type = "cpu"
>          compatible = "arm,arm926";
>      };
> };

I am of two minds about this. That processor does not have an MPIDR
equivalent so in theory #address-cells and #size-cells could be omitted
because the reg property is meaningless. I do not know to be honest the
best way to handle this.

Thoughts ?

Thanks for the review,
Lorenzo
