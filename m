From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 7/8] ARM64: dts: amlogic: Extend GXBaby GIC node
Date: Tue, 1 Mar 2016 22:58:42 +0000
Message-ID: <56D61EA2.8090103@arm.com>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-8-git-send-email-afaerber@suse.de>
 <56D57673.8030702@arm.com> <56D57A7F.5020806@suse.de>
 <56D58E88.2080700@arm.com> <56D61BE3.90505@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D61BE3.90505-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/03/16 22:46, Andreas F=C3=A4rber wrote:
> Am 01.03.2016 um 13:43 schrieb Andre Przywara:
>> On 01/03/16 11:18, Andreas F=C3=A4rber wrote:
>>> Am 01.03.2016 um 12:01 schrieb Andre Przywara:
>>>> On 29/02/16 23:44, Andreas F=C3=A4rber wrote:
>>>>>  			reg =3D <0x0 0xc4301000 0 0x1000>,
>>>>> -			      <0x0 0xc4302000 0 0x0100>;
>>>>> +			      <0x0 0xc4302000 0 0x0100>,
>>>>
>>>> Please use 0x2000 for the size here. I guess this is really the GI=
C-400
>>>> from ARM, and in this case this is the right size, [1] is the refe=
rence
>>>> here. This will enable EOI mode 1 for KVM.
>>>
>>> Will test later.
>>>
>>> Is there any easy way to find out whether or not this is that GIC-4=
00?
>>
>> If you can read registers: GICD_IIDR and PIDRx have some info:
>> http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ddi047=
1b/CHDIFAEE.html
>> So if your U-Boot for instance supports md, a dump of:
>> md.l c4301008 1
>> md.l c4301fd0 30
>>
>> would help to identify the GIC.
>=20
> gxb_p200_v1#md.l c4301008 1
> c4301008: 0200143b                               ;...
> gxb_p200_v1#md.l c4301fd0 30
> c4301fd0: 00000004 00000000 00000000 00000000    ................
> c4301fe0: 00000090 000000b4 0000002b 00000000    ........+.......
> c4301ff0: 0000000d 000000f0 00000005 000000b1    ................
> c4302000: 00000060 000000f0 00000003 000003ff    `...............
> c4302010: 00000000 000000ff 000003ff 00000000    ................
> c4302020: 00000000 00000000 00000000 00000000    ................
> c4302030: 00000000 00000000 00000000 00000000    ................
> c4302040: 00000000 00000000 00000000 00000000    ................
> c4302050: 00000000 00000000 00000000 00000000    ................
> c4302060: 00000000 00000000 00000000 00000000    ................
> c4302070: 00000000 00000000 00000000 00000000    ................
> c4302080: 00000000 00000000 00000000 00000000    ................

Yes, that matches exactly the values from the GIC-400 TRM.

Thanks!
Andre.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
