From: liviu.dudau-5wv7dgnIgG8@public.gmane.org
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Wed, 13 Jan 2016 10:09:11 +0000
Message-ID: <20160113100911.GU13633@e106497-lin.cambridge.arm.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <5694C6A4.8060308@huawei.com>
 <20160112101418.GO13633@e106497-lin.cambridge.arm.com>
 <4052627.BRvFkUij6q@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4052627.BRvFkUij6q@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rongrong Zou <zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 11:54:59PM +0100, Arnd Bergmann wrote:
> On Tuesday 12 January 2016 10:14:18 liviu.dudau-5wv7dgnIgG8@public.gmane.org wrote:
> >=20
> > OK, looking at of_translate_one() comments it looks like a missing =
"ranges" property is
> > only accepted on PowerPC. I suggest you have an empty "ranges" prop=
erty in your isa
> > parent node, that will signal to the OF parsing code that the mappi=
ng is 1:1. Then have
> > the IPMI node use the reg =3D <0x0 0xe4 4>; property values instead=
 of reg =3D <0x1 0xe4 4>;
> >=20
> >=20
>=20
> A missing ranges property means that there is no translation, while a=
n
> empty ranges means a 1:1 translation to the parent bus.
>=20
> We really want the former here, as I/O port addresses are not mapped =
into
> the MMIO space of the parent bus.

Agree. However of_translate_one()'s behaviour doesn't match our expecta=
tions and I have no
useful suggestions on what the right behaviour should be.

Best regards,
Liviu

>=20
> 	Arnd
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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
