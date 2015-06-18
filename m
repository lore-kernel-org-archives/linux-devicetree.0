From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/3] Add the efuse driver on rockchip platform
Date: Thu, 18 Jun 2015 09:29:31 +0100
Message-ID: <5582816B.5020208@linaro.org>
References: <1434439665-27781-1-git-send-email-wxt@rock-chips.com> <557FE3EA.4000306@i2se.com> <557FEAB2.1040101@linaro.org> <557FF50C.10809@rock-chips.com> <55800070.5030509@linaro.org> <55826D9D.2060106@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55826D9D.2060106@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Caesar Wang <wxt@rock-chips.com>, heiko@sntech.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, matthias.bgg@gmail.com, jay.xu@rock-chips.com, linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org



On 18/06/15 08:05, Stefan Wahren wrote:
> Hi Srinivas,
>
> Am 16.06.2015 um 12:54 schrieb Srinivas Kandagatla:
>>
>>
>> On 16/06/15 11:06, Caesar Wang wrote:
>>> Hi Srinivas,
>>>
>>> =E5=9C=A8 2015=E5=B9=B406=E6=9C=8816=E6=97=A5 17:21, Srinivas Kanda=
gatla =E5=86=99=E9=81=93:
>>>> Hi Stefan,
>>>>
>>>>
>>>> On 16/06/15 09:52, Stefan Wahren wrote:
>>>>> Hi Caesar,
>>>>>
>>>>> [add Maxime and Srinivas]
>>>>>
>>>>> Am 16.06.2015 um 09:27 schrieb Caesar Wang:
>>>>>> The original driver is uploaded by Jianqun.
>>>>>> Here is his patchs:
>>>>>>       https://patchwork.kernel.org/patch/5410341/
>>>>>>       https://patchwork.kernel.org/patch/5410351/
>>>>>>
>>>>>> Jianqun, nevermind!
>>>>>> I check-pick it and re-upload the driver for the upstream.
>>>>>> e.g.:
>>>>>>       Tested by on minnie board.(kernel-4.1-rc8)
>>>>>>       cd /sys/devices/platform/ffb40000.efuse
>>>>>>       localhost ffb40000.efuse # cat cpu_leakage_show
>>>>>>       cpu_version_show
>>>>>>       The results:
>>>>>>               19
>>>>>>               2
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Change the document decription.
>>>>>> - Move the efuse driver into driver/soc/vendor.
>>>>>> - update the efuse driver.
>>>>>> - Add the dts node on RK3288.
>>>>>>
>>>>>>
>>>>>
>>>>> i want to mention that there is a upcoming new framework suitable=
 for
>>>>> efuse drivers:
>>>>>
>>>>> https://lkml.org/lkml/2015/5/21/643
>>>>>
>>>>> Unfortunately i don't know the current development state.
>>>>>
>>>>
>>>> Currently this framework is used by atleast 3 drivers(qcom-tsens,
>>>> qcom-cpr, begel-bone-cape manager) which are still floating in the
>>>> mailing list.
>>>>
>>>> I was hoping that these 3 users would getback with tested-by.. whi=
ch
>>>> did not happen for last 3-4 weeks.
>>>>
>>>> I would appreciate, If you could try framework too, and let me kno=
w.
>>>
>
> yes i work on OCOTP driver for MXS platform and i will try ...
>
>>
>> int rockchip_efuse_reg_read(void *context, unsigned int reg, unsigne=
d
>> int *val)
>> {
>>      /* efuse specific read sequence */
>>      ...
>> }
>
> I will need a specific read sequence too.

You can have a look at=20
https://git.linaro.org/people/srinivas.kandagatla/linux.git/blob/b4c3ad=
253747767511233687436f20144e850d67:/drivers/nvmem/rockchip-efuse.c

I did modify the rockchip driver, which I guess should be very much=20
similar to what OCOTP driver would need.


>
> Sorry for these newbie questions:
>
> What data structure does context points to for this reg_read opterati=
on?
>
> Do we need range checking of reg or is it handled by the framework?
>
We already have that in place.

> Are there any limitation for reg_read regarding sleeping or locking
> operations?
There are no limitaions as such from nvmem framework, regmap might have=
=20
limitations w.r.t to sleeping and fast_io, as fast_io would take=20
spinlocks, AFAIK the providers would not have fast_io, as they not IO=20
devices.
>
> In case of a read only driver, is everything handle by devicetree or =
do
> we need an empty write operation?
Yes, if you pass read-only flag in the provider, the framework would no=
t=20
attempt to even write.

You will find answers to most of your question in the rochip-efuse.c fi=
le.


--srini
>
> Best regards
> Stefan
>
