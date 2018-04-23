From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Mon, 23 Apr 2018 09:38:59 -0500
Message-ID: <CAL_Jsq+te3o5=X=1n2QHfrLL_MtoiL92_p8jN2=UeFe3L7mmNA@mail.gmail.com>
References: <20180418222905.10414-1-robh@kernel.org> <152424282214.46528.2511757264045171935@swboyd.mtv.corp.google.com>
 <CAL_Jsq+1G61+E0wtVEkzann3Z=2Cr=2PkbDJ_OuaA5GysWZsXQ@mail.gmail.com>
 <152426770474.46528.1592920281091105196@swboyd.mtv.corp.google.com> <63a1c096-7d78-3850-83b7-94c6009e93f0@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <63a1c096-7d78-3850-83b7-94c6009e93f0@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree-spec@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2018 at 9:01 AM, Grant Likely <grant.likely@arm.com> wrote:
> On 21/04/2018 00:41, Stephen Boyd wrote:
>>
>> Quoting Rob Herring (2018-04-20 11:15:04)
>>>
>>> On Fri, Apr 20, 2018 at 11:47 AM, Stephen Boyd <sboyd@kernel.org> wrote:
>>>>
>>>> Quoting Rob Herring (2018-04-18 15:29:05)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/example-schema.yaml
>>>>> b/Documentation/devicetree/bindings/example-schema.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..fe0a3bd1668e
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/example-schema.yaml
>
> [...]
>>>>>
>>>>> +  interrupts:
>>>>> +    # Either 1 or 2 interrupts can be present
>>>>> +    minItems: 1
>>>>> +    maxItems: 2
>>>>> +    items:
>>>>> +      - description: tx or combined interrupt
>>>>> +      - description: rx interrupt
>>>>> +
>>>>> +    description: |
>>>>
>>>>
>>>> The '|' is needed to make yaml happy?
>>>
>>>
>>> Yes, this is simply how you do literal text blocks in yaml.
>>>
>>> We don't really need for this one really, but for the top-level
>>> 'description' we do. The long term intent is 'description' would be
>>> written in sphinx/rst and can be extracted into the DT spec (for
>>> common bindings). Grant has experimented with that some.
>>
>>
>> Ok. That sounds cool. Then we could embed links to datasheets and SVGs
>> too.
>
>
> I'd like it if we can define the description text blocks to be
> reStructeredText markup. That makes it even easier to integrate with the
> specification documentation.

I think that's going to require thinking about how each binding is
integrated into the spec. We're only talking about common bindings I
presume, but still we have no model defined. For example, with
properties, I'd assume we'd want to generate a table of properties and
we wouldn't want the property descriptions in rST because the
description becomes just a cell in the table. So we need some sort of
template.

Also, how do we validate that description contains valid rST? No point
requiring it until we can validate it.

> [...]
>>>>>
>>>>> +  # Property names starting with '#' must be quoted
>>>>> +  '#interrupt-cells':
>>>>> +    # A simple case where the value must always be '2'.
>>>>> +    # The core schema handles that this must be a single integer.
>>>>> +    const: 2
>>>>> +
>>>>> +  interrupt-controller: {}
>>>>
>>>>
>>>> Does '{}' mean nothing to see here?
>>>
>>>
>>> Yes. It's just an empty schema that's always valid.
>
>
> IIRC, in the current jsonschema draft-6 spec, the following also has the
> same behaviour, which I like slightly better:
>     interrupt-controller: true

They are not exactly the same. '{}' is a schema object and 'true' is
just a boolean. But yes, it can work. We need to drop "type: object"
from meta-schemas/boolean.yaml and it will work.

Rob
