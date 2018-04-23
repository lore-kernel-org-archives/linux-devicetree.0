From: Grant Likely <grant.likely@arm.com>
Subject: Re: [RFC PATCH] dt-bindings: add a jsonschema binding example
Date: Mon, 23 Apr 2018 15:47:51 +0100
Message-ID: <d2ed3578-ca09-15a6-e688-ffb9a097c2aa@arm.com>
References: <20180418222905.10414-1-robh@kernel.org>
 <e7a2f4ca-40c2-05ef-097c-2cecd31fb731@gmail.com>
 <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKVCdk8nFwmtfNt4mMOVYFVxefgafP6JtXThvFhROFB8w@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>, Jonathan Cameron <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On 21/04/2018 02:28, Rob Herring wrote:
> On Fri, Apr 20, 2018 at 4:00 PM, Frank Rowand <frowand.list@gmail.com> wr=
ote:
>> Hi Rob,
>>
>> Thanks for the example.  It was a good starting tutorial of sorts for me
>> to understand the format a bit.
>>
>>
>> On 04/18/18 15:29, Rob Herring wrote:
>>> The current DT binding documentation format of freeform text is painful
>>> to write, review, validate and maintain.
>>>
>>> This is just an example of what a binding in the schema format looks
>>> like. It's using jsonschema vocabulary in a YAML encoded document. Usin=
g
>>> jsonschema gives us access to existing tooling. A YAML encoding gives u=
s
>>> something easy to edit.
>>>
>>> This example is just the tip of the iceberg, but it the part most
>>> developers writing bindings will interact with. Backing all this up
>>> are meta-schema (to validate the binding schemas), some DT core schema,
>>> YAML encoded DT output with dtc, and a small number of python scripts t=
o
>>> run validation. The gory details including how to run end-to-end
>>> validation can be found here:
>>>
>>> https://www.spinics.net/lists/devicetree-spec/msg00649.html
>>>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>> Cc list,
>>> You all review and/or write lots of binding documents. I'd like some fe=
edback
>>> on the format.
>>>
>>> Thanks,
>>> Rob
>>>
>>>   .../devicetree/bindings/example-schema.yaml        | 149 ++++++++++++=
+++++++++
>>>   1 file changed, 149 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/example-schema.y=
aml
>>>
>>> diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Do=
cumentation/devicetree/bindings/example-schema.yaml
>>> new file mode 100644
>>> index 000000000000..fe0a3bd1668e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/example-schema.yaml
>>
>> I'm guessing by the path name that this is in the Linux kernel source tr=
ee.
>
> Yes, well, my kernel tree. Most of the work still lives here:
>
> https://github.com/robherring/yaml-bindings/
>
>>> @@ -0,0 +1,149 @@
>>> +# SPDX-License-Identifier: BSD-2-Clause
>>
>> If in the Linux kernel source tree, then allow gpl-v2 as a possible lice=
nse.
>
> Why? BSD is compatible. The license of the above repo is all BSD.
>
> Of course there's all the existing docs which default to GPLv2 and
> we'll probably have to maintain that.
>
>>> +# Copyright 2018 Linaro Ltd.
>>> +%YAML 1.2
>>> +---
>>> +# All the top-level keys are standard json-schema keywords except for
>>> +# 'maintainers' and 'select'
>>> +
>>> +# $id is a unique idenifier based on the filename
>>
>>                       ^^^^^^^^^  identifier
>>
>>> +$id: "http://devicetree.org/schemas/example-schema.yaml#"
>>
>> Does this imply that all schemas will be at devicetree.org instead
>> of in the Linux kernel source tree?  This would be counter to my
>> earlier guess about where this patch is applied.
>
> They could be, but not necessarily. This is just convention in
> jsonschema is the best I understand it.
>
> I don't think you'd want validation to require an internet connection.
> For the base meta-schema, for example, it does exist at
> http://json-schema.org/draft-06/schema, but that's also distributed
> with implementations of jsonschema validators.
>
> A large part (not that any part is large) of the tools Grant and I
> have written is doing the cross reference resolution of files which
> uses the $id field.
>
>
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>
>> How is $schema used?
>
> Tells the validator what meta-schema this schema follows. Typically
> you see draft04 or draft06 here if you haven't written a meta-schema.

On this topic, we should probably do the same thing for the dt
metaschemas. I didn't worry about it initially because there was a lot
of working out what it should look like, but we should include a
revision number in the DT metaschema $id URLs.

>> Is it accessed across the network?
>
> Could be, but generally no.

The $schema and $id values are used as unique identifiers. The parser is
setup to look locally for both devicetree.org and json-schema.org URLs,
so network access is not used. The parser /can/ fetch a URL over the
network, but that isn't a feature we want to use.

Using the http://devicetree.org/ prefix makes sense for the metaschema,
and for all the schema files because I think the desire is to have a
common database for all users. For practical reasons it makes sense to
start with putting them in the Linux kernel tree, but only because
that's where all the binding documents currently are. However, we also
have the DT rebasing tree that is tracking mainline and has a good
structure. We can start encouraging non-Linux users to base off the
-rebasing tree, and work on transition plans to allow patches against
-rebasing, and to eventually make it the master tree instead of the kernel.

It is also possible to have other prefixes for schemas that don't belong
in the common repo (but I cannot think of many good reasons for doing that)=
.


>>
>> (This example file provides a good example of a single syntax style, but=
 does
>> not preclude other equivalent syntax.)
>
> There's also a question of formatting. For example, we can have:
>
> enum: [1,2,3]
>
> or
>
> enum:
>    - 1
>    - 2
>    - 3
>
> IMO, we should lock that down too.

I don't think this level of variance needs to be locked down. That is a
very basic example of standard YAML encoding of lists. There are times
when one will look better than the other, and it isn't a lot different
from the kinds of things we do in C. For example:

    int a;
    int b;

vs.

    int a, b;

On Jsonschema vocabulary? Yes, start with it restricted because there
may be unintended consequences. But for YAML syntax, I would rely on the
metaschema to make sure the structure of the data is correct, but not
get worried about the encoding.

[...]
>>> +  interrupts:
>>> +    # Either 1 or 2 interrupts can be present
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    items:
>>> +      - description: tx or combined interrupt
>>> +      - description: rx interrupt
>>> +
>>> +    description: |
>>> +      A variable number of interrupts warrants a description of what c=
onditions
>>> +      affect the number of interrupts. Otherwise, descriptions on stan=
dard
>>> +      properties are not necessary.
>>> +
>>> +  interrupt-names:
>>> +    # minItems must be specified here because the default would be 2
>>> +    minItems: 1
>>
>> Why the difference between the interrupts property and the interrupt-nam=
es
>> property (specifying maxItems for interrupt, but not interrupt-names)?
>
> I should probably have maxItems here too.
>
>> Others have already commented on a desire to have a way to specify that
>> number of interrupts should match number of interrupt-names.
>
> Yeah, but I don't see a way to do that. You could stick the array size
> constraints in a common definition and have a $ref to that definition
> from both, but that doesn't really save you too much.

There has been discussions in the jsonschema community regarding
referencing data in the document when applying the schema.

https://github.com/json-schema-org/json-schema-spec/issues/549

However, those discussions are ongoing and have been pushed back to
after draft-8 (the current release is draft-7). We can instead define
DT-specific keywords and extend the validator to make it do what we
want. We need to do something very similar to validate that the length
of tuples in 'reg', 'interrupts', and '*gpios' match the '#*-cells' values.

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
