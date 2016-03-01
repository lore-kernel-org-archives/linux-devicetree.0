From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM64: dts: Prepare configs for Amlogic Meson GXBaby
Date: Tue, 1 Mar 2016 16:18:45 +0100
Message-ID: <56D5B2D5.9010405@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-4-git-send-email-afaerber@suse.de>
 <56D5AA87.7020401@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D5AA87.7020401-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 01.03.2016 um 15:43 schrieb Sudeep Holla:
> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>> +    psci {
>> +        compatible =3D "arm,psci";
>=20
> Any particular reason why PSCI v0.2 or above is not supported on this
> platform. PSCI v0.1 is very old now and I assume this platform is
> relatively new.

I am not affiliated with Amlogic or Tronsmart, so I cannot answer why.

>> +        method =3D "smc";
>> +        cpu_suspend =3D <0xc4000001>;
>> +        cpu_off =3D <0x84000002>;
>> +        cpu_on =3D <0xc4000003>;
>> +        migrate =3D <0xc4000005>;
>=20
> Atleast the functions ids look like v0.2 or above. So check if it's
> actually v0.2 or above

If you let me know how! Just change the compatible string to -0.2 and
wait for some big boom or watch out for any misbehavior in particular?
Are there any memory locations to check the version or something visibl=
e
in U-Boot source code indicating it?

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
