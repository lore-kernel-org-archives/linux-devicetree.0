From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [REGRESSION] "of: Fix premature bootconsole disable with 'stdout-path'"
 breaks console on tty0
Date: Tue, 17 Mar 2015 13:47:27 -0400
Message-ID: <550868AF.8050201@hurleysoftware.com>
References: <55070544.9010908@redhat.com> <550717A0.3060603@hurleysoftware.com> <55071D0C.2050700@redhat.com> <55071F87.1050706@hurleysoftware.com> <5507227D.8020408@redhat.com> <5507332B.5020504@hurleysoftware.com> <55085AFA.7070909@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <55085AFA.7070909@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Jon Masters <jcm@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jon,

On 03/17/2015 12:48 PM, Jon Masters wrote:
> On 03/16/2015 03:46 PM, Peter Hurley wrote:
>> On 03/16/2015 02:35 PM, Hans de Goede wrote:
>>> To be clear about my aarch64 remark, that relates to the behavior o=
f aarch64 acpi using
>>> machines, those will also output to both a serial tty and tty0 when=
 the acpi equivalent
>>> of stdout-path is present and points to a serial tty.
>>
>> I already made comments addressing the unsuitability of the license =
for the
>> aarch64 acpi console;
>=20
> Yes, you did. However, I believe you might have outdated information.
> Have you read the SPCR in the past few months, or are you looking at =
a
> version prior to update that was made in October of 2014?

The version of the Serial Port Console Redirection Table specification
I was referring to is downloadable here:

https://msdn.microsoft.com/en-us/library/windows/hardware/dn639132%28v=3D=
vs.85%29.aspx

That page says Last Updated: October 21, 2014

The cover page of that downloaded specification has this text:

"
Patent Notice. Microsoft provides you certain patent rights for impleme=
ntations of this specification under the terms of Microsoft=E2=80=99s C=
ommunity Promise, available at http://www.microsoft.com/openspecificati=
ons/en/us/programs/community-promise/default.aspx.=20
Version 1.02 =E2=80=94 October 9, 2014
"

>> the proposed SPCR table format is patented by Microsoft and
>> licensed incompatibly with GPLv2.
>=20
> Can you be specific about your concerns? The license has already been
> changed once (I instigated the request that lead to that change to dr=
op
> several pages of terse terms that used to cover the first few pages).=
 I
> have found the Microsoft team extremely responsive and amenable to
> resolving issues, so if you would do us the service of articulating w=
hat
> the concern is, I'll reach back out and get that addressed. I have a
> direct line into their server and legal teams to discuss this issue.

Well, I'm deducing somewhat here because the code that would use the
SPCR table format has not been submitted. So I don't _know_ what licens=
e(s)
you intend to submit with.

But assuming you're using some part of the SPCR specification to implem=
ent
the aarch64 acpi console, then my concern stems from the incompatibilit=
y
between GPL v2 and the Microsoft Community Promise license.

In order for you to submit code to mainline, you (or rather, the submit=
ter)
must certify that you have the legal right to do so. That's spelled out
in Documentation/SubmittingPatches, under 'Developer's Certficate of Or=
igin 1.1'.

So if you and Microsoft have worked out some deal where Microsoft has
licensed the SPCR spec to you under GPL v2 terms, then, great! there is=
 no
problem.

However, if Microsoft is licensing your use of the SPCR specification
under the Microsoft Community Promise and you intend license your submi=
ssion
with the same, then the problem is that the Microsoft Community Promise
License asserts additional limitations which are not compatible with GP=
L v2;
specifically, this text:

[from https://msdn.microsoft.com/en-us/openspecifications/dn646766 ]

"If you file, maintain, or voluntarily participate in a patent infringe=
ment lawsuit
against a Microsoft implementation of any Covered Specification, then t=
his personal
promise does not apply with respect to any Covered Implementation made =
or used by you."


IOW, if I sue Microsoft for patent infringement ste,ming from their use=
 of
Microsoft XML Document Object Model Level 1 Standards Support Document
(which infringes on patents I own), then my embedded aarch64 kernel - w=
hich
merely contains your implementation - is no longer covered under the te=
rms
of the license.

Now, that's just my interpretation of it; maybe the Linux Foundation's
lawyers would see it differently.

Regards,
Peter Hurley
