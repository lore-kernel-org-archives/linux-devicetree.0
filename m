From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] of_irq.h: fix build warnings when CONFIG_OF is not enabled
Date: Tue, 03 Sep 2013 16:18:27 -0700
Message-ID: <52266E43.70102@infradead.org>
References: <5224B499.4010600@infradead.org> <CAL_Jsq+82vm_vt5EpcG1zvWmL_H4KY=91tB1WH5yUhHsiM11DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+82vm_vt5EpcG1zvWmL_H4KY=91tB1WH5yUhHsiM11DA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/03/13 15:31, Rob Herring wrote:
> On Mon, Sep 2, 2013 at 10:54 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Fix build warnings when CONFIG_OF is not enabled:
> 
> It would be nice to know what arch/config you see this on.

i386 and x86_64.

> 
>> include/linux/of_irq.h:82:7: warning: 'struct device_node' declared inside parameter list [enabled by default]
>> include/linux/of_irq.h:82:7: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
>> include/linux/of_irq.h:87:47: warning: 'struct device_node' declared inside parameter list [enabled by default]
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc:     Grant Likely <grant.likely@linaro.org>
>> Cc:     Rob Herring <rob.herring@calxeda.com>
>> Cc:     devicetree@vger.kernel.org
>> ---
>>  include/linux/of_irq.h |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- linux-next-20130830.orig/include/linux/of_irq.h
>> +++ linux-next-20130830/include/linux/of_irq.h
>> @@ -78,6 +78,8 @@ extern void of_irq_init(const struct of_
>>  #endif /* CONFIG_OF_IRQ */
>>
>>  #else /* !CONFIG_OF */
>> +struct device_node;
> 
> Can you move this outside of the ifdefs to minimize the amount of ifdef'ed code.

I'm build testing that change now, but it seems odd to have it there in 2 ways
when CONFIG_OF is enabled:


struct device_node;

#if defined(CONFIG_OF)

#include <linux/of.h>



will resend the patch shortly.

-- 
~Randy
