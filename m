From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Question about "unit address format error" of DTC
Date: Fri, 10 Nov 2017 09:48:46 -0600
Message-ID: <CAL_JsqLXRxz-VpFe5AC6NHu5UBvi8frt1CtEFSJH_JhaLDk8QQ@mail.gmail.com>
References: <CAK7LNARujG8J_z62bc+PQOz34rf-Bo=+M54kvtokZxnktn2Y+A@mail.gmail.com>
 <CAL_Jsq+eZkCQTEHLb62Le3e6eLxt=N7EWGk7dsPAfLF9-73soQ@mail.gmail.com>
 <CAK7LNARoE6hhhH36ZugfqCNubUQzSLYGkMrx5TzTQe-gpu4CaQ@mail.gmail.com>
 <CAL_JsqKjF0um6UrsyBSKF5bY3rRscRqua0ncJca6ZCOh5VcKwA@mail.gmail.com> <CAK7LNASRMBY1KjtzGxtXzkzDWgXmu3ZzfJu5kh1GRqP1WxQ6TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASRMBY1KjtzGxtXzkzDWgXmu3ZzfJu5kh1GRqP1WxQ6TQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 9, 2017 at 7:48 PM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> Hi Rob,
>
> 2017-11-10 3:04 GMT+09:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>> On Thu, Nov 9, 2017 at 9:09 AM, Masahiro Yamada
>> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>>> Hi Rob,
>>>
>>> 2017-11-09 23:15 GMT+09:00 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
>>>> On Thu, Nov 9, 2017 at 6:14 AM, Masahiro Yamada
>>>> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>>>>> Hi Rob, David,
>>>>>
>>>>>
>>>>> I am just curious about a DTC warning.
>>>>>
>>>>>
>>>>> For example,
>>>>>
>>>>> soc {
>>>>>     compatible = "simple-bus";
>>>>>     #address-cells = <1>;
>>>>>     #size-cells = <1>;
>>>>>     ranges;
>>>>>
>>>>>     foo@11111111 {
>>>>>          compatible = "foo";
>>>>>          reg = <0x54006800 0x40>;
>>>>>     };
>>>>> };
>>>>>
>>>>> This emits the following warning.
>>>>>
>>>>> Warning (simple_bus_reg): Node /soc/foo@11111111 simple-bus unit
>>>>> address format error, expected "54006800"
>>>>>
>>>>>
>>>>> But, if I replace "simple-bus" with "simple-mfd",
>>>>> DTC is completely happy.
>>>>
>>>> We could probably add simple-mfd to the check. Though, if you have
>>>> addresses, then you probably should use simple-bus. I'm not a bit fan
>>>> of simple-mfd in general.
>>>>
>>>>> Why is this check limited to simple bus / PCI bus?
>>>>
>>>> Because bus types are free to define their own unit address format to
>>>> some extent.
>>>>
>>>>> For other cases, is mismatching @<address>  allowed?
>>>>
>>>> No, but it is not checked. Most other cases such as I2C and SPI buses
>>>> aren't checked because we have no generic way to key off of them. We
>>>> need schema data with compatible strings of those bus controllers to
>>>> do the checking.
>>>>
>>>> Any bus type needs to define its unit address format. Generally, it
>>>> must match data fields in reg property and distinct fields are
>>>> separated by commas.
>>>>
>>>
>>> Thanks.
>>> I had a more specific example I wanted to ask,
>>> but your last comment "distinct fields are separated by commas"
>>> probably answered the question.
>>>
>>>
>>> The following is an example of NVMEM data cells.
>>> The generic binding is Documentation/devicetree/binding/nvmem/nvmem.txt
>>>
>>>
>>> reg:    specifies the offset in byte within the storage device.
>>>
>>> bits:   Is pair of bit location and number of bits, which specifies offset
>>>         in bit and number of bits within the address range specified
>>> by reg property.
>>>         Offset takes values from 0-7.
>>>
>>> So, it is possible to have multiple data cells
>>> that share the same "reg".
>>
>> In hindsight, I think I'd do away with bits and just define that reg
>> is the offset and size in bits. Maybe we did discuss that and I've
>> just forgotten the reasons not to do that.
>
>
> Yeah, I like the idea, but "in hindsight".
>
>
>
>>>
>>> @<reg-offset>,<bit-position>
>>> was the idea in my mind, but I was not 100% sure.
>>
>> Yeah, this is fine. Bonus points if you write a check in dtc for it. I
>> think we can match on #nvmem-cells in the parent node.
>
>
> I have no idea when I can look into it.
>
> I think most (all?) of DTC checks are from your contribution.

Recently, yes. Except for fixing all my bugs. :)

> It would be appreciated if you care to it.

I'd appreciate contributions from others. :)

> One idea for generic solution might be DTC checks:
>
>   - @* exactly matches to reg
>
>      or
>
>   - The first field of comma separated @*,*,... matches to reg

David rejected generic checks of the unit-address beyond what we have
now. Part of the problem is what is valid vs. what is considered best
practice today. Or to put another way, things we'd like to check and
discourage, but aren't something we should fix in existing
trees/bindings.

Rob
