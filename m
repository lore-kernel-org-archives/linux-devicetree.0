From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: davinci: da850: add wdt OF_DEV_AUXDATA entry
Date: Tue, 5 Feb 2013 01:51:57 +0000
Message-ID: <F3DBB1B3EF102E4994C89758CFCA32412C40AE@DBDE01.ent.ti.com>
References: <1359016695-10362-1-git-send-email-anilkumar.v@ti.com>
 <1359016695-10362-3-git-send-email-anilkumar.v@ti.com>
 <510FA09F.7030604@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <510FA09F.7030604-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
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
To: "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: "davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org" <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org" <khilman-1D3HCaltpLuhEniVeURVKkEOCMrvLtNR@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 04, 2013 at 17:20:55, Nori, Sekhar wrote:
> Hi Anil,
> 
> On 1/24/2013 2:08 PM, Kumar, Anil wrote:
> > Add OF_DEV_AUXDATA for wdt driver in da850 board dt
> > file to use wdt clock.
> > 
> > Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>
> > ---
> > :100644 100644 37c27af... 1b295d2... M	arch/arm/mach-davinci/da8xx-dt.c
> >  arch/arm/mach-davinci/da8xx-dt.c |    8 +++++++-
> >  1 files changed, 7 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
> > index 37c27af..1b295d2 100644
> > --- a/arch/arm/mach-davinci/da8xx-dt.c
> > +++ b/arch/arm/mach-davinci/da8xx-dt.c
> > @@ -37,11 +37,17 @@ static void __init da8xx_init_irq(void)
> >  	of_irq_init(da8xx_irq_match);
> >  }
> >  
> > +struct of_dev_auxdata da850_evm_auxdata_lookup[] __initdata = {
> 
> Auxdata is not evm specific. This can instead be called da850_auxdata_lookup[].

ok

> 
> Also, I dont think it is necessary to add auxdata in a separate patch 
> from dt nodes. So, I fixed these issues and came up with below patch. I 
> tested basic wdt reboot. reboot command is still broken (with or 
> without this patch). Can you please look at that?
> 

ok, I will look into reboot command issue.

> Thanks,
> Sekhar
> 
> ----8<----
> From: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
> Date: Thu, 24 Jan 2013 14:08:14 +0530
> Subject: [PATCH 1/1] ARM: davinci: da850: add wdt DT node
> 
> Add da850 wdt DT node.
> 
> Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850-evm.dts  |    3 +++
>  arch/arm/boot/dts/da850.dtsi     |    5 +++++
>  arch/arm/mach-davinci/da8xx-dt.c |    8 +++++++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index fa04152..cc777dc 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -30,6 +30,9 @@
>  		rtc0: rtc@1c23000 {
>  			status = "okay";
>  		};
> +		wdt: wdt@1c21000 {
> +			status = "okay";
> +		};
>  	};
>  	nand_cs3@62000000 {
>  		status = "okay";
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 8dd15c0..2800090 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -88,6 +88,11 @@
>  				      19>;
>  			status = "disabled";
>  		};
> +		wdt: wdt@1c21000 {
> +			compatible = "ti,davinci-wdt";
> +			reg = <0x21000 0xfff>;
> +			status = "disabled";
> +		};
>  	};
>  	nand_cs3@62000000 {
>  		compatible = "ti,davinci-nand";
> diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
> index 37c27af..90c3c69 100644
> --- a/arch/arm/mach-davinci/da8xx-dt.c
> +++ b/arch/arm/mach-davinci/da8xx-dt.c
> @@ -37,11 +37,17 @@ static void __init da8xx_init_irq(void)
>  	of_irq_init(da8xx_irq_match);
>  }
>  
> +struct of_dev_auxdata da850_auxdata_lookup[] __initdata = {
> +	OF_DEV_AUXDATA("ti,davinci-wdt", 0x01c21000, "watchdog", NULL),
> +	{}
> +};
> +
>  #ifdef CONFIG_ARCH_DAVINCI_DA850
>  
>  static void __init da850_init_machine(void)
>  {
> -	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> +	of_platform_populate(NULL, of_default_bus_match_table,
> +			     da850_auxdata_lookup, NULL);
>  
>  	da8xx_uart_clk_enable();
>  }
> 
> 
