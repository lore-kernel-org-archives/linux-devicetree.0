From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Thu, 19 Feb 2015 08:51:16 -0800
Message-ID: <54E61484.1060209@gmail.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <54E54586.5070602@gmail.com> <23825C6A-7FF1-4D06-8802-F6964F71B97C@konsulko.com> <54E61200.4010002@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54E61200.4010002-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2/19/2015 8:40 AM, Frank Rowand wrote:
> On 2/19/2015 6:41 AM, Pantelis Antoniou wrote:
>> Hi Frank,
>>
>>> On Feb 19, 2015, at 04:08 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
>>>
>>> On 2/18/2015 6:59 AM, Pantelis Antoniou wrote:
>>>> Implement a method of applying DT quirks early in the boot sequenc=
e.
>>>>
>>>> A DT quirk is a subtree of the boot DT that can be applied to
>>>> a target in the base DT resulting in a modification of the live
>>>> tree. The format of the quirk nodes is that of a device tree overl=
ay.
>>>
>>> The use of the word "quirk" is a different mental model for me than=
 what
>>> this patch series appears to be addressing.  I would suggest totall=
y
>>> removing the word "quirk" from this proposal to avoid confusing the
>>> mental models of future generations of kernel folks.
>>>
>>
>> Naming things is hard to do. Suggestions?
>=20
> You are inviting me to bikeshed.  I'll leave that to you.
>=20
>>
>>> What this patch series seems to be proposing is a method to apply D=
T
>>> overlays as soon as unflatten_device_tree() completes.  In other wo=
rds,
>>> making the device tree a dynamic object, that is partially defined =
by
>>> the kernel during boot.  Well, to be fair, the kernel chooses among
>>> several possible alternatives encoded in the DT blob.  So the devic=
e
>>> tree is no longer a static object that describes the hardware of th=
e
>>> system.  It may not sound like a big deal, but it seems to me to be
>>> a fundamental shift in what the device tree blob is.  Something tha=
t
>>> should be thought about carefully and not just applied as a patch t=
o
>>> solve a point problem.
>>>
>>
>> There is a fundamental shift going on about what hardware is. It is =
nowhere
>> as static as it used to be. It is time for the kernel to keep up.
>=20
> Run time overlays do that.
>=20
> The problem you seem to be dealing with here is that you want a singl=
e
> DT blob that can be installed on many different _physical_ boards.
>=20
>=20
>>
>>> The stated use of this proposal is to create dynamic DT blobs that =
can
>>> describe many similar variants of a given system instead of creatin=
g
>>> unique DT blobs for each different system.
>>>
>>
>> Yes.
>>
>>> I obviously have not thought through the architectural implications=
 yet,
>>> but just a quick example.  One of the issues we have been trying to=
 fix
>>> is device tree validation.  The not yet existent (except as a few p=
roof
>>> of concept attempts) validator would need to validate a device tree
>>> for each dynamic variant.  Probably not a big deal, but an example =
of
>>> the ripple effects this conceptual change implies.
>>>
>>
>> I don=92t see what the big problem with the validator is. The =91qui=
rk=92
>> are easily identified by the presence of the __overlay__ nodes and
>> the validator can apply each overlay and perform the validation chec=
k=20
>> at each resultant tree.
>=20
> I said "not a big deal".  I was trying to make people think about the
> bigger picture.  Defending that this is a non-issue for the validator
> is totally missing my point.  Step back and think architecturally
> about the big picture.  I do _not_ know if this is a problem, but
> they will be ripples from this proposal.

oops:  there will be ripples from this proposal.

>=20
>> =20
>>> A second function that this patch is proposing is a method to enabl=
e
>>> or disable devices via command line options.  If I understand
>>> correctly, this is meant to solve a problem with run time overlays
>>> that require disabling a device previously enabled by the DT blob.
>>> If so, it seems like it could easily be implemented in a simpler
>>> generic way than in the board specific code in this patch series.
>>>
>>
>> Disabling a device is the most common case, but other options are de=
sired
>> too. For instance changing OPPs by a command line option, etc.
>=20
> The device tree is supposed to describe what the hardware is.  Why wo=
uld
> you want a command line option to change what OPPs are possible for t=
he
> hardware?
>=20
>>
>>> I share the concerns that Mark Rutland has expressed in his comment=
s
>>> about this series.
>>>
>>> < snip >
>>>
>>> I have read through the patches and will have comments on the code
>>> later if this proposal is seen as a good idea.
>>>
>>
>> OK
>>
>>> -Frank
>>
>> Regards
>>
>> =97 Pantelis
>>
>>
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
