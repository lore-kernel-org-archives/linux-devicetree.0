From: Jon Masters <jcm@redhat.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Wed, 18 Mar 2015 18:46:20 -0400
Message-ID: <550A003C.4040100@redhat.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com> <5507332B.5020504@hurleysoftware.com> <55085AFA.7070909@redhat.com> <550868AF.8050201@hurleysoftware.com> <5508C327.9020108@redhat.com> <550976EE.4020500@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <550976EE.4020500@hurleysoftware.com>
Sender: stable-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 03/18/2015 09:00 AM, Peter Hurley wrote:
> On 03/17/2015 08:13 PM, Jon Masters wrote:

>>>> Can you be specific about your concerns? The license has already been
>>>> changed once (I instigated the request that lead to that change to drop
>>>> several pages of terse terms that used to cover the first few pages). I
>>>> have found the Microsoft team extremely responsive and amenable to
>>>> resolving issues, so if you would do us the service of articulating what
>>>> the concern is, I'll reach back out and get that addressed. I have a
>>>> direct line into their server and legal teams to discuss this issue.
>>>
>>> Well, I'm deducing somewhat here because the code that would use the
>>> SPCR table format has not been submitted. So I don't _know_ what license(s)
>>> you intend to submit with.
>>
>> Fair enough. I wrote an initial quick and dirty implementation of SPCR
>> parsing which I handed off to a colleague to cleanup. They are indeed
>> planning such a submission. So such an implementation does in fact exist
>> and there is an intent to submit.
> 
> I assumed that because I received no reply to my first email that this
> effort had been abandoned, so I didn't bother to raise the technical
> issues that plague the devicetree hack.

I apologize for that. These patches are currently being developed
against an internal tree and we'll get them posted for review.

>>> So if you and Microsoft have worked out some deal where Microsoft has
>>> licensed the SPCR spec to you under GPL v2 terms, then, great! there is no
>>> problem.
>>
>> I am willing to assist in brokering a discussion on this. But first we
>> should ascertain what is necessary here and articulate that succinctly.
> 
> The kernel source is licensed under GPL v2 (see ./COPYING), so contributions
> are expected to be licensed under compatible terms.

Just a sidenote, that this is a data structure, not code. There are
plenty of other specifications and standards that the kernel uses that
are licensed under a variety of terms. The specific issue seems to be
the potential for conflict over the patent language in that document as
possibly pertaining to implementations, not the specific license of the
document per se. I'll ping a few and get a conversation going.

Jon.
