From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Tue, 13 Oct 2015 23:09:42 +0900
Message-ID: <561D10A6.7040504@samsung.com>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk> <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox> <20151012134309.GE1542@sirena.org.uk>
 <20151013080218.GV17172@x1> <20151013121450.GD8805@ck-lbox>
 <20151013135053.GB32409@x1> <561D0E4C.4010205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <561D0E4C.4010205-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 22:59, Chanwoo Choi wrote:
> Hi Lee,
>=20
> On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 22:50, Lee Jones wrote:
>> On Tue, 13 Oct 2015, Charles Keepax wrote:
>>
>>> On Tue, Oct 13, 2015 at 09:02:18AM +0100, Lee Jones wrote:
>>>> On Mon, 12 Oct 2015, Mark Brown wrote:
>>>>
>>>>> On Mon, Oct 12, 2015 at 09:45:54AM +0100, Charles Keepax wrote:
>>>>>> On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
>>>>>>> On Wed, 07 Oct 2015, Mark Brown wrote:
>>>>>
>>>>>>>> This all seems pretty much fine to me - the things it is contr=
olling are
>>>>>>>> fairly specific to the way the former Wolfson devices do, they=
 only
>>>>>>>> really make sense with a fairly particular algorithm which isn=
't widely
>>>>>>>> implemented.
>>>>>
>>>>>>> Is that an Ack?
>>>>>
>>>>>> I am guessing Mark is slightly hesitant to ack as he probably
>>>>>> doesn't want to add reviewing all our jack detection bindings to
>>>>>> his already fairly sizable work load and doing so here likely
>>>>>> means it will be expected in the future. From talking to people =
at
>>>>
>>>> Providing Acks should not (and has not to my knowledge) be a bindi=
ng
>>>> contract to continue providing Acks.  However, should more binding=
s be
>>>> submitted which appear as though they are related to a particular
>>>> maintainer, then sure, you'll be asked for your expert eye again.
>>>
>>> Its not a binding contract to continue providing them but we are
>>> making that a condition of merging any patches, which means I
>>> will need to chase Mark for Acks, as it seems the DT maintainers
>>> won't have any interest in reviewing/acking these.
>>
>> I've already made it a condition, as I refuse to blindly accept
>> unknown bindings.  Taking a sea of bindings I have no knowledge of
>> would be a bad-thing(tm).  If these were GPIO bindings, I'd be askin=
g
>> Linus for help, likewise if they were I2C, I'd be asking Wolfram.
>>
>>>>> Pretty much (plus generally being busy at ELC-E last week) - if t=
here's
>>>>> specific questions that's one thing but if it's just general requ=
ests to
>>>>> look at bindings then it seems like the relevant subsystem mainta=
iners
>>>>
>>>> This is exactly my point.  I am not the 'relevant subsystem
>>>> maintainer' for these properties and subsequently know nothing of
>>>> microphone detection, headsets, bias', etc.  These look like Audio
>>>> related properties to me (the uninitiated), which is why you were
>>>> asked.
>>>
>>> It would be sensible I guess to define whether I should be
>>> including audio people on jack detection patches even if they
>>> don't touch audio subsystems. I was treating jack detection
>>> as an extcon thing and thus assuming that the extcon maintainer
>>> would be sufficient, but perhaps that is an incorrect assumption.
>>
>> Now I know that jack detection is an Extcon thing and Extcon Ack wil=
l
>> do just nicely.  However, that begs the question; if they are an
>> Extcon thing, why aren't they in the Extcon binding document?
>=20
> As I knew, the arizona-extcon is one device of the MFD devices=20
> for WMxxxx series in the driver/mfd/arizona-core.c. So, If arizona-ex=
tcon
> driver needs the some property for dt support, some property should b=
e
> included in MFD device tree node. There is no separate device tree no=
de for
> arizona-extcon driver.

If creating the separate extcon doc for extcon-arizona.c driver, it is =
possible
to make the child device tree node which is located at the below of ari=
zona MFD
device tree node.

I agree about Lee's opinion to make the separate the Extcon doc for ext=
con-arizona.c.

[snip]

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
