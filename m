From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 16/23] MAINTAINERS: Add file patterns for powerpc
 device tree bindings
Date: Wed, 15 Mar 2017 10:36:44 +0100
Message-ID: <CAMuHMdWEe4DvVMTHF1QoO-rB3zFjTsYydAGeCdqvAmFok3O6DA@mail.gmail.com>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
 <1489324627-19126-17-git-send-email-geert@linux-m68k.org> <87a88nv1b2.fsf@concordia.ellerman.id.au>
 <CAMuHMdX95zwQUe8XyPpKvv6zsHG+c1Ke=eFBZCt+fNUxgP5O2g@mail.gmail.com> <87d1dilwdu.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87d1dilwdu.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Qiang Zhao <qiang.zhao-3arQi8VN3Tc@public.gmane.org>, Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>, york.sun-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Michael,

On Wed, Mar 15, 2017 at 10:30 AM, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wro=
te:
> Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> writes:
>> On Wed, Mar 15, 2017 at 1:19 AM, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> w=
rote:
>>> Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> writes:
>>>> Submitters of device tree binding documentation may forget to CC
>>>> the subsystem maintainer if this is missing.
>>>>
>>>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>>>> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>>>> Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
>>>> Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
>>>> Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>>>> ---
>>>> Please apply this patch directly if you want to be involved in device
>>>> tree binding documentation for your subsystem.
>>>>
>>>> v2:
>>>>   - Rebased on top of commit a42715830d552d7c ("MAINTAINERS: Remove
>>>>     powerpc's "opal" pattern match), which just added "powerpc/opal",
>>>>     while obviously the whole "powerpc" hierarchy is of interest.
>>>>
>>>> Impact on next-20170310:
>>>
>>> Actual diff ignoring ordering etc:
>>>
>>>  +Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> (supporter:LINUX FO=
R POWERPC (32-BIT AND 64-BIT))
>>>  +Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org> (supporter:LINUX FOR POWERPC (32-BI=
T AND 64-BIT))
>>>  +linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org (open list:LINUX FOR POWERPC (32-BIT AN=
D 64-BIT))
>>>  -Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org> (commit_signer:5/11=3D45%)
>>>  -Zhao Qiang <qiang.zhao-3arQi8VN3Tc@public.gmane.org> (commit_signer:4/11=3D36%,authored:4/=
11=3D36%)
>>>  -Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> (commit_signer:1/11=3D9=
%)
>>>  -yangbo lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org> (authored:1/11=3D9%)
>>>  -"Otto Kek=C3=A4l=C3=A4inen" <otto-Gh1NM5ZPXYb1KXRcyAk9cg@public.gmane.org> (authored:1/11=3D9%)
>>>  -Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> (authored:1/11=3D9%=
)
>>>  -York Sun <york.sun-3arQi8VN3Tc@public.gmane.org> (authored:1/11=3D9%)
>>>
>>> Which looks bad as all the NXP folks get dropped, but they should be
>>> reading linuxppc-dev. So I think I'll merge this, unless anyone
>>> disagrees.
>>
>> They got dropped because in the absence of a maintainer entry, the
>> last committers are listed. If they need to be listed, I can send patche=
s to add
>> more specific entries for 4xx and fsl DT bindings, like:
>
> This is one is probably worth doing:
>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0f1c2f96c99aa936..40b392a4f399adbe 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5266,6 +5266,7 @@ M:        Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
>>  L:     linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>>  L:     linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>  S:     Maintained
>> +F:     Documentation/devicetree/bindings/powerpc/fsl/
>>  F:     drivers/soc/fsl/
>>  F:     include/linux/fsl/
>
> I'll fold it in before applying?

Fine (less work) for me! Thanks!

> But I wouldn't bother with 4xx, just falling back to linuxppc-dev is
> fine for that.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
