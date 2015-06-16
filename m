From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add the efuse driver on rockchip platform
Date: Tue, 16 Jun 2015 11:54:40 +0100
Message-ID: <55800070.5030509@linaro.org>
References: <1434439665-27781-1-git-send-email-wxt@rock-chips.com> <557FE3EA.4000306@i2se.com> <557FEAB2.1040101@linaro.org> <557FF50C.10809@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557FF50C.10809-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 16/06/15 11:06, Caesar Wang wrote:
> Hi Srinivas,
>
> =E5=9C=A8 2015=E5=B9=B406=E6=9C=8816=E6=97=A5 17:21, Srinivas Kandaga=
tla =E5=86=99=E9=81=93:
>> Hi Stefan,
>>
>>
>> On 16/06/15 09:52, Stefan Wahren wrote:
>>> Hi Caesar,
>>>
>>> [add Maxime and Srinivas]
>>>
>>> Am 16.06.2015 um 09:27 schrieb Caesar Wang:
>>>> The original driver is uploaded by Jianqun.
>>>> Here is his patchs:
>>>>      https://patchwork.kernel.org/patch/5410341/
>>>>      https://patchwork.kernel.org/patch/5410351/
>>>>
>>>> Jianqun, nevermind!
>>>> I check-pick it and re-upload the driver for the upstream.
>>>> e.g.:
>>>>      Tested by on minnie board.(kernel-4.1-rc8)
>>>>      cd /sys/devices/platform/ffb40000.efuse
>>>>      localhost ffb40000.efuse # cat cpu_leakage_show
>>>>      cpu_version_show
>>>>      The results:
>>>>              19
>>>>              2
>>>>
>>>> Changes in v2:
>>>> - Change the document decription.
>>>> - Move the efuse driver into driver/soc/vendor.
>>>> - update the efuse driver.
>>>> - Add the dts node on RK3288.
>>>>
>>>>
>>>
>>> i want to mention that there is a upcoming new framework suitable f=
or
>>> efuse drivers:
>>>
>>> https://lkml.org/lkml/2015/5/21/643
>>>
>>> Unfortunately i don't know the current development state.
>>>
>>
>> Currently this framework is used by atleast 3 drivers(qcom-tsens,
>> qcom-cpr, begel-bone-cape manager) which are still floating in the
>> mailing list.
>>
>> I was hoping that these 3 users would getback with tested-by.. which
>> did not happen for last 3-4 weeks.
>>
>> I would appreciate, If you could try framework too, and let me know.
>
> Okay,
> I will do that...
>
> Doing.....
> 203d56b WIP: nvmem: add device tree helper functions
> 7d822d7 nvmem: sunxi: Move the SID driver to the nvmem framework
> f54130d nvmem: qfprom: Add bindings for qfprom
> 6e078d2 nvmem: qfprom: Add Qualcomm QFPROM support.
> 750d32b nvmem: Add simple nvmem-mmio consumer helper functions.
> 6390111 nvmem: Add bindings for simple nvmem framework
> 1c02217 nvmem: Add nvmem_device based consumer apis.
> 61ce74f nvmem: Add a simple NVMEM framework for consumers
> 0f82237 nvmem: Add a simple NVMEM framework for nvmem providers
> 7547598 regmap: Introduce regmap_get_reg_stride.
> f3bc1c0 regmap: Introduce regmap_get_max_register.
> f0b3b70 ARM: rockchip: fix the SMP code style
> 8a28ee6 ARM: rockchip: ensure CPU to enter WFI/WFE state
> 609deeb ARM: rockchip: fix the CPU soft reset
> 2a876e4 ARM: rockchip: restore dapswjdp after suspend
> e260818 Linux 4.1-rc4
> ab992dc watchdog: Fix merge 'conflict'
> ....
>
> At the moment, I don't know how to use this framework.
> I need some time to dig it, I'm happy if you some reference(driver or
> document).
These are very simple apis which are listed in nvmem-consumer.h=20
nvmem-provider.h. I will try to come up with some doc very soon.. thank=
s=20
for your patience.

I just had a look at the efuse driver and all you need is(I did not do=20
any compile testing) : Have a look at qfprom.c file, the drivers are=20
based on regmap, so you get lot of flexibility to add custom=20
reads/caches and lot of other regmap features.

dt:
/* Provider */
	efuse: efuse@ffb40000 {
		compatible =3D "rockchip,rk3066-efuse";
		reg =3D <0xffb40000 0x10000>;
		cpu_leakage: cpu_leakage {
			reg =3D <17 0x4>;
		};
		chip_version: chip_version {
			reg =3D <0x6 0x1>;
		};
	};

/* Consumer dt: */

	consumer-driver@0 {
		nvmem-cell =3D <&cpu_leakage>;
		nvmem-cell-names =3D "cpu-leakage";

	};

/ * consumer driver */
nvmem_cell_get()/nvmem_cell_put();
nvmem_cell_read()/nvmem_cell_write();
=09
/* Provider driver */ : drivers/nvmem/rockchip_efuse.c

#include <linux/module.h>
#include <linux/of.h>
#include "nvmem-mmio.h"

int rockchip_efuse_reg_read(void *context, unsigned int reg, unsigned=20
int *val)
{
	/* efuse specific read sequence */
	...
}

static struct regmap_config rockchip_efuse_regmap_config =3D {
	.reg_bits =3D 32,
	.val_bits =3D 8,
	.reg_stride =3D 1,
	.reg_read =3D rockchip_efuse_reg_read,
};

static struct nvmem_config econfig =3D {
	.name =3D "rockchip-efuse",
	.owner =3D THIS_MODULE,
};

static struct nvmem_mmio_data rockchip_efuse_data =3D {
	.nvmem_config =3D &econfig,
	.regmap_config =3D &rockchip_efuse_regmap_config,
};

static const struct of_device_id rockchip_efuse_of_match[] =3D {
	{ .compatible =3D "rockchip,rk3066-efuse", .data =3D &rockchip_efuse_d=
ata},
	{/* sentinel */},
};
MODULE_DEVICE_TABLE(of, rockchip_efuse_of_match);

static struct platform_driver rockchip_efuse_driver =3D {
	.probe =3D nvmem_mmio_probe,
	.remove =3D nvmem_mmio_remove,
	.driver =3D {
		.name =3D "rockchip_efuse",
		.of_match_table =3D rockchip_efuse_of_match,
	},
};
module_platform_driver(rockchip_efuse_driver);
MODULE_DESCRIPTION("rockchip_efuse driver");
MODULE_LICENSE("GPL v2");
>
>>
>> I added two of wrappers on top of v5 at:
>> https://git.linaro.org/people/srinivas.kandagatla/linux.git/shortlog=
/refs/heads/nvmem-dev-v5
>>
>>
>>
>> I think I should request Mark to take the framework.
>>
>>
>>
>> --srini
>>> Regards
>>> Stefan
>>>
>>>
>>
>>
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
