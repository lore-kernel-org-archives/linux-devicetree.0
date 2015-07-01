From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mfd: 88pm88x: initialize 88pm886/88pm880 base
 support
Date: Wed, 1 Jul 2015 13:20:18 +0100
Message-ID: <20150701122018.GJ3210@x1>
References: <1434098601-3498-1-git-send-email-yizhang@marvell.com>
 <1434098601-3498-3-git-send-email-yizhang@marvell.com>
 <20150625083248.GT15013@x1>
 <20150626124928.GF32687@yizhang>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150626124928.GF32687@yizhang>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhouqiao-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 26 Jun 2015, Yi Zhang wrote:
> On Thu, Jun 25, 2015 at 09:32:48AM +0100, Lee Jones wrote:
> > On Fri, 12 Jun 2015, Yi Zhang wrote:
> >=20
> > > 88pm886 and 88pm880 are combo PMIC chip, which integrates
> > > regulator, onkey, rtc, gpadc, charger, fuelgauge function;
> > >=20
> > > this patch add the basic support for them, adding related resourc=
e, such as
> > > interrupt, preparing for the client-device driver
> > >=20
> > > Signed-off-by: Yi Zhang <yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > > ---
> > >  drivers/mfd/88pm880-table.c     | 173 ++++++++++++
> > >  drivers/mfd/88pm886-table.c     | 173 ++++++++++++
> > >  drivers/mfd/88pm88x-core.c      | 584 ++++++++++++++++++++++++++=
++++++++++++++
> > >  drivers/mfd/88pm88x-i2c.c       | 167 ++++++++++++
> > >  drivers/mfd/88pm88x-irq.c       | 171 ++++++++++++
> > >  drivers/mfd/88pm88x.h           |  51 ++++
>=20
>   Thanks very much for your patience on such a long patch, it is my
>   fault, I will modify according to your precious comments and split
>   them in the next version, thanks very much;

You are welcome.

[...] /* Cut 100's of lines where you were agreeing with me */

In future, please cut all of the lines that you agree with me and only
leave in the useful or contentious items.

> > > +	chip->ldo_page_addr =3D client->addr + 1;
> > > +	chip->power_page_addr =3D client->addr + 1;
> > > +	chip->gpadc_page_addr =3D client->addr + 2;
> > > +	chip->battery_page_addr =3D client->addr + 3;
> > > +	chip->buck_page_addr =3D client->addr + 4;
> > > +	chip->test_page_addr =3D client->addr + 7;
> >=20
> > I have no idea what's going on here, but it's almost certainly not
> > correct.  Instead of separating these out per device have a base
> > address and create DEFINES for each of them.
>=20
>   it is because this PMIC has several i2c address, each has different
>   function, the offset vesus the client->addr is fixed, the client->a=
ddr
>   is 0x30 from device tree, then the gpadc_page_addr is 0x32, that is
>   why I use client->addr + 2;
>=20
>   you mean the DEFINES are better?

I do mean that, yes.  If you don't want supply nodes for each of the
client devices (what is the reason for that?), then just supply the
base address and use DEFINES to obtain the offsets.

[...] /* Lots more 'yes's removed */

> > > +	ret =3D mfd_add_devices(chip->dev, 0, common_cell_devs,
> >=20
> > What does 0 mean?
>=20
>   I should use -1 here, though it _seems_ works..

Please use the pre-allocated platform DEFINEs for them.

[...]

> > > +	for (;;)
> > > +		cpu_relax();
> >=20
> > What's the point of this?
>=20
>   I just would like to busy loop at the end of the power_off callback=
;

Is that when you're meant to do?  Why can't you just return?

[...]

> > > +#define CELL_DEV(_name, _r, _compatible, _id) { \
> > > +	.name =3D _name, \
> > > +	.of_compatible =3D _compatible, \
> > > +	.num_resources =3D ARRAY_SIZE(_r), \
> > > +	.resources =3D _r, \
> > > +	.id =3D _id, \
> > > +	}
> >=20
> > This is not required.
> >=20
> > If you feel the need for an MFD Cell macro, you probably have too m=
any
> > MFD cells and you have done something wrong..
>=20
>   Yes, I should use one MFD to cover regulators and one MFD to cover
>   LEDs, I will remember this lesson; thanks;

That wasn't what I was saying.  Just remove the MACRO and add the
information into the cells like all the other MFD drivers do.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
