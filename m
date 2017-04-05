From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] of/pci: Fix memory leak in of_pci_get_host_bridge_resources
Date: Wed, 5 Apr 2017 08:21:45 -0500
Message-ID: <CAL_JsqJ3D0cvyAmCDxd-MDRaxB5h72Jca-JnRqVNQEdCHEV=gg@mail.gmail.com>
References: <1490256755-889-1-git-send-email-jeffy.chen@rock-chips.com>
 <1490256755-889-3-git-send-email-jeffy.chen@rock-chips.com>
 <CAL_Jsq+xxG6w6J+Zz-kcJ+rA9jJomyHFiazHzcPHuQizn-4-wg@mail.gmail.com>
 <CAE_wzQ9ZVDiDGP4k_2i2KL4JxtRn_S7gjFXUTYZncMLx2m77gQ@mail.gmail.com>
 <CAErSpo6CZ1hoHyzEnWBi7VDr51bLurF4-4t=-v4jH27kOpzYrg@mail.gmail.com> <58E454CF.7050501@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <58E454CF.7050501@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jeffy <jeffy.chen@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Dmitry Torokhov <dtor@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, toshi.kani@hpe.com, Shawn Lin <shawn.lin@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Doug Anderson <dianders@chromium.org>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 4, 2017 at 9:22 PM, jeffy <jeffy.chen@rock-chips.com> wrote:
> Hi Bjorn,
>
>
> On 04/05/2017 03:18 AM, Bjorn Helgaas wrote:
>>
>> On Thu, Mar 23, 2017 at 5:58 PM, Dmitry Torokhov <dtor@chromium.org>
>> wrote:
>>>
>>> On Thu, Mar 23, 2017 at 3:07 PM, Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Thu, Mar 23, 2017 at 3:12 AM, Jeffy Chen <jeffy.chen@rock-chips.com>
>>>> wrote:
>>>>>
>>>>> Currently we only free the allocated resource struct when error.
>>>>> This would cause memory leak after pci_free_resource_list.

>>>>> -       pci_add_resource(resources, bus_range);
>>>>> +       *window->res = res;
>>>>
>>>>
>>>> Well, now this seems racy. You add a blank resource to the list first
>>>> and then fill it in.
>>>>
>>>
>>> Huh? There is absolutely no guarantees for concurrent access here.
>>> pcI_add_resource_offset() first adds a resource and then modifies
>>> offset. Here we add an empty resource and then fill it in.
>>
>>
>> I don't really like this pattern either.  Even if there's no actual
>> racy behavior, it takes more analysis than necessary to figure that
>> out.
>>
>> pci_add_resource_offset() allocates a resource list entry, sets the
>> offset, then adds it to the list.  It doesn't update a resource entry
>> that might be visible to anybody else.  Here we do update a resource
>> that is already visible to others because it's already on the list.
>
> i was following ./drivers/pnp/resource.c, but i'm agree this is not a good
> way.
>
> i'll upload a new version to fix this in another way. more ideas:
> 1/ pass a struct device to of_pci_get_host_bridge_resources and use
> devm_kzalloc

I would pick this one of the 3 options or...

> 2/ add a new type of flags(or reuse IORESOURCE_AUTO) to tell
> pci_free_resource_list to kfree them)
> 3/ add new helpers of of_pci_add_resource[_offset] to alloc empty res, fill
> it, add to list.

2 other options:

Add a function to undo everything that
of_pci_get_host_bridge_resources does. Then every caller of
of_pci_get_host_bridge_resources should have a call to that function.

Or maybe you can add a pci_free_resource_list_and_resources (needs a
better name) to free both resources and list. Then audit all the
current callers of pci_free_resource_list and determine which one's
can be changed (maybe it is all of them).

Rob
