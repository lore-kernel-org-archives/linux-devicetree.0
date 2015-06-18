From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 0/3] Add the efuse driver on rockchip platform
Date: Thu, 18 Jun 2015 17:08:13 +0800
Message-ID: <55828A7D.1080202@rock-chips.com>
References: <1434439665-27781-1-git-send-email-wxt@rock-chips.com> <557FE3EA.4000306@i2se.com> <557FEAB2.1040101@linaro.org> <557FF50C.10809@rock-chips.com> <55800070.5030509@linaro.org> <55826D9D.2060106@i2se.com> <5582816B.5020208@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5582816B.5020208-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2015=E5=B9=B406=E6=9C=8818=E6=97=A5 16:29, Srinivas Kandagatl=
a =E5=86=99=E9=81=93:
>
>
> On 18/06/15 08:05, Stefan Wahren wrote:
>> Hi Srinivas,
>>
>> Am 16.06.2015 um 12:54 schrieb Srinivas Kandagatla:
>>>
>>>
>>> On 16/06/15 11:06, Caesar Wang wrote:
>>>> Hi Srinivas,
>>>>
>>>> =E5=9C=A8 2015=E5=B9=B406=E6=9C=8816=E6=97=A5 17:21, Srinivas Kand=
agatla =E5=86=99=E9=81=93:
>>>>> Hi Stefan,
>>>>>
>>>>>
>>>>> On 16/06/15 09:52, Stefan Wahren wrote:
>>>>>> Hi Caesar,
>>>>>>
>>>>>> [add Maxime and Srinivas]
>>>>>>
>>>>>> Am 16.06.2015 um 09:27 schrieb Caesar Wang:
>>>>>>> The original driver is uploaded by Jianqun.
>>>>>>> Here is his patchs:
>>>>>>>       https://patchwork.kernel.org/patch/5410341/
>>>>>>>       https://patchwork.kernel.org/patch/5410351/
>>>>>>>
>>>>>>> Jianqun, nevermind!
>>>>>>> I check-pick it and re-upload the driver for the upstream.
>>>>>>> e.g.:
>>>>>>>       Tested by on minnie board.(kernel-4.1-rc8)
>>>>>>>       cd /sys/devices/platform/ffb40000.efuse
>>>>>>>       localhost ffb40000.efuse # cat cpu_leakage_show
>>>>>>>       cpu_version_show
>>>>>>>       The results:
>>>>>>>               19
>>>>>>>               2
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - Change the document decription.
>>>>>>> - Move the efuse driver into driver/soc/vendor.
>>>>>>> - update the efuse driver.
>>>>>>> - Add the dts node on RK3288.
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> i want to mention that there is a upcoming new framework suitabl=
e=20
>>>>>> for
>>>>>> efuse drivers:
>>>>>>
>>>>>> https://lkml.org/lkml/2015/5/21/643
>>>>>>
>>>>>> Unfortunately i don't know the current development state.
>>>>>>
>>>>>
>>>>> Currently this framework is used by atleast 3 drivers(qcom-tsens,
>>>>> qcom-cpr, begel-bone-cape manager) which are still floating in th=
e
>>>>> mailing list.
>>>>>
>>>>> I was hoping that these 3 users would getback with tested-by.. wh=
ich
>>>>> did not happen for last 3-4 weeks.
>>>>>
>>>>> I would appreciate, If you could try framework too, and let me kn=
ow.
>>>>
>>
>> yes i work on OCOTP driver for MXS platform and i will try ...
>>
>>>
>>> int rockchip_efuse_reg_read(void *context, unsigned int reg, unsign=
ed
>>> int *val)
>>> {
>>>      /* efuse specific read sequence */
>>>      ...
>>> }
>>
>> I will need a specific read sequence too.
>
> You can have a look at=20
> https://git.linaro.org/people/srinivas.kandagatla/linux.git/blob/b4c3=
ad253747767511233687436f20144e850d67:/drivers/nvmem/rockchip-efuse.c
>
> I did modify the rockchip driver, which I guess should be very much=20
> similar to what OCOTP driver would need.

That rockchip-efuse.c driver shouldn't be work.

An entire 8-bit word of data can be read in one read operation with=20
STROBE being high and a proper address
selected (address signals A5~A7 are =E2=80=9Cdon=E2=80=99t cares=E2=80=9D=
).

That's great if we can get the content from the .reg_read when the=20
consumer driver
callback the nvmem_cell_read().

e.g.:
static struct regmap_config rockchip_efuse_regmap_config =3D {
     .reg_bits =3D 32,
     .val_bits =3D 8,
     .reg_stride =3D 1,
     .reg_read =3D rockchip_efuse_reg_read,
};
=2E..
/ * consumer driver */
nvmem_cell_get()/nvmem_cell_put();
nvmem_cell_read()/nvmem_cell_write();
=2E.......


>
>
>>
>> Sorry for these newbie questions:
>>
>> What data structure does context points to for this reg_read opterat=
ion?
>>
>> Do we need range checking of reg or is it handled by the framework?
>>
> We already have that in place.
>
>> Are there any limitation for reg_read regarding sleeping or locking
>> operations?
> There are no limitaions as such from nvmem framework, regmap might=20
> have limitations w.r.t to sleeping and fast_io, as fast_io would take=
=20
> spinlocks, AFAIK the providers would not have fast_io, as they not IO=
=20
> devices.
>>
>> In case of a read only driver, is everything handle by devicetree or=
 do
>> we need an empty write operation?
> Yes, if you pass read-only flag in the provider, the framework would=20
> not attempt to even write.
>
> You will find answers to most of your question in the rochip-efuse.c=20
> file.
>
>
> --srini
>>
>> Best regards
>> Stefan
>>
>
>
>

--=20
Thanks,
- Caesar


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
