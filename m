From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v9 2/6] clk: hisilicon: add CRG driver for hi3519 soc
Date: Fri, 26 Feb 2016 09:54:25 +0800
Message-ID: <56CFB051.3050809@huawei.com>
References: <1456127280-23275-1-git-send-email-xuejiancheng@huawei.com>
 <1456127280-23275-3-git-send-email-xuejiancheng@huawei.com>
 <20160225234215.GK28849@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160225234215.GK28849-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lidongpo-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,
    Thank you for your advice.  I'll fixed them in next version.

Regards,

Jiancheng.

On 2016/2/26 7:42, Stephen Boyd wrote:
> On 02/22, Jiancheng Xue wrote:
>> diff --git a/Documentation/devicetree/bindings/clock/hi3519-crg.txt b/Documentation/devicetree/bindings/clock/hi3519-crg.txt
>> new file mode 100644
>> index 0000000..2d23950
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/hi3519-crg.txt
>> @@ -0,0 +1,46 @@
>> +Example: CRG nodes
>> +CRG: clock-reset-controller@12010000 {
>> +	compatible = "hisilicon,hi3519-crg";
> 
> Indentation is off here.
> 
>> +        reg = <0x12010000 0x10000>;
>> +        #clock-cells = <1>;
>> +        #reset-cells = <2>;
>> +};
>> +
>> +Example: consumer nodes
>> +i2c0: i2c@12110000 {
>> +	compatible = "hisilicon,hi3519-i2c";
>> +        reg = <0x12110000 0x1000>;
>> +        clocks = <&CRG HI3519_I2C0_RST>;*/
>> +        resets = <&CRG 0xe4 0>;
>> +};
>> diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
>> index e434854..296371f 100644
>> --- a/drivers/clk/hisilicon/Kconfig
>> +++ b/drivers/clk/hisilicon/Kconfig
>> @@ -1,3 +1,11 @@
>> +config COMMON_CLK_HI3519
>> +	tristate "Hi3519 Clock Driver"
>> +	depends on ARCH_HISI || COMPILE_TEST
>> +	select RESET_HISI
>> +	default y
> 
> default ARCH_HISI
> 
>> +	help
>> +	  Build the clock driver for hi3519.
>> +
>> diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
>> new file mode 100644
>> index 0000000..50e00e7
>> --- /dev/null
>> +++ b/drivers/clk/hisilicon/reset.c
>> +
>> +int hisi_reset_init(struct device_node *np)
>> +{
>> +	struct hisi_reset_controller *rstc;
>> +
>> +	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
>> +	if (!rstc)
>> +		return -ENOMEM;
>> +
>> +	rstc->membase = of_iomap(np, 0);
> 
> Any reason why we can't pass the platform device here and map the
> register space with platform device APIs?
> 
>> +	if (!rstc->membase)
>> +		return -EINVAL;
>> +
>> +	spin_lock_init(&rstc->lock);
>> +
>> +	rstc->rcdev.owner = THIS_MODULE;
>> +	rstc->rcdev.ops = &hisi_reset_ops;
>> +	rstc->rcdev.of_node = np;
>> +	rstc->rcdev.of_reset_n_cells = 2;
>> +	rstc->rcdev.of_xlate = hisi_reset_of_xlate;
>> +
>> +	return reset_controller_register(&rstc->rcdev);
>> +}
>> +EXPORT_SYMBOL(hisi_reset_init);
> 
> Why not GPL?
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
