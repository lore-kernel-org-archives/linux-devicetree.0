From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Wed, 13 Jan 2016 16:53:33 +1100
Message-ID: <1452664413.2403.20.camel@kernel.crashing.org>
References: <568912EE.9030009@huawei.com> <5694E9FF.6030904@huawei.com>
	 <20160112151335.GS13633@e106497-lin.cambridge.arm.com>
	 <4731036.9QlepWb5cE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4731036.9QlepWb5cE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, liviu.dudau-5wv7dgnIgG8@public.gmane.org
Cc: Rongrong Zou <zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-01-12 at 23:52 +0100, Arnd Bergmann wrote:
> On Tuesday 12 January 2016 15:13:35 liviu.dudau-5wv7dgnIgG8@public.gmane.org=C2=A0wrote:
> > > int of_address_to_resource(struct device_node *dev, int index,
> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 struct resource *r)
> > > {
> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* flags can be get here, wit=
hout ranges property reqired.
> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * if the reg =3D <0x0 0=
xe4 4>, I can get flag of
> IORESOURCE_MEM,
> > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * if the reg =3D <0x1 0=
xe4 4>, I can get flag of
> IORESOURCE_IO,
> >=C2=A0
> > That is strange, the parent node has #address-cells =3D <2> so the
> first two numbers should be part
> > of the address and not influence the flags. Can you add some
> debugging in of_get_address() and
> > try to figure out what bus is used in=C2=A0 *flags =3D bus-
> >get_flags(prop) ?
> >=C2=A0
> >=C2=A0
>=20
> This is the standard ISA binding. The first cell is the address space
> (IO or MEM), the second cell is the address within that space. This
> is similar to how PCI works.

Picking up that mid-way, I have LPC busses on power and am using a
similar binding. I'll try to grab some examples and review the
document tomorrow (only just noticed it while unpiling emails post-
vacation).

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
