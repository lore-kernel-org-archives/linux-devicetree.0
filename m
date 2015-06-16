From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [PATCH v2 0/3] Add the efuse driver on rockchip platform
Date: Tue, 16 Jun 2015 18:06:04 +0800
Message-ID: <557FF50C.10809@rock-chips.com>
References: <1434439665-27781-1-git-send-email-wxt@rock-chips.com> <557FE3EA.4000306@i2se.com> <557FEAB2.1040101@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <557FEAB2.1040101@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: heiko@sntech.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, matthias.bgg@gmail.com, jay.xu@rock-chips.com, linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

=E5=9C=A8 2015=E5=B9=B406=E6=9C=8816=E6=97=A5 17:21, Srinivas Kandagatl=
a =E5=86=99=E9=81=93:
> Hi Stefan,
>
>
> On 16/06/15 09:52, Stefan Wahren wrote:
>> Hi Caesar,
>>
>> [add Maxime and Srinivas]
>>
>> Am 16.06.2015 um 09:27 schrieb Caesar Wang:
>>> The original driver is uploaded by Jianqun.
>>> Here is his patchs:
>>>      https://patchwork.kernel.org/patch/5410341/
>>>      https://patchwork.kernel.org/patch/5410351/
>>>
>>> Jianqun, nevermind!
>>> I check-pick it and re-upload the driver for the upstream.
>>> e.g.:
>>>      Tested by on minnie board.(kernel-4.1-rc8)
>>>      cd /sys/devices/platform/ffb40000.efuse
>>>      localhost ffb40000.efuse # cat cpu_leakage_show
>>>      cpu_version_show
>>>      The results:
>>>              19
>>>              2
>>>
>>> Changes in v2:
>>> - Change the document decription.
>>> - Move the efuse driver into driver/soc/vendor.
>>> - update the efuse driver.
>>> - Add the dts node on RK3288.
>>>
>>>
>>
>> i want to mention that there is a upcoming new framework suitable fo=
r
>> efuse drivers:
>>
>> https://lkml.org/lkml/2015/5/21/643
>>
>> Unfortunately i don't know the current development state.
>>
>
> Currently this framework is used by atleast 3 drivers(qcom-tsens,=20
> qcom-cpr, begel-bone-cape manager) which are still floating in the=20
> mailing list.
>
> I was hoping that these 3 users would getback with tested-by.. which=20
> did not happen for last 3-4 weeks.
>
> I would appreciate, If you could try framework too, and let me know.

Okay,
I will do that...

Doing.....
203d56b WIP: nvmem: add device tree helper functions
7d822d7 nvmem: sunxi: Move the SID driver to the nvmem framework
f54130d nvmem: qfprom: Add bindings for qfprom
6e078d2 nvmem: qfprom: Add Qualcomm QFPROM support.
750d32b nvmem: Add simple nvmem-mmio consumer helper functions.
6390111 nvmem: Add bindings for simple nvmem framework
1c02217 nvmem: Add nvmem_device based consumer apis.
61ce74f nvmem: Add a simple NVMEM framework for consumers
0f82237 nvmem: Add a simple NVMEM framework for nvmem providers
7547598 regmap: Introduce regmap_get_reg_stride.
f3bc1c0 regmap: Introduce regmap_get_max_register.
f0b3b70 ARM: rockchip: fix the SMP code style
8a28ee6 ARM: rockchip: ensure CPU to enter WFI/WFE state
609deeb ARM: rockchip: fix the CPU soft reset
2a876e4 ARM: rockchip: restore dapswjdp after suspend
e260818 Linux 4.1-rc4
ab992dc watchdog: Fix merge 'conflict'
=2E...

At the moment, I don't know how to use this framework.
I need some time to dig it, I'm happy if you some reference(driver or=20
document).

>
> I added two of wrappers on top of v5 at:=20
> https://git.linaro.org/people/srinivas.kandagatla/linux.git/shortlog/=
refs/heads/nvmem-dev-v5
>
>
> I think I should request Mark to take the framework.
>
>
>
> --srini
>> Regards
>> Stefan
>>
>>
>
>
>

--=20
Thanks,
- Caesar
