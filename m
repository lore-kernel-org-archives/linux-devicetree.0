From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/7] mfd: add syscon driver based on regmap
Date: Tue, 28 Aug 2012 15:54:00 -0700
Message-ID: <503D4C08.8040605@wwwdotorg.org>
References: <1346145005-17961-1-git-send-email-b29396@freescale.com>
 <1346145005-17961-2-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1346145005-17961-2-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/28/2012 02:09 AM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Add regmap based syscon driver.
> This is usually used for access misc bits in registers which does not belong
> to a specific module, for example, IMX IOMUXC GPR and ANATOP.
> With this driver, client can use generic regmap API to access registers
> which are registered into syscon.

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt

> +* System Controller Registers R/W driver

I think the binding document could use some information about what a
"syscon" actually is, especially since the compatible value is something
generic like "syscon" rather than something with a vendor-specific
prefix. How about:

A system controller node represents a register region containing a set
of miscellaneous registers. The registers are not cohesive enough to
represent as any specific type of device. The typical use-case is for
some other node's driver, or platform-specific code, to acquire a
reference to the syscon node (e.g. by phandle, node path, or search
using a specific compatible value), interrogate the node (or associated
OS driver) to determine the location of the registers, and access the
registers directly.

> +Required properties:
> +- compatible: Should contain "syscon".
> +- reg: the register range can be access from syscon
> +
> +Examples:
> +gpr: iomuxc-gpr@020e0000 {
> +	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
> +	reg = <0x020e0000 0x38>;
> +};

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig

> +config MFD_SYSCON
> +        bool "System Controller Register R/W Based on Regmap"
> +        select REGMAP_MMIO
> +        help
> +          Select this option to enable accessing system control registers
> +	  via regmap.

I think the indentation is off there.

> +static int __devinit syscon_probe(struct platform_device *pdev)
...
> +	regcache_cache_only(syscon->regmap, false);

Isn't that the default?

Aside from that, I don't have any particular comments on this series, so
please consider it,

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
