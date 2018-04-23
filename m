From: Grant Likely <grant.likely@arm.com>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Mon, 23 Apr 2018 15:49:36 +0100
Message-ID: <e8fdb764-77f4-6631-c9b4-a6cf393a69a7@arm.com>
References: <20180418222905.10414-1-robh@kernel.org>
 <152424282214.46528.2511757264045171935@swboyd.mtv.corp.google.com>
 <CAL_Jsq+1G61+E0wtVEkzann3Z=2Cr=2PkbDJ_OuaA5GysWZsXQ@mail.gmail.com>
 <152426770474.46528.1592920281091105196@swboyd.mtv.corp.google.com>
 <63a1c096-7d78-3850-83b7-94c6009e93f0@arm.com>
 <CAL_Jsq+te3o5=X=1n2QHfrLL_MtoiL92_p8jN2=UeFe3L7mmNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+te3o5=X=1n2QHfrLL_MtoiL92_p8jN2=UeFe3L7mmNA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On 23/04/2018 15:38, Rob Herring wrote:
> On Mon, Apr 23, 2018 at 9:01 AM, Grant Likely <grant.likely@arm.com> wrot=
e:
>> On 21/04/2018 00:41, Stephen Boyd wrote:
>>>
>>> Quoting Rob Herring (2018-04-20 11:15:04)
>>>>
>>>> On Fri, Apr 20, 2018 at 11:47 AM, Stephen Boyd <sboyd@kernel.org> wrot=
e:
>>>>>
>>>>> Quoting Rob Herring (2018-04-18 15:29:05)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/example-schema.yaml
>>>>>> b/Documentation/devicetree/bindings/example-schema.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..fe0a3bd1668e
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/example-schema.yaml
>>
>> [...]
>>>>>>
>>>>>> +  interrupts:
>>>>>> +    # Either 1 or 2 interrupts can be present
>>>>>> +    minItems: 1
>>>>>> +    maxItems: 2
>>>>>> +    items:
>>>>>> +      - description: tx or combined interrupt
>>>>>> +      - description: rx interrupt
>>>>>> +
>>>>>> +    description: |
>>>>>
>>>>>
>>>>> The '|' is needed to make yaml happy?
>>>>
>>>>
>>>> Yes, this is simply how you do literal text blocks in yaml.
>>>>
>>>> We don't really need for this one really, but for the top-level
>>>> 'description' we do. The long term intent is 'description' would be
>>>> written in sphinx/rst and can be extracted into the DT spec (for
>>>> common bindings). Grant has experimented with that some.
>>>
>>>
>>> Ok. That sounds cool. Then we could embed links to datasheets and SVGs
>>> too.
>>
>>
>> I'd like it if we can define the description text blocks to be
>> reStructeredText markup. That makes it even easier to integrate with the
>> specification documentation.
>
> I think that's going to require thinking about how each binding is
> integrated into the spec. We're only talking about common bindings I
> presume, but still we have no model defined. For example, with
> properties, I'd assume we'd want to generate a table of properties and
> we wouldn't want the property descriptions in rST because the
> description becomes just a cell in the table. So we need some sort of
> template.
>
> Also, how do we validate that description contains valid rST? No point
> requiring it until we can validate it.

Indeed. Part of that was me thinking outloud. Need to actually get it
working before adding constraints.

g.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
