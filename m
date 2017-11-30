From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] mfd: syscon: Add hardware spinlock support
Date: Thu, 30 Nov 2017 16:50:18 +0800
Message-ID: <CAMz4kuLMq0U-A_tG3o=NSRYtgcG_46ga60Pe3qh=W5S5_vghUA@mail.gmail.com>
References: <2344ec4123c8b0985e54e03a0fa1bfe8d5e68235.1512009343.git.baolin.wang@linaro.org>
 <20171130083552.ynti3n3njzvps555@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171130083552.ynti3n3njzvps555@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30 November 2017 at 16:35, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, 30 Nov 2017, Baolin Wang wrote:
>
>> Some system control registers need hardware spinlock to synchronize
>> between the multiple subsystems, so we should add hardware spinlock
>> support for syscon.
>>
>> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
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
>>  Documentation/devicetree/bindings/mfd/syscon.txt |    1 +
>>  drivers/mfd/syscon.c                             |   21 +++++++++++++++++++++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
>> index 8b92d45..f464cc8 100644
>> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
>> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
>> @@ -16,6 +16,7 @@ Required properties:
>>  Optional property:
>>  - reg-io-width: the size (in bytes) of the IO accesses that should be
>>    performed on the device.
>> +- hwlocks: reference to a phandle of a hardware spinlock provider node.
>
> Example?
>
> Perhaps even include the hwlock node (I'm not sure what that would
> look like).

Sure, I will add one example node here.

>
>>  Examples:
>>  gpr: iomuxc-gpr@20e0000 {
>> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
>> index b93fe4c..caf6a25 100644
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
>> @@ -87,6 +88,26 @@ static struct syscon *of_syscon_register(struct device_node *np)
>>       if (ret)
>>               reg_io_width = 4;
>>
>> +     ret = of_hwspin_lock_get_id(np, 0);
>> +     if (ret > 0) {
>> +             syscon_config.hwlock_id = ret;
>> +             syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
>> +     } else {
>> +             switch (ret) {
>> +             case -ENOENT:
>> +                     /* ignore missing hwlock, it's optional */
>
> Is your shift key broken? ;)
>
> Please use proper grammar.  Sentences start with capital letters.

OK. Thanks for your comments.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
