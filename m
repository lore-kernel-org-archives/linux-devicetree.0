MIME-Version: 1.0
In-Reply-To: <F23F6108-A3BE-47CB-B545-4F40520979BF@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1403430039-15085-6-git-send-email-pantelis.antoniou@konsulko.com>
	<53A85549.7040809@nsn.com>
	<6E91A461-4361-4A18-BE32-CECDD789C114@konsulko.com>
	<20140623183343.GA10389@heimdall>
	<78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com>
	<53A8848A.3000803@roeck-us.net>
	<F23F6108-A3BE-47CB-B545-4F40520979BF@konsulko.com>
Date: Tue, 24 Jun 2014 08:46:24 -0500
Message-ID: <CAL_Jsq+wdybDOWtEJFiRn7TMxAdJ8at27G_KvCHkO_444hqZuw@mail.gmail.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Ioan Nicu <ioan.nicu.ext@nsn.com>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Grant Likely <grant.likely@secretlab.ca>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 24, 2014 at 4:08 AM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:
> Hi Guenter,
>
> On Jun 23, 2014, at 10:48 PM, Guenter Roeck wrote:
>
>> On 06/23/2014 12:13 PM, Pantelis Antoniou wrote:
>>> Hi Ioan,
>>>
>>> I'm going to let Grant answer that but the code in question doesn't look right.
>>>
>>> On Jun 23, 2014, at 9:33 PM, Ioan Nicu wrote:
>>>
>>>> Hi Pantelis,
>>>>
>>>> On Mon, Jun 23, 2014 at 07:57:24PM +0300, ext Pantelis Antoniou wrote:
>>>>> Hi Alexander,
>>>>>
>>>>> On Jun 23, 2014, at 7:26 PM, Alexander Sverdlin wrote:
>>>>>
>>>>>> Hello Pantelis!
>>>>>>
>>>>>> On 22/06/14 11:40, ext Pantelis Antoniou wrote:
>>>>>>> Introduce helper functions for working with the live DT tree,
>>>>>>> all of them related to dynamically adding/removing nodes and
>>>>>>> properties.
>>>>>>>
>>>>>>> __of_copy_property() copies a property dynamically
>>>>>>> __of_create_empty_node() creates an empty node
>>>>>>>
>>>>>>> Bug fix about prop->len == 0 by Ionut Nicu <ioan.nicu.ext@nsn.com>
>>>>>>
>>>>>> Are you sure about this? (see below...)
>>>>>>
>>>>
>>>> Alexander is right, my fix was lost even though it's mentioned in this patch.
>>>>
>>>
>>> I'm sorry, I didn't understand that the intention of the fix was to address
>>> the issue below.
>>>
>>>>>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>>>>>>> ---
>>>>>
>>>>> [snip]
>>>>>>> +
>>>>>>> +        if (prop->length > 0) {
>>>>>>       ^^^^^^^^^^^^^^^^^^^^^
>>>>>> Seems, that length==0 case will still produce value==NULL results,
>>>>>> which will brake some checks in the kernel... Or am I missing something in
>>>>>> the new version?
>>>>>>
>>>>>
>>>>> prop->value will be set to NULL, and length will be set to zero (kzalloc).
>>>>> This is a normal zero length property.
>>>>>
>>>>> I don't know of any place in the kernel accessing the value if prop->length==0
>>>>>
>>>>
>>>> We have a simple use case. We have an overlay which adds an interrupt controller.
>>>> If you look in drivers/of/irq.c, in of_irq_parse_raw():
>>>>
>>>> [...]
>>>>     /* Now start the actual "proper" walk of the interrupt tree */
>>>>     while (ipar != NULL) {
>>>>             /* Now check if cursor is an interrupt-controller and if it is
>>>>              * then we are done
>>>>              */
>>>>             if (of_get_property(ipar, "interrupt-controller", NULL) !=
>>>>                             NULL) {
>>>>                     pr_debug(" -> got it !\n");
>>>>                     return 0;
>>>>             }
>>>> [...]
>>>>
>>>> A node is identified as an interrupt controller if it has a zero-length property
>>>> called "interrupt-controller" but with a non-NULL value.
>>>>
>>>> My proposed fix for this was to remove the if () condition. propn->value will be
>>>> allocated with kmalloc(0) which returns ZERO_SIZE_PTR which is != NULL.
>>>>
>>>
>>> If that's the case, the code in irq.c is wrong.
>>>
>>> interrupt-controller is a bool property; the correct call to use is of_property_read_bool()
>>> which returns true or false when the value is defined.
>>>
>>> The use of of_get_property is a bug here. It is perfectly valid for a property to have a
>>> NULL value when length = 0.
>>>
>>
>> That usage is spread throughout the code though. There are three or four similar checks
>> for interrupt-controller in the code, and many others using of_get_property() to check
>> for booleans.
>>
>> Some examples:
>>       s5m8767,pmic-buck2-ramp-enable
>>       s5m8767,pmic-buck3-ramp-enable
>>       s5m8767,pmic-buck4-ramp-enable
>>       d7s-flipped?
>>       atmel,use-dma-rx
>>       linux,rs485-enabled-at-boot-time
>>       marvell,enable-port1 (and many others)
>>       linux,bootx-noscreen
>>       linux,opened
>>
>> and many many others.
>>
>> Maybe people meant to use of_find_property() ?
>>
>
> I bet... I see a lot of users doing if (of_get_property()).
>
> Which is no good.

I don't see what the issue is. The irq.c code is correct. The code is
checking for existence of a property or not and of_get_property
adequately does that. of_find_property is equivalent in this case. Now
we could make the code stricter that properties defined to be empty
are in fact empty. My opinion is that it is not the kernel's job to
validate DTs. This can and should be done at dtb build time.

Boolean and empty properties are not the same. Booleans can have a
value of true or false in addition to being absent (false) or present
with no value (true). of_get_property predates of_property_read_bool
and other helpers by many years, so no doubt there are many callers of
of_get_property which could be converted. Patches welcome. :)

Rob
