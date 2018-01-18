From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] nvmem: add driver for JZ4780 efuse
Date: Wed, 17 Jan 2018 19:59:08 -0600
Message-ID: <CAL_JsqJ9FQyOO_yaHjjMvwvL_CrWrZz7r4hom6n5hgdx0Z=RNw@mail.gmail.com>
References: <20171228212954.2922-1-malat@debian.org> <20171228212954.2922-2-malat@debian.org>
 <20180103200211.u56tqesyumsofoff@rob-hp-laptop> <CANc+2y5Y9fYh5V5OG_o+-92-uLYew7yNObLGTYPhGyx2eExywA@mail.gmail.com>
 <CAL_JsqJHHPJY0Yg+kmMbjZVsq=VVC0dPgtvXoN+sxL9gjBtMLA@mail.gmail.com> <CANc+2y4nBcVPUjTiXXDDUD_qph0zHAmr-SDCt74C8gCZdNQ4Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANc+2y4nBcVPUjTiXXDDUD_qph0zHAmr-SDCt74C8gCZdNQ4Fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Marcin Nowakowski <marcin.nowakowski-8NJIiSa5LzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Zubair.Kakakhel-8NJIiSa5LzA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 11:31 AM, PrasannaKumar Muralidharan
<prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Rob,
>
> On 11 January 2018 at 20:38, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Sat, Jan 6, 2018 at 6:43 AM, PrasannaKumar Muralidharan
>> <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi Rob,
>>>
>>> On 4 January 2018 at 01:32, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>> On Thu, Dec 28, 2017 at 10:29:52PM +0100, Mathieu Malaterre wrote:
>>>>> From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[...]

>>>>> +             nemc: nemc@13410000 {
>>>>> +                     compatible = "ingenic,jz4780-nemc";
>>>>> +                     reg = <0x13410000 0x10000>;
>>>>> +                     #address-cells = <2>;
>>>>> +                     #size-cells = <1>;
>>>>> +                     ranges = <1 0 0x1b000000 0x1000000
>>>>> +                               2 0 0x1a000000 0x1000000
>>>>> +                               3 0 0x19000000 0x1000000
>>>>> +                               4 0 0x18000000 0x1000000
>>>>> +                               5 0 0x17000000 0x1000000
>>>>> +                               6 0 0x16000000 0x1000000>;
>>>>> +
>>>>> +                     clocks = <&cgu JZ4780_CLK_NEMC>;
>>>>> +
>>>>> +                     status = "disabled";
>>>>> +             };
>>>>>
>>>>> -             clocks = <&cgu JZ4780_CLK_NEMC>;
>>>>> +             efuse: efuse@134100d0 {
>>>>> +                     compatible = "ingenic,jz4780-efuse";
>>>>> +                     reg = <0x134100d0 0xff>;
>>>>
>>>> You are creating an overlapping region here with nemc above. Don't do
>>>> that.
>>>
>>> Should "reg = <0x13410000 0x10000>;" be used instead?
>>
>> No, that still overlaps with nemc. What's in registers 0x00-0xcf and
>> 0x1d0-0xffff? Either get rid of this node altogether and make the
>> driver for nemc also instantiate the efuse driver (DT is not the only
>> way to instantiate drivers), or create sub-nodes under nemc for each
>> distinct h/w block in the 13410000-13420000 address space.
>
> My idea was not to change nemc driver.
>
> By "create sub-nodes under nemc" do you mean something like below?

Yes.

> nemc: nemc@13410000 {
>                      compatible = "ingenic,jz4780-nemc";
>                      reg = <0x13410000 0x10000>;
>                      <...>
>                      status = "disabled";

Though having disabled here is strange. We'd normally ignore all the
child nodes.

>
>                      efuse: efuse@134101d0 {
>                                           compatible = "ingenic,jz4780-efuse";
>                                           reg = <0x134100d0 0xff>;
>                      }
> }
>
> Will this instantiate efuse driver? I do not know how to do that with
> sub-node. I will explore more on this.

The nemc driver just needs to call of_platform_default_populate.

>> Or a third option is make nemc reg:
>>
>> reg = <0x13410000 0xd0>, <0x134101d0 0xfe30>;
>>
>> But I suspect that is wrong and you probably have some other function in there.
>>
>> Rob
>
> If the efuse block were to use a different base register address (that
> does not overlap with nemc register range) in future SoC how the node
> should be? Using nemc to instantiate efuse won't be the best choice if
> that happens.

Then you will have a different compatible for nemc (because it is
different) and then the driver should skip the above step.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
