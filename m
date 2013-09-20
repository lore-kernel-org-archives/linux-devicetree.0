From: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] media: i2c: adv7343: fix the DT binding properties
Date: Fri, 20 Sep 2013 13:41:42 +0530
Message-ID: <CA+V-a8s3PYr7qem6m8au0E7N2Xb_gD37_8uLcdXZjeHppBaC6g@mail.gmail.com>
References: <1379073471-7244-1-git-send-email-prabhakar.csengg@gmail.com>
 <523395DC.5080009@wwwdotorg.org> <CA+V-a8sVyJ1TrTSiaj8vpaD+f_qJ5Hp287E3HuHJ_pRzzmdAvg@mail.gmail.com>
 <523730A8.9060201@wwwdotorg.org> <CA+V-a8vY-qsdUoUUH=3HOg-UAZZPujOLPHFC_udNWFtksgzRRA@mail.gmail.com>
 <523B554A.2030701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523B554A.2030701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, DLOS <davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>, LMML <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, LDOC <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

On Fri, Sep 20, 2013 at 1:19 AM, Sylwester Nawrocki
<sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/19/2013 06:06 PM, Prabhakar Lad wrote:
>>
>> On Mon, Sep 16, 2013 at 9:54 PM, Stephen Warren<swarren-3lzwWm7+WeqIh2JisoIxyg@public.gmane.org=
g>
>> wrote:
>>>
>>> On 09/13/2013 11:23 PM, Prabhakar Lad wrote:
>>>>
>>>> On Sat, Sep 14, 2013 at 4:16 AM, Stephen Warren<swarren@wwwdotorg.=
org>
>>>> wrote:
>>>>>
>>>>> On 09/13/2013 05:57 AM, Prabhakar Lad wrote:
>>>>>>
>>>>>> From: "Lad, Prabhakar"<prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>>
>>>>>> This patch fixes the DT binding properties of adv7343 decoder.
>>>>>> The pdata which was being read from the DT property, is removed
>>>>>> as this can done internally in the driver using cable detection
>>>>>> register.
>>>>>>
>>>>>> This patch also removes the pdata of ADV7343 which was passed fr=
om
>>>>>> DA850 machine.
>>>>>
>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7343=
=2Etxt
>>>>>> b/Documentation/devicetree/bindings/media/i2c/adv7343.txt
>>>>>
>>>>>
>>>>>>   Required Properties :
>>>>>>   - compatible: Must be "adi,adv7343"
>>>>>> +- reg: I2C device address.
>>>>>> +- vddio-supply: I/O voltage supply.
>>>>>> +- vddcore-supply: core voltage supply.
>>>>>> +- vaa-supply: Analog power supply.
>>>>>> +- pvdd-supply: PLL power supply.
>>>>>
>>>>>
>>>>> Old DTs won't contain those properties. This breaks the DT ABI if=
 those
>>>>> properties are required. Is that acceptable?
>>>>
>>>>
>>>> As of now adv7343 via DT binding is not enabled in any platforms
>>>> so this wont break any DT ABI.
>>>
>>>
>>> Well, if the binding has already been written, it technically alrea=
dy is
>>> an ABI. Perhaps the binding can be fixed if it isn't in use yet, bu=
t
>>> this is definitely not the correct approach to DT.
>
>
> The binding got merged for 3.12-rc1 and the intention of this patch w=
as
> to correct that binding. There we some issues like mismatch between n=
ames
> of properties documented and used in the driver.
>
> After Mark's suggestion Prabhakar removed some properties and the pla=
tform
> data usage altogether. IMHO there should be only minimal changes in t=
hat
> "fixup" patch, i.e. no platform data usage should be removed. Perhaps=
 it
> is fine since that's just code removal. I guess it is better to do th=
is
> sort of cleanup for the next kernel release.
>
OK I will, just send out a fix up patch which fixes the mismatch betwee=
n
names for the rc-cycle, and later send out a patch which removes the
platform data usage for next release with proper DT bindings.

> Also I believe the argument of backward compatibility shouldn't reall=
y be
> considered here. The $subject patch is supposed to correct the bindin=
g
> before it becomes and ABI.
>
>
>>>>> If it is, I think we should document that older versions of the b=
inding
>>>>> didn't require those properties, so they may in fact be missing.
>>>>>
>>>>> I note that this patch doesn't actually update the driver to
>>>>> regulator_get() anything. Shouldn't it?
>>>>
>>>>
>>>> As of now the driver isn=92t enabling/accepting the regulators,
>>>> so should I add those in DT properties or not ?
>>>
>>>
>>> The binding should describe the HW, not what the driver does/doesn'=
t yet
>>> do. I wrote the above because it looked like the driver was broken,=
 not
>>> to encourage you to remove properties from the binding.
>>
>> OK
>>
>>> How does the
>>> driver work if it doesn't enable the required regulators though, I
>>> wonder? I suppose the boards this driver has been tested on all mus=
t
>>> used fixed (non-SW-controlled) regulators.
>>>
>> on all the boards on which this decoder is connected the power to it
>> is provided by static circuit and not by regulators, So for this how=
 would
>> you suggest to add the DT nodes for regulators ?
>
>
> I believe the regulator DT properties should be made optional. Since =
some
> (actually all upstream) boards don't bother with software controlled
> regulators. We might have specified them and have defined relevant fi=
xed
> regulator(s) in DT. But I doubt it is sensible, given that it may nev=
er
> happen in practice the regulators are required to be controlled by so=
ftware
> through the regulators API. Such devices can often be put in a low po=
wer
> mode by a write to one of the registers, where their supply current i=
s at
> uA level. Looking at the datasheet ADV7343 has SLEEP_MODE in which it=
s
> typical current consumption is 5 uA.
>
> That said the chip could be supplied from shared voltage regulators a=
nd
> the driver would then have to properly request and enable the regulat=
ors.
>
> Anyway I'm inclined to make the regulator properties optional.
>
I'm OK with making regulator properties as optional, But still it would
change the meaning of what DT is, we know that the VDD/VDD_IO .. etc
pins are required properties (but still making them as optional) :-(

I think there might several devices where this situation may arise so
just thinking of a alternative solution.

say we have property 'software-regulator' which takes true/false(0/1)
If set to true we make the regulators as required property or else we
assume it is handled and ignore it ?


Thanks,
--Prabhakar Lad
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
