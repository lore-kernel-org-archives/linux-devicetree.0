From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Boolean properties
Date: Fri, 09 Dec 2011 10:00:14 +0800
Message-ID: <4EE16BAE.5010207@firmworks.com>
References: <CAPnjgZ1BevAt3==ZcQKn_f7xudrcKE+ks0YpHwBFqTXg2uc7Jw@mail.gmail.com>
 <20111206231216.GB7631@truffala.fritz.box> <4EDF1DFC.3020808@firmworks.com>
 <CAPnjgZ0LrPZgL680LKpOkBZfA_s8duzz3_Knzpufuq=mW8Ubbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ0LrPZgL680LKpOkBZfA_s8duzz3_Knzpufuq=mW8Ubbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I don't have a strong feeling either way - I was just reporting the 
historical thinking.  I agree that it's easier to change a value than to 
delete a property, but in the grand scheme of things, it's not a huge 
deal, just a minor convenience.


On 12/9/2011 9:33 AM, Simon Glass wrote:
> Hi Mitch,
>
> On Wed, Dec 7, 2011 at 12:04 AM, Mitch Bradley<wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>  wrote:
>> On 12/7/2011 7:12 AM, David Gibson wrote:
>>>
>>> On Mon, Dec 05, 2011 at 04:29:22PM -0800, Simon Glass wrote:
>>>>
>>>> Hi,
>>>>
>>>> As I understand it, boolean properties in the device tree are defined
>>>> as follows:
>>>>
>>>> - if the property is present, then it is true
>>>> - if the property is absent, then it is false
>>>
>>>
>>> That's the common convention.  Although an individual binding could
>>> define something else, and I think some already do define a
>>> boolean~=int approach instead (e.g. the ibm,dfp cpu property).  In
>>> some cases that's anticipating future expansion to values other than 0
>>> and 1.
>>>
>>>> The fdtget and fdtput utilities deal with reading and changing these.
>>>> At present fdtget returns the value of the property and is not
>>>> suitable for boolean properties. fdtput allows setting of a property
>>>> value but not removing it.
>>>>
>>>> To deal with boolean properties these utilities need to change. One
>>>> option is to use something like:
>>>>
>>>> $ fdtget -t f /path/to/node property
>>>> (prints 'true' or 'false')
>>>> $ fdtput -t f /path/to/node property false/true
>>>> $ fdtput -t f /path/to/node property 0/1
>>>> (deletes the property for false and 0; adds it with no value for true and
>>>> 1)
>>>>
>>>> (Unfortunately the 'b' type is taken for byte at present, so it is
>>>> unclear to be so far what letter we should use for 'f' in the -t flag)
>>>
>>>
>>> Hrm.  Rather than treating this as a boolean "type", I think it would
>>> be less ambiguous to instead add options to explicitly delete a
>>> property (either e.g. fdtput -d or a new fdtdel), and to create an
>>> empty valued property.
>>>
>>>> But first I would like to suggest that we support boolean properties
>>>> with a value, i.e. change to:
>>>>
>>>> - if the property is absent, then it is false
>>>> - if the property is present, then it is true
>>>>      - unless the property has a 0 value, iwc it is false
>>>
>>>
>>> So the first question here is who/what exactly constitutes "we" here -
>>> kernel, u-boot, dtc?  Using the above logic sounds like a good idea
>>> for fdt readers on the "be liberal in what you accept" principle.  But
>>> it's something I'd like to see Mitch Bradley and/or Segher comment on
>>> - they'd have a better idea of whether there's existing practice that
>>> might break with that.
>>
>>
>> Since the producer and consumer of a named property must agree on the
>> interpretation of its value, you can do whatever you want with a newly-named
>> property without breaking anything else - although you might not be able to
>> use existing encoding/decoding methods if you make up something new.
>>
>> The use case for absence/presence boolean properties was as follows:
>>
>> You develop a device and describe it via a set of properties.  Some time
>> later, someone develops a newer version of that device that has a new
>> feature that was not contemplated in the original design.  You need to
>> declare that the feature exists, but the device node for the older version
>> has no property relating to that hitherto-unknown feature.  So you invent a
>> new property, with the understanding that the absence of that property
>> indicates that the feature is not present.
>>
>> That scheme does not preclude a "name"=0/1 formulation, with the
>> understanding that absence implies 0, but it's unclear to me that the 0/1
>> value adds much.  Either way, for your system to work, you have to get the
>> right information in the device node.
>
> Yes that's right. Can you please look at my three reasons below and
> comment on those?
>
>>
>> The =0/1 formulation could in principle be used for 3 states, with absence
>> meaning either "don't know" or "error".  To my way of thinking, that just
>> makes things more complicated, putting the burden on the programmer to
>> somehow handle a vague condition.  I prefer "get it right and be done with
>> it".
>
> Absence means 0 and I don't propose to change that, nor introduce a
> vague condition. My suggest is purely that we allow boolean properties
> to have value which is not ignored. Please see below for my reasons,
> which may or may not be persuasive:
>
>>
>>
>>
>>
>>>
>>>> There are three reasons:
>>>> 1. it is very confusing for the poor user to set a property value to 0
>>>> and have it come back as 'true' from a function that checks these
>>>> sorts of things. This is particularly true since fdt properties do not
>>>> have types, or even type hints.  The function I have in mind is
>>>> something like this (modified to fit the discussion):
>>>>
>>>> /**
>>>>   * Look up a boolean property in a node and return it.
>>>>   *
>>>>   * A boolean properly is true if present in the device tree and false if
>>>> not
>>>>   * present (regardless of any property data/value).
>>>>   *
>>>>   * @param blob FDT blob
>>>>   * @param node node to examine
>>>>   * @param prop_name    name of property to find
>>>>   * @return 1 if the properly is present; 0 if it isn't present
>>>>   */
>>>> int fdtdec_get_bool(const void *blob, int node, const char *prop_name);
>>>>
>>>> An alternative might be to print an error (and refuse to return a
>>>> value) when a boolean property has a value:
>>>>
>>>>   * @return 1 if the properly is present; 0 if it isn't present, -1 if
>>>> it has any data (and is therefore illegal as a boolean property)
>>>
>>>
>>> Kind of a pain for C.
>>>
>>>> 2. it allows us to adjust the boolean value without requiring a change
>>>> in the size of the device tree blob (faster, easier)
>>>>
>>>> 3. Related to 2 it allows us to put template values in the fdt which
>>>> can then be *optionally* updated in the build system or in U-Boot to
>>>> the required value before passing to the kernel.
>>>>
>>>> I presume this discussion has happened before - can anyone please
>>>> point me to the thread?
>>>>
>>>> Regards,
>>>> Simon
>>>>
>>>
>>
>
>
