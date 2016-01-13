From: liviu.dudau-5wv7dgnIgG8@public.gmane.org
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Wed, 13 Jan 2016 10:10:28 +0000
Message-ID: <20160113101028.GV13633@e106497-lin.cambridge.arm.com>
References: <568912EE.9030009@huawei.com>
 <5694E9FF.6030904@huawei.com>
 <20160112151335.GS13633@e106497-lin.cambridge.arm.com>
 <4731036.9QlepWb5cE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4731036.9QlepWb5cE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rongrong Zou <zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 11:52:48PM +0100, Arnd Bergmann wrote:
> On Tuesday 12 January 2016 15:13:35 liviu.dudau-5wv7dgnIgG8@public.gmane.org wrote:
> > > int of_address_to_resource(struct device_node *dev, int index,
> > >                          struct resource *r)
> > > {
> > >       ...
> > >       /* flags can be get here, without ranges property reqired.
> > >        * if the reg =3D <0x0 0xe4 4>, I can get flag of IORESOURC=
E_MEM,
> > >        * if the reg =3D <0x1 0xe4 4>, I can get flag of IORESOURC=
E_IO,
> >=20
> > That is strange, the parent node has #address-cells =3D <2> so the =
first two numbers should be part
> > of the address and not influence the flags. Can you add some debugg=
ing in of_get_address() and
> > try to figure out what bus is used in  *flags =3D bus->get_flags(pr=
op) ?
> >=20
> >=20
>=20
> This is the standard ISA binding. The first cell is the address space
> (IO or MEM), the second cell is the address within that space. This
> is similar to how PCI works.

OK, but from DT point of view and given the parent's #address-cells =3D=
 <2> and #size-cells =3D <1>
should the reg not be something like reg =3D <0x1 0x0 0xe4 4> ?

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
