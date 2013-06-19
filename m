From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARM: kernel: document ARM CPUs clock-frequency property
Date: Wed, 19 Jun 2013 11:04:50 +0100
Message-ID: <20130619100450.GA27181@e106331-lin.cambridge.arm.com>
References: <1371635237-22860-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1371635237-22860-1-git-send-email-f.fainelli@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "nico@linaro.org" <nico@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2013 at 10:47:17AM +0100, Florian Fainelli wrote:
> ARM CPU device tree nodes may contain an optional clock-frequency
> property, when set, this property must contain the CPU frequency in Hz,
> which is then used by the topology parsing code in
> arch/arm/kernel/topology.c to infer the CPU capacity.

I see that arch/arm/kernel/topology.c does a pr_err when clock-frequency isn't
present. If we're documenting it as optional, should we not downgrade that or
remove it entirely?

Thanks,
Mark.

> 
> Document this property to avoid any possible confusion on the
> clock-frequency unit.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index f32494d..a33b956 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -45,6 +45,8 @@ For the ARM architecture every CPU node must contain the following properties:
>  		"marvell,xsc3"
>  		"marvell,xscale"
>  
> +- clock-frequency : The frequency of the CPU, in Hz. Optional.
> +
>  Example:
>  
>  	cpus {
> -- 
> 1.8.1.2
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
