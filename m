From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: pinctrl-imx: add support for set bits for
 general purpose registers
Date: Fri, 06 Jul 2012 09:52:49 -0600
Message-ID: <4FF709D1.40903@wwwdotorg.org>
References: <1341565763-10074-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341565763-10074-1-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
Cc: b20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/2012 03:09 AM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> The General Purpose Registers (GPR) is used to select operating modes for
> general features in the SoC, usually not related to the IOMUX itself,
> but it does belong to IOMUX controller.
> We simply provide an convient API for driver to call to set the general purpose
> register bits if needed.

> +static struct imx_pinctrl *imx_pinctrl;
> +/*
> + * Set bits for general purpose registers
> + */
> +void imx_pinctrl_set_gpr_register(u8 gpr, u8 start_bit, u8 num_bits, u32 value)
> +{
> +	u32 reg;
> +
> +	/* general purpose register is 32 bits size */
> +	WARN_ON(!imx_pinctrl || start_bit > 31 || num_bits > 32);

Hmmm. It's going to be very hard to control the probe() order to ensure
that this WARN doesn't fire all the time.

I think it would be better to pass in a struct imx_pinctrl* or DT node
to this function. The DT node for the device that's using this function
should contain a phandle to the pinctrl device node, which it uses to
get that handle. Or in a non-DT case, the client driver needs to be
given the provider driver handle using some other mechanism.

For example, look at how the Tegra30 SMMU uses services from the Tegra30
AHB; see arch/arm/boot/dts/tegra30.dtsi node "smmu" (client) and node
"ahb" (provider), drivers/iommu/tegra-smmu.c functions probe() (saves
smmu->ahb) and smmu_setup_regs() (calls tegra_ahb_enable_smmu() with
this handle) and drivers/amba/tegra-ahb.c function
tegra_ahb_enable_smmu() (implements the deferred probe checking to
correctly order the client/provider driver probing)
