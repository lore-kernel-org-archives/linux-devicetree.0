From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM64: dts: Prepare configs for Amlogic Meson GXBaby
Date: Tue, 1 Mar 2016 16:19:37 +0000
Message-ID: <56D5C119.8070609@arm.com>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-4-git-send-email-afaerber@suse.de>
 <56D5AA87.7020401@arm.com> <56D5B2D5.9010405@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D5B2D5.9010405-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 01/03/16 15:18, Andreas F=C3=A4rber wrote:
> Am 01.03.2016 um 15:43 schrieb Sudeep Holla:
>> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>>> +    psci {
>>> +        compatible =3D "arm,psci";
>>
>> Any particular reason why PSCI v0.2 or above is not supported on thi=
s
>> platform. PSCI v0.1 is very old now and I assume this platform is
>> relatively new.
>
> I am not affiliated with Amlogic or Tronsmart, so I cannot answer why=
=2E
>

OK

>>> +        method =3D "smc";
>>> +        cpu_suspend =3D <0xc4000001>;
>>> +        cpu_off =3D <0x84000002>;
>>> +        cpu_on =3D <0xc4000003>;
>>> +        migrate =3D <0xc4000005>;
>>
>> Atleast the functions ids look like v0.2 or above. So check if it's
>> actually v0.2 or above
>
> If you let me know how! Just change the compatible string to -0.2 and
> wait for some big boom or watch out for any misbehavior in particular=
?

Not exactly. Just having -0.2 in compatible will issue PSCI_VERSION
which *should be* available in v0.2 and above. If you get error there,
then we can *assume* it's PSCI v0.1. Hopefully it be sanely return
error if that's not implemented.

Note that we can only assume, as it might be v0.2 but missed to
implement PSCI_VERSION which is mandatory though.

> Are there any memory locations to check the version or something visi=
ble
> in U-Boot source code indicating it?
>

Ah so, PSCI is implemented in U-Boot on this platform ? If so, and if
the source is available it should not be that hard to figure that out.

--=20
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
