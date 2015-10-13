From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Tue, 13 Oct 2015 22:59:40 +0900
Message-ID: <561D0E4C.4010205@samsung.com>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk> <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox> <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1> <20151013121450.GD8805@ck-lbox>
 <20151013135053.GB32409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20151013135053.GB32409@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Lee,

On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 22:50, Lee Jones wrote:
> On Tue, 13 Oct 2015, Charles Keepax wrote:
>=20
>> On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:
>>> On Mon, 12 Oct 2015, Mark Brown wrote:
>>>
>>>> On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrote:
>>>>> On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
>>>>>> On Wed, 07 Oct 2015, Mark Brown wrote:
>>>>
>>>>>>> This all seems pretty much fine to me - the things it is contro=
lling are
>>>>>>> fairly specific to the way the former Wolfson devices do, they =
only
>>>>>>> really make sense with a fairly particular algorithm which isn'=
t widely
>>>>>>> implemented.
>>>>
>>>>>> Is that an Ack?
>>>>
>>>>> I am guessing Mark is slightly hesitant to ack as he probably
>>>>> doesn't want to add reviewing all our jack detection bindings to
>>>>> his already fairly sizable work load and doing so here likely
>>>>> means it will be expected in the future. From talking to people a=
t
>>>
>>> Providing Acks should not (and has not to my knowledge) be a bindin=
g
>>> contract to continue providing Acks.  However, should more bindings=
 be
>>> submitted which appear as though they are related to a particular
>>> maintainer, then sure, you'll be asked for your expert eye again.
>>
>> Its not a binding contract to continue providing them but we are
>> making that a condition of merging any patches, which means I
>> will need to chase Mark for Acks, as it seems the DT maintainers
>> won't have any interest in reviewing/acking these.
>=20
> I've already made it a condition, as I refuse to blindly accept
> unknown bindings.  Taking a sea of bindings I have no knowledge of
> would be a bad-thing(tm).  If these were GPIO bindings, I'd be asking
> Linus for help, likewise if they were I2C, I'd be asking Wolfram.
>=20
>>>> Pretty much (plus generally being busy at ELC-E last week) - if th=
ere's
>>>> specific questions that's one thing but if it's just general reque=
sts to
>>>> look at bindings then it seems like the relevant subsystem maintai=
ners
>>>
>>> This is exactly my point.  I am not the 'relevant subsystem
>>> maintainer' for these properties and subsequently know nothing of
>>> microphone detection, headsets, bias', etc.  These look like Audio
>>> related properties to me (the uninitiated), which is why you were
>>> asked.
>>
>> It would be sensible I guess to define whether I should be
>> including audio people on jack detection patches even if they
>> don't touch audio subsystems. I was treating jack detection
>> as an extcon thing and thus assuming that the extcon maintainer
>> would be sufficient, but perhaps that is an incorrect assumption.
>=20
> Now I know that jack detection is an Extcon thing and Extcon Ack will
> do just nicely.  However, that begs the question; if they are an
> Extcon thing, why aren't they in the Extcon binding document?

As I knew, the arizona-extcon is one device of the MFD devices=20
for WMxxxx series in the driver/mfd/arizona-core.c. So, If arizona-extc=
on
driver needs the some property for dt support, some property should be
included in MFD device tree node. There is no separate device tree node=
 for
arizona-extcon driver.

Thanks,
Chanwoo Choi

>=20
>>>> should have the confidence to review straightfoward device propert=
ies
>>>> like this.
>>>
>>> I don't think these bindings are particularly straightforward.  The
>>> contain many terms which I'm unfamiliar with, and again, to me (the
>>> uninitiated) this looks like way too many bindings just to see if a=
n
>>> audio jack is plugged in or not.
>>
>> I also wish our designers would make less complex hardware sigh.
>>
>> Apologies I didn't mean to cause any offense here, I am just
>> getting a bit concerned about how I can get any DT support for
>> jack detection upstreamed. I am more than happy to fix up any
>> comments anyone has or answer any questions about what things
>> are or why they are required.
>=20
> Hopefully there won't be too many more bindings to come?
>=20
> My issue is that as they are not MFD related, I need some advice from
> my colleagues to whom they are related to.
>=20
>> The jack detection on these chips is fairly complex and there are
>> going to be plenty more patches before we have full support for
>> it in DT. So I think it would be good for everyone if we can
>> agree some process for how to handle this type of patch.
>=20
> Put them in the subsystem where they pertain to -- job done.
>=20
