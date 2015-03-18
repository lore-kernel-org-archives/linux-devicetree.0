From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Wed, 18 Mar 2015 09:00:30 -0400
Message-ID: <550976EE.4020500@hurleysoftware.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com> <5507332B.5020504@hurleysoftware.com> <55085AFA.7070909@redhat.com> <550868AF.8050201@hurleysoftware.com> <5508C327.9020108@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <5508C327.9020108@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Jon Masters <jcm@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/17/2015 08:13 PM, Jon Masters wrote:
> Hi Peter,
> 
> On 03/17/2015 01:47 PM, Peter Hurley wrote:
> 
>> On 03/17/2015 12:48 PM, Jon Masters wrote:
>>> On 03/16/2015 03:46 PM, Peter Hurley wrote:
>>>> On 03/16/2015 02:35 PM, Hans de Goede wrote:
>>>>> To be clear about my aarch64 remark, that relates to the behavior of aarch64 acpi using
>>>>> machines, those will also output to both a serial tty and tty0 when the acpi equivalent
>>>>> of stdout-path is present and points to a serial tty.
>>>>
>>>> I already made comments addressing the unsuitability of the license for the
>>>> aarch64 acpi console;
>>>
>>> Yes, you did. However, I believe you might have outdated information.
>>> Have you read the SPCR in the past few months, or are you looking at a
>>> version prior to update that was made in October of 2014?
>>
>> The version of the Serial Port Console Redirection Table specification
>> I was referring to is downloadable here:
>>
>> https://msdn.microsoft.com/en-us/library/windows/hardware/dn639132%28v=vs.85%29.aspx
>>
>> That page says Last Updated: October 21, 2014
> 
> Ok. You've got the most recent version :) Let me predicate the following
> with the assertion that I am not a lawyer and I am not offering legal
> advice. But I have worked with Microsoft (and many other large hardware
> and software vendors) for some time on topics related to standardization
> of ARM and I am offering to reach back out to them to resolve any
> legitimate concerns arising here. The thing we need to ascertain is
> whether there is a legitimate concern.
> 
>>> Can you be specific about your concerns? The license has already been
>>> changed once (I instigated the request that lead to that change to drop
>>> several pages of terse terms that used to cover the first few pages). I
>>> have found the Microsoft team extremely responsive and amenable to
>>> resolving issues, so if you would do us the service of articulating what
>>> the concern is, I'll reach back out and get that addressed. I have a
>>> direct line into their server and legal teams to discuss this issue.
>>
>> Well, I'm deducing somewhat here because the code that would use the
>> SPCR table format has not been submitted. So I don't _know_ what license(s)
>> you intend to submit with.
> 
> Fair enough. I wrote an initial quick and dirty implementation of SPCR
> parsing which I handed off to a colleague to cleanup. They are indeed
> planning such a submission. So such an implementation does in fact exist
> and there is an intent to submit.

I assumed that because I received no reply to my first email that this
effort had been abandoned, so I didn't bother to raise the technical
issues that plague the devicetree hack.


> Ultimately, ACPI based ARM systems
> (and even x86 ones) will be better off for supporting SPCR. While not
> required, it does obviate the need for both "console=" and "earlycon="
> kernel command line parameters, and thus improves end user experience by
> making console setup automatic.

Sure; there are several platforms/arches that already do this from proms.

> We decided to include SPCR in the SBBR
> rather than writing a new table on the understanding that writing a new
> table was otherwise the default, and a wasted effort when such a
> specification already existed. The concern you raise was anticipated,
> and the changes mentioned were already made. I'm sure we'll be able to
> ask for additional clarification and changes also.
> 
>> So if you and Microsoft have worked out some deal where Microsoft has
>> licensed the SPCR spec to you under GPL v2 terms, then, great! there is no
>> problem.
> 
> I am willing to assist in brokering a discussion on this. But first we
> should ascertain what is necessary here and articulate that succinctly.

The kernel source is licensed under GPL v2 (see ./COPYING), so contributions
are expected to be licensed under compatible terms.

Patent retaliation provisions are not compatible with GPL v2, because
those provisions assert limitations that don't exist in GPL v2.
For example, the Apache 2.0 license and the original Eclipse 1.0 license
both have patent retaliation provisions that make them incompatible
with GPL v2.

The Free Software Foundation maintains a list of free and non-free software
licenses at http://www.gnu.org/philosophy/license-list.html with
commentary on each regarding their compatibility and provisions.
FSF also maintains a licensing and compliance lab which you can contact
at licensing@fsf.org

The new(er) Microsoft Open Specification licenses are not reviewed on
that page; contacting FSF licensing is probably the best next step.

> <snip>
> 
>> Now, that's just my interpretation of it; maybe the Linux Foundation's
>> lawyers would see it differently.
> 
> Who ultimately is going to make the legal call on this one? In other
> words, would an opinion from LF be the best thing to pursue? I can reach
> out and connect a few people off-list for some conversation.

Any license outside the typical free-software licenses like GPL v2, MIT,
public domain statements, etc. will face an uphill battle at submission
time.

That said, there's no harm done in submitting the work and addressing
these issues at that time. Either it will be accepted or it won't with
an explanation of why not.

Regards,
Peter Hurley
