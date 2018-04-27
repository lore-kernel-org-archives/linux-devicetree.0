From: Alexander Graf <agraf@suse.de>
Subject: Re: [RFC PATCH 1/3] of: base: Introduce of_alias_check_id() to check
 alias IDs
Date: Fri, 27 Apr 2018 23:58:11 +0200
Message-ID: <e2039dc5-92ec-d3a1-bc4f-6565a8c901ac@suse.de>
References: <cover.1524751696.git.michal.simek@xilinx.com>
 <6045807691c310ccdd57ab16524b7525f26a1dc1.1524751696.git.michal.simek@xilinx.com>
 <CAL_Jsq+69p1GstFua1-27LGv9MKT8dtbd1ytcq+GuvQ=VcEHKg@mail.gmail.com>
 <ba081812-f532-5ebd-b052-cdeb1f02bff1@xilinx.com>
 <CAL_Jsq+3WnGNM0ip_v75s8f5-Wq_9ht19-T-MHyhKjzcU6jtdg@mail.gmail.com>
 <147e8ae7-3682-2350-394a-828c096f5ee3@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <147e8ae7-3682-2350-394a-828c096f5ee3@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org



On 27.04.18 16:14, Michal Simek wrote:
> On 27.4.2018 15:02, Rob Herring wrote:
>> On Fri, Apr 27, 2018 at 1:10 AM, Michal Simek <michal.simek@xilinx.com> wrote:
>>> On 27.4.2018 04:39, Rob Herring wrote:
>>>> On Thu, Apr 26, 2018 at 9:08 AM, Michal Simek <michal.simek@xilinx.com> wrote:
>>>>> The function travers the lookup table to check if the request alias
>>>>> id is compatible with the device driver match structure.
>>>>> This function will be used by serial drivers to check if requested alias
>>>>> is allocated or free to use.
>>>>>
>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>> ---
>>>>>
>>>>>  drivers/of/base.c  | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>>  include/linux/of.h |  2 ++
>>>>>  2 files changed, 51 insertions(+)
>>>>>
>>>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>>>> index 848f549164cd..382de01acc72 100644
>>>>> --- a/drivers/of/base.c
>>>>> +++ b/drivers/of/base.c
>>>>> @@ -1892,6 +1892,55 @@ int of_alias_get_id(struct device_node *np, const char *stem)
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(of_alias_get_id);
>>>>>
>>>>> +/**
>>>>> + * of_alias_check_id - Check alias id for the give compatibility
>>>>> + * @matches:   Array of of device match structures to search in
>>>>> + * @stem:      Alias stem of the given device_node
>>>>> + * @id:                Alias ID for checking
>>>>> + *
>>>>> + * The function travers the lookup table to check if the request alias id
>>>>> + * is compatible with the device driver match structure
>>>>> + *
>>>>> + * Return true if ID is allocated, return false if not
>>>>> + */
>>>>> +bool of_alias_check_id(const struct of_device_id *matches, const char *stem,
>>>>> +                      int id)
>>>>
>>>> Wouldn't it be simpler to just return a bitmap of all allocated ids
>>>> that match rather than trying to build that up 1 bit at a time?
>>>
>>> Is alias list stable or can dt overlay change it?
>>
>> Stable. If you use an id and then an overlay adds that id as an alias,
>> what should the kernel do? The only choice is ignore the suggestion.
> 
> I didn't play with that for a while but on fpga case you have for
> example serial0/serial1 fixed to hard IPs/PS part and then you add 20
> uartlites or 16550 IPs to PL via overlays and you want to make sure
> proper order for user application.
> It means it is not rewriting current but adding new one exactly how you
> should do that when fixed and fpga parts are together.
> 
> 
>>
>>> What should be the expected flow? Find out maximum number of aliases of
>>> the same kind and allocate bitmap and return it with length.
>>
>> I think we can assume <32 so just return a bitmap in a unsigned long
>> or u32. Use that to initialize a bitmap in the driver. For un-aliased
>> devices, find the first unset bit, use that id and set the bit.
> 
> Ok if this is in driver field can be allocated in the driver and passed
> also maximum len. It should be better then expecting maximum of 32
> devices which ends with max serial31 alias.
> 
> Or at least expect u64 with max serial63.
> 
> 
>>> Anyway if you look at that patches I sent then I call in the driver
>>> of_alias_get_highest_id("serial") which doesn't take care if alias match
>>> with actual driver. It means having information about max alias ID which
>>> match actual driver that would be helpful but I am not quite sure what
>>> should be the flow.
>>
>> I'm a bit confused as to why you use of_alias_get_highest_id and
>> of_alias_check_id. of_alias_get_highest_id is really intended if  you
>> want to start dynamic allocations above all the alias ids.
> 
> I need to get maximum number of ports for passing it to
> uart_register_driver which is called only once.
> And using of_alias_get_highest_id() return me reasonable number for all
> listed serial ports.
> It is not correct because some IPs don't need to be listed in that list
> but it is reasonable expectation for this RFC.
> Even alias bitfield won't help with getting correct number.
> 
> 
> The best will be to get number of devices which match that driver
> because they don't need to be listed in aliases list.
> 
> You get 20 of devices and will allocate space for 20. If there is alias
> below 20 you will use numbers. If there is alias >= 20 it will be
> ignored in probe and number will be assigned based on empty position.
> 
> But this is also no covering overlay cases where others devices can be
> added at run time.
> 
> 
>> I guess the need to match devices is based on each serial driver
>> having it's own major and /dev name. IMO, we should get rid of those
>> and every serial driver use ttySn (with the exception of things like
>> USB serial). Then you'd just need to find all serial aliases. But you
>> can support both with this function. Just return a bitmap of all
>> aliases if match is NULL.
> 
> This will break a lot of things which are stable today.

What if ttySn were simply symlinks and no driver spawns any device of
that name? So the normal NS16550 UART driver would get a new name, but
ttyS0 we could still match for everywhere regardless.

In that layer we could then do the alias mapping and simply honor the
numbers given by DT.


Alex
