From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT binding
 document
Date: Sun, 30 Aug 2015 15:18:19 -0700
Message-ID: <55E3812B.2090105@gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com> <1440739433-6799-3-git-send-email-mporter@konsulko.com> <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com> <20150828174937.GB24203@beef> <CAL_JsqJy21yBGe161MrTEC1kL4UD=h+skH=mPm-vjwZ7yEHoUA@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJy21yBGe161MrTEC1kL4UD=h+skH=mPm-vjwZ7yEHoUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8/28/2015 11:55 AM, Rob Herring wrote:
> On Fri, Aug 28, 2015 at 12:49 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> On Fri, Aug 28, 2015 at 09:53:06AM -0500, Rob Herring wrote:
>>> On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> Add a skeleton DT binding document that serves as the canonical
>>>> example for implementing YAML-based DT bindings documentation.
>>>> The skeleton binding illustrates use of all fields and variations
>>>> described in the dt-binding-format.txt documentation.
>>>>
>>>> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++++++++++++
>>>>  1 file changed, 98 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Documentation/devicetree/bindings/skeleton.yaml
>>>> new file mode 100644
>>>> index 0000000..175965f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/skeleton.yaml
>>>> @@ -0,0 +1,98 @@
>>>> +%YAML 1.2
>>>> +---
>>>> +id: skel-device
>>>> +
>>>> +title: Skeleton Device
>>>> +
>>>> +maintainer:
>>>> +  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>
>>> We'd want to tie this into get_maintainers.pl obviously.
>>
>> Right, I broke my rule of "no new tags for content we don't already
>> have" by adding this. It stems out of the discussion at LPC where
>> Mark suggested we could avoid the core bindings being moved by adding
>> maintainer info into the binding itself.
> 
> If you stated that rule, I missed it...
> 
>> This is an area where more docs are needed. Ideally, on the first pass
>> conversion we would not attempt to populate these. I had considered
>> that we *could* only add maintainer: tags on core bindings to and
>> adjust get_maintainers.pl to use that info to override the standard
>> directory-based info if it exists. I don't think it's necessary to add
>> a specific maintainer for all of the peripheral bindings if the default
>> is the subsystem maintainer and the dt list. We could at least start
>> directing core binding discussion to the -spec list which is where I
>> think you'd like it.

I think that adding the maintainer: tags for core bindings in the conversion
process (and optionally add the tag for other bindings in the person
converting has the driver and subsystem knowledge to intelligently
do so -- not just a blind list from get_maintainer) would be a valid
exception to your desire to not add new information on the conversion
step.  As much as other uses of information from bindings is near and
dear to me, I think that throttling the binding review fire hose is
the highest priority use of additional information.


> Yes, certainly this can solve my problem around handling core bindings.
> 
> Some subsystem maintainers require a driver have a maintainer. We
> could certainly enforce that too. We could probably automatically
> populate this with the original author as a starting point. OTOH,
> bindings should not change frequently.
> 
>>
>>>> +
>>>> +description: >
>>>> +  The Skeleton Device binding represents the SK11 device produced by
>>>> +  the Skeleton Corporation. The binding can also support compatible
>>>> +  clones made by second source vendors.
>>>> +
>>>> +compatible:
>>>> +  - name: "skel,sk11"
>>>> +  - name: "faux,fx11"
>>>
>>> Is this an OR or AND? We need both.
>>
>> True, this only covers the OR case atm.
>>
>>> The complicated case is "one of {specific names} followed by {generic name}."
>>
>> I need to rethink these. I do have deprecated: tag for that case and
>> possibly "name:" gets split to "generic:" and "specific:" and we can
>> then do the right thing.
>>
>> For the above I would have:
>>
>> compatible:
>>   - specific: "skel,sk11"
>>   - specific: "faux,fx11"
> 
> This can still be an AND or OR relationship.
> 
>>
>> and something like the Allwinner simple framebuffer would be:
>>
>> compatible:
>>   - generic: "simple-framebuffer"
>>   - specific: "allwinner,simple-framebuffer"
>>
>> where our validator would insist on seeing one of the specific: tags
>> along with the generic: tag. A lot of bindings, given current doc
>> patterns would just have two tags like above.
> 
> We could follow Pantelis' suggestion and do C style logic expressions:
> 
> name: ("chip1-ipblock" || "chip2-ipblock") && "generic-ipblock"
> 
> 
>>
>>>> +    description: A clone of the original sk11 device
>>>> +
>>>> +required:
>>>> +  - name: "reg"
>>>
>>> We definitely need type info from the start.
>>
>> Are you sure? Ugh.
>>
>> My big contention here is that we don't carry that content in the
>> docs today so we shouldn't try to add it in the initial conversion.
> 
> What? We have that all over the place. Boolean properties, phandles, etc.

Piling on...  If the type information is obvious in the current binding
doc, then it should be captured in the conversion and not lost.  If the
information is not currently present then it should not be required in
the conversion step.

Which means that we need to define the how to specify the type information.


>> I think you are right in that we should have it documented in the
>> schema but I'm concerned that we make the starting conversion
>> effort too large by adding type info to all converted docs.
> 
> How we do the conversion certainly needs to be worked out. However,
> first we need some sort of agreement that yes this looks promising
> before we spend too much time on it. We need to wait for all the YAML
> haters to come out of hiding. :) Once the direction is settled, then
> we can iron out the details of the structure. Finally, then we can
> determine how to do the conversion. Just because we define how type
> information looks doesn't mean it has to be there day 1.
> 
>> I think we gain a lot even without at the start, but I understand
>> why we need it and how it will help reduce the review firehose
>> with the associated validation tools.
>>
>>>
>>>> +    description: chip select address of skeleton device
>>>> +    reference: spi-slave
>>>
>>> I would like to not have to list properties if the inherited binding
>>> lists it. The problem is we need to say how many cells and the order
>>> (not a problem here, but for mmio devices).
>>
>> Yeah, make sense.
>>
>>> Perhaps we can list the reference at the top level for the node
>>> instead of for every property.
>>
>> That's a good point. I was wondering if per prop references would
>> get unwieldy once we actually add them into all the converted docs.
>> There's a huge number of existing docs without proper references.
> 
> Yes, in many cases they are implied. It should be simple enough to
> generate the list though whether they point to the doc file or just
> list the properties.
> 
>>
>> Ok, I'll take a look at collecting references per group of properties.
>>
>>>
>>>> +  - name: "spi-max-frequency"
>>>> +    description: >
>>>> +      Maximum SPI clocking speed of skeleton device in Hz, must be
>>>> +      1000000
>>>> +    reference: spi-slave
>>>
>>> Rather than listing the property and having constraint in description,
>>> perhaps we could add constraints like this:
>>>
>>> - spi-max-frequency-range: 1000000 1000000
>>>
>>> Or groups of constraints:
>>>
>>> - spi-max-frequency-constraints:
>>>   range: 1000000 1000000
>>>   some-other-constraint: <value>
>>
>> I was hoping to avoid this to start due to my argument for keeping it
>> simple for the first pass at conversion. However, the latter looks
>> flexible enough. We have cases with enumerated values as well to handle
>> the require some thought.
> 
> We can always add constraints as a second step, but I'd like to define
> the structure at least.

Agreed, this is something that I would like to see defined, just to make
sure that we can do it in a reasonable way with the proposed tool.


> Rob
> 


-Frank
