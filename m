From: Chen Yu <chenyu56@huawei.com>
Subject: Re: [PATCH v1 07/12] usb: roles: Find the usb role switch by also
 matching against the device node
Date: Mon, 21 Jan 2019 16:36:13 +0800
Message-ID: <e9a8f745-6211-d6d2-24f0-ac86f82924f0@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-8-chenyu56@huawei.com>
 <CAHp75VfUKAQ+Q0cQz-4-=i2JL9uACBX1bVvCeNjZLL1HStDGKQ@mail.gmail.com>
 <20181203122534.GD24338@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203122534.GD24338@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: liuyu712@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Heikki,

On 2018/12/3 20:25, Heikki Krogerus wrote:
> Hi,
> 
> On Mon, Dec 03, 2018 at 10:17:20AM +0200, Andy Shevchenko wrote:
>> On Mon, Dec 3, 2018 at 5:45 AM Yu Chen <chenyu56@huawei.com> wrote:
>>>
>>> This patch adds code for supporting find usb role switch by matching against
>>> the device node described using of_graph.
>>
>>>  #include <linux/module.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/slab.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_graph.h>
>>
>> Keep it ordered.
>>
>>> +static int __switch_match_by_of_node(struct device *dev, const void *name)
>>> +{
>>> +       if (!dev->parent || !dev->parent->of_node)
>>> +               return 0;
>>> +
>>> +       return of_node_name_eq(dev->parent->of_node, (const char *)name);
>>> +}
>>
>> I think Heikki has introduced some more generic function for this.
> 
> Yes, for this I'm proposing a new function fwnode_get_name() that
> should allow us to support ACPI as well as OF platforms:
> https://lkml.org/lkml/2018/11/28/784
> 
>>>         sw = device_connection_find_match(dev, "usb-role-switch", NULL,
>>>                                           usb_role_switch_match);
>>
>>> +       sw = of_graph_find_match_by_type(dev, "usb-role-switch");
>>
>> Why this is here?! device_connection_find_match() should take care for OF case.
> 
> Exactly. device_connection_find_match() needs to parse the graph (OF
> and ACPI), and I already made proposal (RFC) for that:
> https://lkml.org/lkml/2018/10/24/619
> 
> I have prepared a more finalized version of those patches. I've been
> waiting for that fwnode_get_name() to be accepted before sending it
> out since we are going to need that function, but I'll send a new RFC
> if nothing happens soon with that fwnode_get_name() series.
> 
> 
> Br,
> 

Have the fwnode_get_name() patches been accepted?
And I will be grateful if you can tell me your plan about the
https://lkml.org/lkml/2018/10/24/619 patches.

thanks
- Yu Chen
