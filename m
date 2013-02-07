From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V2 1/2] ARM: davinci: da850: add wdt DT node
Date: Thu, 7 Feb 2013 23:36:59 +0530
Message-ID: <5113ED43.1060609@ti.com>
References: <1360123204-9978-1-git-send-email-anilkumar.v@ti.com>
	<1360123204-9978-2-git-send-email-anilkumar.v@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1360123204-9978-2-git-send-email-anilkumar.v-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: "Kumar, Anil" <anilkumar.v-l0cyMroinI0@public.gmane.org>
Cc: mporter-l0cyMroinI0@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, b-cousson-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/6/2013 9:30 AM, Kumar, Anil wrote:
> Add da850 wdt DT node.
> Add OF_DEV_AUXDATA for wdt driver to use wdt clock.
> 
> Signed-off-by: Kumar, Anil <anilkumar.v-l0cyMroinI0@public.gmane.org>

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
> +			da850_auxdata_lookup, NULL);

These hunks clashed with Manish's I2C0 node addition. I resolved it
locally. I pushed the commit to v3.9/dt-2 branch of my gitorious tree.
Please use this as the baseline for further DT patches.

Thanks,
Sekhar
