From: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mfd: 88pm88x: initialize 88pm886/88pm880 base
 support
Date: Thu, 9 Jul 2015 19:52:43 +0800
Message-ID: <20150709115243.GA23453@yizhang>
References: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
 <1434098601-3498-3-git-send-email-yizhang@marvell.com>
 <20150625083248.GT15013@x1>
 <20150626124928.GF32687@yizhang>
 <20150701122018.GJ3210@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150701122018.GJ3210@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 01, 2015 at 01:20:18PM +0100, Lee Jones wrote:
> On Fri, 26 Jun 2015, Yi Zhang wrote:
> > On Thu, Jun 25, 2015 at 09:32:48AM +0100, Lee Jones wrote:
> > > On Fri, 12 Jun 2015, Yi Zhang wrote:
> > >=20
> > > > 88pm886 and 88pm880 are combo PMIC chip, which integrates
> > > > regulator, onkey, rtc, gpadc, charger, fuelgauge function;
> > > >=20
> > > > this patch add the basic support for them, adding related resou=
rce, such as
> > > > interrupt, preparing for the client-device driver
> > > >=20
> > > > Signed-off-by: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > > > ---
> > > >  drivers/mfd/88pm880-table.c     | 173 ++++++++++++
> > > >  drivers/mfd/88pm886-table.c     | 173 ++++++++++++
> > > >  drivers/mfd/88pm88x-core.c      | 584 ++++++++++++++++++++++++=
++++++++++++++++
> > > >  drivers/mfd/88pm88x-i2c.c       | 167 ++++++++++++
> > > >  drivers/mfd/88pm88x-irq.c       | 171 ++++++++++++
> > > >  drivers/mfd/88pm88x.h           |  51 ++++
> >=20
> >   Thanks very much for your patience on such a long patch, it is my
> >   fault, I will modify according to your precious comments and spli=
t
> >   them in the next version, thanks very much;
>=20
> You are welcome.
>=20
> [...] /* Cut 100's of lines where you were agreeing with me */
>=20
> In future, please cut all of the lines that you agree with me and onl=
y
> leave in the useful or contentious items.

  Thanks, I need to pay attention to the etiquette, reading such a long
  mail is absolutly not a good experience, my fault, sorry;
>=20
> > > > +	chip->ldo_page_addr =3D client->addr + 1;
> > > > +	chip->power_page_addr =3D client->addr + 1;
> > > > +	chip->gpadc_page_addr =3D client->addr + 2;
> > > > +	chip->battery_page_addr =3D client->addr + 3;
> > > > +	chip->buck_page_addr =3D client->addr + 4;
> > > > +	chip->test_page_addr =3D client->addr + 7;
> > >=20
> > > I have no idea what's going on here, but it's almost certainly no=
t
> > > correct.  Instead of separating these out per device have a base
> > > address and create DEFINES for each of them.
> >=20
> >   it is because this PMIC has several i2c address, each has differe=
nt
> >   function, the offset vesus the client->addr is fixed, the client-=
>addr
> >   is 0x30 from device tree, then the gpadc_page_addr is 0x32, that =
is
> >   why I use client->addr + 2;
> >=20
> >   you mean the DEFINES are better?
>=20
> I do mean that, yes.  If you don't want supply nodes for each of the
> client devices (what is the reason for that?), then just supply the
> base address and use DEFINES to obtain the offsets.

  I got your point.
>=20
> [...] /* Lots more 'yes's removed */
>=20
> > > > +	ret =3D mfd_add_devices(chip->dev, 0, common_cell_devs,
> > >=20
> > > What does 0 mean?
> >=20
> >   I should use -1 here, though it _seems_ works..
>=20
> Please use the pre-allocated platform DEFINEs for them.
 =20
  Clear now;
>=20
> [...]
>=20
> > > > +	for (;;)
> > > > +		cpu_relax();
> > >=20
> > > What's the point of this?
> >=20
> >   I just would like to busy loop at the end of the power_off callba=
ck;
>=20
> Is that when you're meant to do?  Why can't you just return?

  Just return is a good idea, my intention is trying to invoke the
  user's attention that the power off fails..
>=20
> [...]
>=20
> > > > +#define CELL_DEV(_name, _r, _compatible, _id) { \
> > > > +	.name =3D _name, \
> > > > +	.of_compatible =3D _compatible, \
> > > > +	.num_resources =3D ARRAY_SIZE(_r), \
> > > > +	.resources =3D _r, \
> > > > +	.id =3D _id, \
> > > > +	}
> > >=20
> > > This is not required.
> > >=20
> > > If you feel the need for an MFD Cell macro, you probably have too=
 many
> > > MFD cells and you have done something wrong..
> >=20
> >   Yes, I should use one MFD to cover regulators and one MFD to cove=
r
> >   LEDs, I will remember this lesson; thanks;
>=20
> That wasn't what I was saying.  Just remove the MACRO and add the
> information into the cells like all the other MFD drivers do.

  Got your point, I will remove them and clean up the regulator part;
  thanks;
>=20
> [...]
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
