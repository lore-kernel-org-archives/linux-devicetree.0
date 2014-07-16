From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/8] clk: Add clock driver for mb86s7x
Date: Wed, 16 Jul 2014 12:39:28 +0530
Message-ID: <CAJe_ZheP4G_yg0LDXgztpyHZSSjJ5sjYj1F8g7ZW-dkr1E5xeQ@mail.gmail.com>
References: <1405233052-4688-1-git-send-email-mollie.wu@linaro.org>
	<4408359.eoFHS4QiM2@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4408359.eoFHS4QiM2@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14 July 2014 19:38, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sunday 13 July 2014 14:30:52 Mollie Wu wrote:
>
>> ---
>>  .../bindings/clock/fujitsu,mb86s7x_clk.txt         |  32 ++
>>  drivers/clk/Makefile                               |   1 +
>>  drivers/clk/clk-mb86s7x.c                          | 352 +++++++++++++++++++++
>>  3 files changed, 385 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/fujitsu,mb86s7x_clk.txt
>>  create mode 100644 drivers/clk/clk-mb86s7x.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/fujitsu,mb86s7x_clk.txt b/Documentation/devicetree/bindings/clock/fujitsu,mb86s7x_clk.txt
>> new file mode 100644
>> index 0000000..4a17d79
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/fujitsu,mb86s7x_clk.txt
>> @@ -0,0 +1,32 @@
>> +Fujitsu CRG11 clock driver bindings
>> +-----------------------------------
>> +
>> +Required properties :
>> +- compatible : Shall contain "fujitsu,mb86s7x_clk"
>
> No wildcards in compatible strings please.
>
OK

>> +- #clock-cells : Shall be 0
>> +- cntrlr : 0->ALW, 1->DDR3, 2->MAIN, 3->CA15, 4->HDMI, 5->DPHY
>> +- domain : [0, 15]
>> +- port : [0,7] -> Gateable Clock Ports.  [8]->UngatedCLK
>
> It would be good to be a bit more verbose here.
>
That is how the clock controller is on this soc. The UngatedCLK is the
source of 8 gateable clock ports as well as having its own output
port. The PLLs and divisors are internally programmed by the remote
master.

>> +
>> +struct clk *mb86s7x_clclk_register(struct device *cpu_dev)
>> +{
>> +     struct clk_init_data init;
>> +     struct cl_clk *clc;
>> +
>> +     clc = kzalloc(sizeof(*clc), GFP_KERNEL);
>> +     if (!clc) {
>> +             pr_err("could not allocate cl_clk\n");
>> +             return ERR_PTR(-ENOMEM);
>> +     }
>> +
>> +     clc->hw.init = &init;
>> +     clc->cluster = topology_physical_package_id(cpu_dev->id);
>> +
>> +     init.name = dev_name(cpu_dev);
>> +     init.ops = &clk_clc_ops;
>> +     init.flags = CLK_IS_ROOT | CLK_GET_RATE_NOCACHE;
>> +     init.num_parents = 0;
>> +
>> +     return devm_clk_register(cpu_dev, &clc->hw);
>> +}
>> +
>> +static int mb86s7x_clclk_of_init(void)
>> +{
>> +     int cpu;
>> +     struct clk *clk;
>> +
>> +     for_each_possible_cpu(cpu) {
>> +             struct device *cpu_dev = get_cpu_device(cpu);
>> +
>> +             if (!cpu_dev) {
>> +                     pr_err("failed to get cpu%d device\n", cpu);
>> +                     continue;
>> +             }
>> +
>> +             clk = mb86s7x_clclk_register(cpu_dev);
>> +             if (IS_ERR(clk)) {
>> +                     pr_err("failed to register cpu%d clock\n", cpu);
>> +                     continue;
>> +             }
>> +             if (clk_register_clkdev(clk, NULL, dev_name(cpu_dev))) {
>> +                     pr_err("failed to register cpu%d clock lookup\n", cpu);
>> +                     continue;
>> +             }
>> +             pr_debug("registered clk for %s\n", dev_name(cpu_dev));
>> +     }
>> +
>> +     platform_device_register_simple("arm-bL-cpufreq-dt", -1, NULL, 0);
>> +
>> +     return 0;
>> +}
>> +module_init(mb86s7x_clclk_of_init);
>>
>
> This looks weird: why don't you probe the clocks from DT like normal?
>
We need to register clocks for each cpu populated, which is only after
all clock providers are probed by CLK_OF_DECLARE()

> Why do you register a platform device here? Are you trying to hide the fact that
> the cpufreq stuff still doesn't use proper DT probing?
>
Yup, the generic  bL cpufreq driver doesn't probe by DT.

thanks
-jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
