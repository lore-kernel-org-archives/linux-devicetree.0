From: liviu.dudau@arm.com
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Wed, 13 Jan 2016 11:25:59 +0000
Message-ID: <20160113112559.GX13633@e106497-lin.cambridge.arm.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <5694C6A4.8060308@huawei.com>
 <20160112101418.GO13633@e106497-lin.cambridge.arm.com>
 <4052627.BRvFkUij6q@wuerfel>
 <20160113100911.GU13633@e106497-lin.cambridge.arm.com>
 <56962FC2.1070101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56962FC2.1070101@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rongrong Zou <zourongrong@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rongrong Zou <zourongrong@huawei.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Corey Minyard <minyard@acm.org>, gregkh@linuxfoundation.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linuxarm@huawei.com, benh@kernel.crashing.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2016 at 07:06:42PM +0800, Rongrong Zou wrote:
> On 2016/1/13 18:09, liviu.dudau@arm.com wrote:
> >On Tue, Jan 12, 2016 at 11:54:59PM +0100, Arnd Bergmann wrote:
> >>On Tuesday 12 January 2016 10:14:18 liviu.dudau@arm.com wrote:
> >>>
> >>>OK, looking at of_translate_one() comments it looks like a missing=
 "ranges" property is
> >>>only accepted on PowerPC. I suggest you have an empty "ranges" pro=
perty in your isa
> >>>parent node, that will signal to the OF parsing code that the mapp=
ing is 1:1. Then have
> >>>the IPMI node use the reg =3D <0x0 0xe4 4>; property values instea=
d of reg =3D <0x1 0xe4 4>;
> >>>
> >>>
> >>
> >>A missing ranges property means that there is no translation, while=
 an
> >>empty ranges means a 1:1 translation to the parent bus.
> >>
> >>We really want the former here, as I/O port addresses are not mappe=
d into
> >>the MMIO space of the parent bus.
> >
> >Agree. However of_translate_one()'s behaviour doesn't match our expe=
ctations and I have no
> >useful suggestions on what the right behaviour should be.
> >
>=20
> I had tried to modify the drivers/of/address.c to address this proble=
m, but it looks
> not so general. I'm not sure you have seen this: https://lkml.org/lkm=
l/2016/1/10/89 .

Yes, I have seen it. Based on Arnd's suggestion, it is probably the way=
 to go.

Best regards,
Liviu

>=20
> Regards,
> Rongrong
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
