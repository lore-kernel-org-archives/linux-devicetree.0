From: Shunqian Zheng <shunqian.zheng@gmail.com>
Subject: Re: [PATCH v2 0/3] Add the efuse driver on rockchip platform
Date: Fri, 31 Jul 2015 17:27:46 +0800
Message-ID: <55BB3F92.9030701@gmail.com>
References: <1434439665-27781-1-git-send-email-wxt@rock-chips.com> <557FE3EA.4000306@i2se.com> <557FEAB2.1040101@linaro.org> <557FF50C.10809@rock-chips.com> <55800070.5030509@linaro.org> <55826D9D.2060106@i2se.com> <5582816B.5020208@linaro.org>
Reply-To: shunqian.zheng@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5582816B.5020208@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, heiko@sntech.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, matthias.bgg@gmail.com, Maxime Ripard <maxime.ripard@free-electrons.com>, jay.xu@rock-chips.com, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Dear Srinivas,

On 2015=E5=B9=B406=E6=9C=8818=E6=97=A5 16:29, Srinivas Kandagatla wrote=
:
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
>>>>>>> https://patchwork.kernel.org/patch/5410341/
>>>>>>> https://patchwork.kernel.org/patch/5410351/
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
I'm testing the rockchip-efuse.c driver based on nvmem framework v8, it=
=20
works on RK3288-soc except:

1. Without the following diff, `hexdump=20
/sys/bus/nvmem/devices/rockchip-efuse0/nvmem` is wrong with "INVALID=20
ARGUMENT":

+++ b/drivers/nvmem/core.c
@@ -67,7 +67,7 @@ static ssize_t bin_attr_nvmem_read(struct file *filp,=
=20
struct kobject *kobj,
         int rc;

         /* Stop the user from reading */
-       if (pos > nvmem->size)
+       if (pos > nvmem->size - 1)
                 return 0;

         if (pos + count > nvmem->size)

RK3288-efuse has  32 x 8bit regs, in dts "reg =3D <0xffb40000 0x20>;"
Here is the message dump from nvmem_device:
[    2.158314] nvmem:
[    2.158314]           name (null)
[    2.158314]           stride 1
[    2.158314]           word_size 1
[    2.158314]           ncells 0
[    2.158314]           id 0
[    2.158314]           users 0
[    2.158314]           size 32
[    2.158314]           read_only 0

Do you think there is a leak or I'm messing up ?

2. About the read operation, eFuse data can be read during device=20
probe() and cached, OR,
     read from eFuse when needed every time. I prefer the second one bu=
t=20
then, the clock of eFuse may be
     gated. So before/after reading I have to enable/disable clk like :
           devm_clk_get(dev, "hclk_efuse256");
     The trouble is I can't find a way to get the "dev" hander in :
           static int rockchip_efuse_read(void *context, const void=20
*reg, size_t reg_size, void *val, size_t val_size)
     I am appreciated if you can give some advice.
     Or, do you think it's reasonable to add hooks before/after read in=
=20
nvmem/core.c like :
           +       before_read(dev, ...);
                    rc =3D regmap_raw_read(nvmem->regmap, pos, buf, cou=
nt);
           +       after_read(dev, ...);

3. In the /sys/bus/nvmem/devices/rockchip-efuse0/, there are files:
          /sys/devices/platform/ffb40000.efuse/rockchip-efuse0 # ls
          nvmem      of_node    power      subsystem  uevent
     Do you have a plan to add the nvmem consumers to /sys/ in nvmem=20
framework?
     For example,  in dts defined the "cpu_leakage":
         efuse: efuse@ffb40000 {
                 compatible =3D "rockchip,rk3x-efuse";
                 reg =3D <0xffb40000 0x20>;
                 #address-cells =3D <1>;
                 #size-cells =3D <1>;
                 clocks =3D <&cru PCLK_EFUSE256>;
                 clock-names =3D "pclk_efuse_256";

                 cpu_leakage: cpu_leakage {
                         reg =3D <0x17 0x1>;
                 };
         };
    Then nvmem exposes the "cpu_leakage" file in /sys which can be=20
read/write.

Thank you very much,
Shunqian Zheng
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
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
