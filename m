From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH 2/3] sparc: make driver/of/pdt no longer sparc-specific
Date: Mon, 9 Aug 2010 01:32:45 -0400
Message-ID: <20100809013245.1cefb9bf@dev.queued.net>
References: <20100808231116.21c7d6f3@dev.queued.net>
	<AANLkTimG7u5eXWSn5VznKfuFcFD+evTzo1_QpAFmCdpL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <AANLkTimG7u5eXWSn5VznKfuFcFD+evTzo1_QpAFmCdpL@mail.gmail.com>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 8 Aug 2010 23:12:21 -0600
Grant Likely <grant.likely@secretlab.ca> wrote:

> Hi Andres, thanks for the patch.  Comments below.
>=20
> g.
>=20
> On Sun, Aug 8, 2010 at 9:11 PM, Andres Salomon <dilinger@queued.net>
> wrote:
[...]
> > +
> > =C2=A0unsigned int prom_early_allocated __initdata;
> >
> > -#include "../../../drivers/of/pdt.c"
> > +static struct of_pdt_ops prom_sparc_ops __initdata =3D {
> > + =C2=A0 =C2=A0 =C2=A0 .firstprop =3D prom_common_firstprop,
> > + =C2=A0 =C2=A0 =C2=A0 .nextprop =3D prom_common_nextprop,
> > + =C2=A0 =C2=A0 =C2=A0 .getproplen =3D (int (*)(phandle, const char
> > *))prom_getproplen,
> > + =C2=A0 =C2=A0 =C2=A0 .getproperty =3D (int (*)(phandle, const cha=
r *, char *,
> > int))prom_getproperty,
> > + =C2=A0 =C2=A0 =C2=A0 .getchild =3D (phandle (*)(phandle))prom_get=
child,
> > + =C2=A0 =C2=A0 =C2=A0 .getsibling =3D (phandle (*)(phandle))prom_g=
etsibling,
>=20
> If you have to explicitly cast these function pointers, then you're
> doing it wrong.  :-)  Listen to and fix the compiler complaint here.
>=20

Hm, can you please expand on that?  The reason it's necessary to cast i=
s
because sparc's prom_* functions are using ints instead of phandles.  I
don't understand why casting is the wrong thing here.

I could write some 1-line wrapper functions that simply call prom_*
rather than casting, I suppose.

[...]
> > +}
> > diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> > index 1678dbc..c8a4b7c 100644
> > --- a/drivers/of/Kconfig
> > +++ b/drivers/of/Kconfig
> > @@ -5,6 +5,10 @@ config OF_FLATTREE
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0bool
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF
> >
> > +config OF_PROMTREE
> > + =C2=A0 =C2=A0 =C2=A0 bool
> > + =C2=A0 =C2=A0 =C2=A0 depends on OF
> > +
>=20
> I can tell from the context here you're working from an older tree.
> Please rebase onto Linus' current top-of-tree.  :-)  A bunch of OF
> related patches have been merged for 2.6.36 that will conflict with
> this patch.
>=20

Sorry, will do.  Was just looking for more feedback (while testing)
before sending final versions of this stuff.


[...]
>=20
> > +
> > +#if defined(CONFIG_SPARC)
> > +static unsigned int prom_unique_id __initdata;
> > +
> > +#define inc_unique_id(p) do { \
> > + =C2=A0 =C2=A0 =C2=A0 (p)->unique_id =3D prom_unique_id++; \
> > +} while (0)
>=20
> Use a static inline.  C code is preferred over preprocessor code.
> Also preserver the namespace and use the of_pdt_ prefix (that goes fo=
r
> all the new functions here in this file).

This is processing multiple types, that's the reason for the macro.

'p' can be either a property struct, or device_node struct.


[...]
> > - =C2=A0 =C2=A0 =C2=A0 of_console_init();
> > +void __init of_pdt_set_ops(struct of_pdt_ops *ops)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 BUG_ON(!ops);
> >
> > - =C2=A0 =C2=A0 =C2=A0 printk("PROM: Built device tree with %u byte=
s of memory.\n",
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prom_early_alloca=
ted);
> > + =C2=A0 =C2=A0 =C2=A0 prom_ops =3D *ops;
>=20
> As mentioned above, why is the structure copied instead of just
> storing the pointer.
>=20

Er, right, because originally the struct was handled differently.  No
reason for it to be copied anymore.

Thanks for the feedback!
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
