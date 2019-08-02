From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] drivers/amba: add reset control to primecell probe
Date: Fri, 2 Aug 2019 09:42:24 -0500
Message-ID: <92009928-3df1-1573-7d67-40e79d77c77e@kernel.org>
References: <20190801184346.7015-1-dinguyen@kernel.org>
 <CAL_Jsq+PRKGwdozr3VECpk2ugrOuWd4CYnRSR7ChyPOKgheYkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+PRKGwdozr3VECpk2ugrOuWd4CYnRSR7ChyPOKgheYkw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Dinh Nguyen <dinh.nguyen@intel.com>
List-Id: devicetree@vger.kernel.org



On 8/2/19 9:37 AM, Rob Herring wrote:
> On Thu, Aug 1, 2019 at 12:44 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>>
>> From: Dinh Nguyen <dinh.nguyen@intel.com>
>>
>> The primecell controller on some SoCs, i.e. SoCFPGA, is held in reset by
>> default. Until recently, the DMA controller was brought out of reset by the
>> bootloader(i.e. U-Boot). But a recent change in U-Boot, the peripherals that
>> are not used are held in reset and are left to Linux to bring them out of
>> reset.
> 
> You can fix this in the kernel, but any versions before this change
> will remain broken. IMO, the u-boot change should be reverted because
> it is breaking an ABI (though not a good one).
> 

Right, there exists in U-Boot to support legacy platforms before this
recent change. This would be for future versions.

>> Add a mechanism for getting the reset property and de-assert the primecell
>> module from reset if found. This is a not a hard fail if the reset property
>> is not present in the device tree node, so the driver will continue to probe.
> 
> I think this belongs in the AMBA bus code, not the DT code, as that is
> where we already have clock control code for similar reasons.
> 

Ok.

>>
>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>> ---
>>  drivers/of/platform.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 7801e25e6895..d8945705313d 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -21,6 +21,7 @@
>>  #include <linux/of_irq.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>
>>  const struct of_device_id of_default_bus_match_table[] = {
>>         { .compatible = "simple-bus", },
>> @@ -229,6 +230,7 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>>         struct amba_device *dev;
>>         const void *prop;
>>         int i, ret;
>> +       struct reset_control *rstc;
>>
>>         pr_debug("Creating amba device %pOF\n", node);
>>
>> @@ -270,6 +272,18 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>>                 goto err_free;
>>         }
>>
>> +       /*
>> +        * reset control of the primecell block is optional
>> +        * and will not fail if the reset property is not found.
>> +        */
>> +       rstc = of_reset_control_get_exclusive(node, "dma");
> 
> 'dma' doesn't sound very generic.
>

how about 'primecell' ?

Thanks for the review!

Dinh
