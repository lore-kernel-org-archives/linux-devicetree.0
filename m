From: Grant Likely <grant.likely@arm.com>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Wed, 25 Apr 2018 11:15:43 +0100
Message-ID: <3a4299cf-b737-8e74-2e9e-994f5943d006@arm.com>
References: <20180418222905.10414-1-robh@kernel.org>
 <e7a2f4ca-40c2-05ef-097c-2cecd31fb731@gmail.com>
 <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
 <d2ed3578-ca09-15a6-e688-ffb9a097c2aa@arm.com>
 <CAMuHMdU8q0VUxw-EXDqjjYbjeCwCkKuDJUjO0vSaCVrYLXqX4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU8q0VUxw-EXDqjjYbjeCwCkKuDJUjO0vSaCVrYLXqX4A@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, devicetree-spec@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On 23/04/2018 17:49, Geert Uytterhoeven wrote:
> Hi Grant,
>
> On Mon, Apr 23, 2018 at 4:47 PM, Grant Likely <grant.likely@arm.com> wrot=
e:
>> On 21/04/2018 02:28, Rob Herring wrote:
>>> On Fri, Apr 20, 2018 at 4:00 PM, Frank Rowand <frowand.list@gmail.com>
>>> wrote:
>>>>> +  interrupts:
>>>>> +    # Either 1 or 2 interrupts can be present
>>>>> +    minItems: 1
>>>>> +    maxItems: 2
>>>>> +    items:
>>>>> +      - description: tx or combined interrupt
>>>>> +      - description: rx interrupt
>>>>> +
>>>>> +    description: |
>>>>> +      A variable number of interrupts warrants a description of what
>>>>> conditions
>>>>> +      affect the number of interrupts. Otherwise, descriptions on
>>>>> standard
>>>>> +      properties are not necessary.
>>>>> +
>>>>> +  interrupt-names:
>>>>> +    # minItems must be specified here because the default would be 2
>>>>> +    minItems: 1
>>>>
>>>> Why the difference between the interrupts property and the
>>>> interrupt-names
>>>> property (specifying maxItems for interrupt, but not interrupt-names)?
>>>
>>> I should probably have maxItems here too.
>>>
>>>> Others have already commented on a desire to have a way to specify tha=
t
>>>> number of interrupts should match number of interrupt-names.
>>>
>>> Yeah, but I don't see a way to do that. You could stick the array size
>>> constraints in a common definition and have a $ref to that definition
>>> from both, but that doesn't really save you too much.
>>
>>
>> There has been discussions in the jsonschema community regarding
>> referencing data in the document when applying the schema.
>>
>> https://github.com/json-schema-org/json-schema-spec/issues/549
>>
>> However, those discussions are ongoing and have been pushed back to
>> after draft-8 (the current release is draft-7). We can instead define
>> DT-specific keywords and extend the validator to make it do what we
>> want. We need to do something very similar to validate that the length
>> of tuples in 'reg', 'interrupts', and '*gpios' match the '#*-cells' valu=
es.
>
> Checking that property lengths match the corresponding #*-cells cannot
> be done for a schema, but only for the final DTS, as #*-cells is a proper=
ty
> of the target node, right?

It can be done in the schema checking of the target node. For example,
given a GPIO specifier of:

gpios =3D <&gpio1 0> <&gpio2 4 1> <&gpio2 3 0>;

The validation engine could validate that the &gpio1 and &gpio2 targets
have the same length as the associated gpio descriptor tuples. (ex.
gpio1 needs #gpio-cells=3D<1>; and gpio2 needs #gpio-cells=3D<2>; If the
tuples are the wrong size, then validation should fail.

g.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
