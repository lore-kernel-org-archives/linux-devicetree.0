From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: kernel: document ARM CPUs clocks and
 clock-frequency properties
Date: Fri, 21 Jun 2013 10:30:11 +0100
Message-ID: <20130621093011.GB14268@e102568-lin.cambridge.arm.com>
References: <1371739146-32639-1-git-send-email-f.fainelli@gmail.com>
 <1371739146-32639-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371739146-32639-4-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2013 at 03:39:06PM +0100, Florian Fainelli wrote:
> ARM CPU device tree nodes may contain a "clock-frequency" property,
> when set, this property must contain the CPU frequency in Hz,
> which is then used by the topology parsing code in
> arch/arm/kernel/topology.c to deduced the CPU capacity. The "clocks"
> property, if present shall be a phandle to a valid clock node.
> 
> Document thes properties to avoid any possible confusion on the
> clock-frequency unit and also specify that "device_type" is also
> used by the topology code.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index f32494d..1ce1ace 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -10,7 +10,7 @@ http://devicetree.org
>  
>  For the ARM architecture every CPU node must contain the following properties:
>  
> -- device_type:	must be "cpu"
> +- device_type:	must be "cpu". Use by the topology code.

No. These are DT bindings, they are not related to kernel code and must
be defined independently.

>  - reg:		property matching the CPU MPIDR[23:0] register bits
>  		reg[31:24] bits must be set to 0
>  - compatible:	should be one of:
> @@ -45,6 +45,11 @@ For the ARM architecture every CPU node must contain the following properties:
>  		"marvell,xsc3"
>  		"marvell,xscale"
>  
> +- clocks:	phandle and clock specifier for the CPU clock, used if
> +		"device_type" is present.

"device_type" must be present, no "if" there (see latest bindings that are on
their way to the kernel)

git://linux-arm.org/linux-2.6-lp.git dt-cpus-bindings

Then we can see if a "clocks" property is suitable here, and try to understand
what needs to happen when a platform has DVFS capabilities. I need to think
more about this.

> +- clock-frequency: the frequency of the CPU, in Hz. Mandatory if "device_type"
> +		   is also present, used as fallback is "clocks" is not present.
We should not define bindings to fix kernel code. Either "clock-frequency"
is required or it is not, it should not depend on "device_type" being
present and "device_type" is mandatory anyway. As I mentioned above, we
still have to check how to handle multiple frequencies, and how to do it.

I will give it more thought on my side.

Lorenzo
