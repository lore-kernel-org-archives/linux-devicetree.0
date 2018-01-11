From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/2] mfd: syscon: Add hardware spinlock support
Date: Thu, 11 Jan 2018 20:36:51 +0800
Message-ID: <CAMz4kuKZjnMZYm59PBa8anfW6pcbgBh-_FDA-3ZKurLXmO6wSA@mail.gmail.com>
References: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
 <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
 <20180102153620.hhrbov2g5torajim@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102153620.hhrbov2g5torajim@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 2 January 2018 at 23:36, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Arnd,
>
>> Some system control registers need hardware spinlock to synchronize
>> between the multiple subsystems, so we should add hardware spinlock
>> support for syscon.
>>
>> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> ... did you sign off on this in the end?
>

Could you apply this patch if there are no other issue? Thanks.

>> ---
>> Changes since v6:
>>  - Treat hwlock id 0 as valid for regmap.
>>
>> Changes since v5:
>>  - Fix the case that hwspinlock is not enabled.
>>
>> Changes since v4:
>>  - Add one exapmle to show how to add hwlock.
>>  - Fix the coding style issue.
>>
>> Changes since v3:
>>  - Add error handling for of_hwspin_lock_get_id()
>>
>> Changes since v2:
>>  - Add acked tag from Rob.
>>
>> Changes since v1:
>>  - Remove timeout configuration.
>>  - Modify the binding file to add hwlocks.
>> ---
>>  Documentation/devicetree/bindings/mfd/syscon.txt |    8 ++++++++
>>  drivers/mfd/syscon.c                             |   19 +++++++++++++++=
++++
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Document=
ation/devicetree/bindings/mfd/syscon.txt
>> index 8b92d45..25d9e9c 100644
>> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
>> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
>> @@ -16,9 +16,17 @@ Required properties:
>>  Optional property:
>>  - reg-io-width: the size (in bytes) of the IO accesses that should be
>>    performed on the device.
>> +- hwlocks: reference to a phandle of a hardware spinlock provider node.
>>
>>  Examples:
>>  gpr: iomuxc-gpr@20e0000 {
>>       compatible =3D "fsl,imx6q-iomuxc-gpr", "syscon";
>>       reg =3D <0x020e0000 0x38>;
>> +     hwlocks =3D <&hwlock1 1>;
>> +};
>> +
>> +hwlock1: hwspinlock@40500000 {
>> +     ...
>> +     reg =3D <0x40500000 0x1000>;
>> +     #hwlock-cells =3D <1>;
>>  };
>> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
>> index b93fe4c..7eaa40b 100644
>> --- a/drivers/mfd/syscon.c
>> +++ b/drivers/mfd/syscon.c
>> @@ -13,6 +13,7 @@
>>   */
>>
>>  #include <linux/err.h>
>> +#include <linux/hwspinlock.h>
>>  #include <linux/io.h>
>>  #include <linux/module.h>
>>  #include <linux/list.h>
>> @@ -87,6 +88,24 @@ static struct syscon *of_syscon_register(struct devic=
e_node *np)
>>       if (ret)
>>               reg_io_width =3D 4;
>>
>> +     ret =3D of_hwspin_lock_get_id(np, 0);
>> +     if (ret > 0 || (IS_ENABLED(CONFIG_HWSPINLOCK) && ret =3D=3D 0)) {
>> +             syscon_config.use_hwlock =3D true;
>> +             syscon_config.hwlock_id =3D ret;
>> +             syscon_config.hwlock_mode =3D HWLOCK_IRQSTATE;
>> +     } else if (ret < 0) {
>> +             switch (ret) {
>> +             case -ENOENT:
>> +                     /* Ignore missing hwlock, it's optional. */
>> +                     break;
>> +             default:
>> +                     pr_err("Failed to retrieve valid hwlock: %d\n", re=
t);
>> +                     /* fall-through */
>> +             case -EPROBE_DEFER:
>> +                     goto err_regmap;
>> +             }
>> +     }
>> +
>>       syscon_config.reg_stride =3D reg_io_width;
>>       syscon_config.val_bits =3D reg_io_width * 8;
>>       syscon_config.max_register =3D resource_size(&res) - reg_io_width;
>
> --
> Lee Jones
> Linaro Services Technical Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
