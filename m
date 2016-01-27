From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 1/6] clk: hisilicon: add CRG driver for hi3519 soc
Date: Wed, 27 Jan 2016 11:28:14 +0800
Message-ID: <56A8394E.2040207@huawei.com>
References: <1453690883-31220-1-git-send-email-xuejiancheng@huawei.com>
 <1453690883-31220-2-git-send-email-xuejiancheng@huawei.com>
 <1453771063.17181.56.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453771063.17181.56.camel-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lidongpo-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Paul Bolle=EF=BC=8C
   Thank you for your reply.

On 2016/1/26 9:17, Paul Bolle wrote:
> On ma, 2016-01-25 at 11:01 +0800, Jiancheng Xue wrote:
>> --- a/drivers/clk/hisilicon/Kconfig
>> +++ b/drivers/clk/hisilicon/Kconfig
>=20
>> +config COMMON_CLK_HI3519
>> +	bool "Hi3519 Clock Driver"
>> +	depends on ARCH_HISI
>> +	default y
>> +	help
>> +	  Build the clock driver for hi3519.
>=20
>> --- a/drivers/clk/hisilicon/Makefile
>> +++ b/drivers/clk/hisilicon/Makefile
>=20
>> +obj-$(CONFIG_COMMON_CLK_HI3519)	+=3D clk-hi3519.o
>=20
> If I parsed the above correctly clk-hi3519.o can only be built-in,
> right?
>=20
Yes. You are right.

But this clock driver should be able to be compiled as a module.
Even though it is preferred to be built-in.

I'll fix it in next version. Thank you.

Regards,

Jiancheng

>> --- /dev/null
>> +++ b/drivers/clk/hisilicon/clk-hi3519.c
>=20
>> +#include <linux/module.h>
>=20
> So is this include actually needed?
>=20
>> +static int hi3519_clk_probe(struct platform_device *pdev)
>> +{
>> +       struct device_node *np =3D pdev->dev.of_node;
>> +       struct hisi_clock_data *clk_data;
>> +
>> +       clk_data =3D hisi_clk_init(np, HI3519_NR_CLKS);
>> +       if (!clk_data)
>> +               return -ENODEV;
>> +
>> +       hisi_clk_register_fixed_rate(hi3519_fixed_rate_clks,
>> +                                  =20
>> ARRAY_SIZE(hi3519_fixed_rate_clks),
>> +                                    clk_data);
>> +       hisi_clk_register_mux(hi3519_mux_clks,
>> ARRAY_SIZE(hi3519_mux_clks),
>> +                                       clk_data);
>> +       hisi_clk_register_gate(hi3519_gate_clks,
>> +                       ARRAY_SIZE(hi3519_gate_clks), clk_data);
>> +
>> +       return hisi_reset_init(np);
>> +}
>=20
> (evolution 3.16.5 makes replying to code quite a challenge.)
>=20
>> +static const struct of_device_id hi3519_clk_match_table[] =3D {
>> +	{ .compatible =3D "hisilicon,hi3519-crg" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, hi3519_clk_match_table);
>=20
> Last time I checked MODULE_DEVICE_TABLE is preprocessed away for buil=
t
> -in code.
>=20
>> +static void __exit hi3519_clk_exit(void)
>> +{
>> +	platform_driver_unregister(&hi3519_clk_driver);
>> +}
>> +module_exit(hi3519_clk_exit);
>=20
> Not needed for built-in only code.
>=20
>> +MODULE_DESCRIPTION("HiSilicon Hi3519 Clock Driver");
>=20
> Ditto.
>=20
>> --- a/drivers/clk/hisilicon/clk.c
>> +++ b/drivers/clk/hisilicon/clk.c
>=20
>> +EXPORT_SYMBOL(hisi_clk_init);
>=20
> What module uses this export?
> =20
>> +EXPORT_SYMBOL(hisi_clk_register_fixed_rate);
>=20
> Ditto.
>=20
>> +EXPORT_SYMBOL(hisi_clk_register_fixed_factor);
>=20
> Ditto.
> =20
>> +EXPORT_SYMBOL(hisi_clk_register_mux);
>=20
> Ditto.
>=20
>> +EXPORT_SYMBOL(hisi_clk_register_divider);
>=20
> Ditto.
>=20
>> +EXPORT_SYMBOL(hisi_clk_register_gate);
>=20
> Ditto.
>=20
>> +EXPORT_SYMBOL(hisi_clk_register_gate_sep);
>=20
> Ditto.
>=20
>> --- /dev/null
>> +++ b/drivers/clk/hisilicon/reset.c
>=20
>> +int hisi_reset_init(struct device_node *np)
>> +{
>> +	[...]
>> +}
>> +EXPORT_SYMBOL(hisi_reset_init);
>=20
> Ditto.
>=20
>> --- /dev/null
>> +++ b/drivers/clk/hisilicon/reset.h
>=20
>> +#ifdef CONFIG_RESET_CONTROLLER
>> +int hisi_reset_init(struct device_node *np);
>> +#else
>> +static inline int hisi_reset_init(struct device_node *np)
>> +{
>> +	return 0;
>> +}
>> +#endif
>=20
> Thanks,
>=20
>=20
> Paul Bolle
>=20
> .
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
