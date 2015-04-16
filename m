From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 2/2] arch: arm: Show the serial number from devicetree
 in cpuinfo
Date: Thu, 16 Apr 2015 12:23:11 +0200
Message-ID: <1429179791.2483.13.camel@collins>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
	 <1427564371-26039-2-git-send-email-contact@paulk.fr>
	 <20150416094623.GX12732@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-5rDbM611SZHXoQF4rpdi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150416094623.GX12732-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-5rDbM611SZHXoQF4rpdi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell, thanks for the review!

Le jeudi 16 avril 2015 =C3=A0 10:46 +0100, Russell King - ARM Linux a =C3=
=A9crit :
> On Sat, Mar 28, 2015 at 06:39:31PM +0100, Paul Kocialkowski wrote:
> > This grabs the serial number shown in cpuinfo from the serial-number de=
vicetree
> > property in priority. When booting with ATAGs (and without device-tree)=
, the
> > provided number is still shown instead.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> > ---
> >  arch/arm/include/asm/system_info.h |  1 +
> >  arch/arm/kernel/atags_parse.c      |  3 +++
> >  arch/arm/kernel/devtree.c          | 15 ++++++++++-----
> >  arch/arm/kernel/setup.c            | 11 +++++++++--
> >  4 files changed, 23 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/arch/arm/include/asm/system_info.h b/arch/arm/include/asm/=
system_info.h
> > index 720ea03..3860cbd40 100644
> > --- a/arch/arm/include/asm/system_info.h
> > +++ b/arch/arm/include/asm/system_info.h
> > @@ -17,6 +17,7 @@
> > =20
> >  /* information about the system we're running on */
> >  extern unsigned int system_rev;
> > +extern const char *system_serial;
> >  extern unsigned int system_serial_low;
> >  extern unsigned int system_serial_high;
> >  extern unsigned int mem_fclk_21285;
> > diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_pars=
e.c
> > index 68c6ae0..8384818 100644
> > --- a/arch/arm/kernel/atags_parse.c
> > +++ b/arch/arm/kernel/atags_parse.c
> > @@ -231,6 +231,9 @@ setup_machine_tags(phys_addr_t __atags_pointer, uns=
igned int machine_nr)
> >  		parse_tags(tags);
> >  	}
> > =20
> > +	/* Serial number is stored in system_serial_low/high */
> > +	system_serial =3D NULL;
> > +
> >  	/* parse_early_param needs a boot_command_line */
> >  	strlcpy(boot_command_line, from, COMMAND_LINE_SIZE);
> > =20
> > diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> > index 11c54de..a82a04d 100644
> > --- a/arch/arm/kernel/devtree.c
> > +++ b/arch/arm/kernel/devtree.c
> > @@ -26,6 +26,7 @@
> >  #include <asm/smp_plat.h>
> >  #include <asm/mach/arch.h>
> >  #include <asm/mach-types.h>
> > +#include <asm/system_info.h>
> > =20
> > =20
> >  #ifdef CONFIG_SMP
> > @@ -204,6 +205,9 @@ static const void * __init arch_get_next_mach(const=
 char *const **match)
> >  const struct machine_desc * __init setup_machine_fdt(unsigned int dt_p=
hys)
> >  {
> >  	const struct machine_desc *mdesc, *mdesc_best =3D NULL;
> > +	const char *prop;
> > +	int size;
> > +	unsigned long dt_root;
> > =20
> >  #ifdef CONFIG_ARCH_MULTIPLATFORM
> >  	DT_MACHINE_START(GENERIC_DT, "Generic DT based system")
> > @@ -215,17 +219,14 @@ const struct machine_desc * __init setup_machine_=
fdt(unsigned int dt_phys)
> >  	if (!dt_phys || !early_init_dt_verify(phys_to_virt(dt_phys)))
> >  		return NULL;
> > =20
> > +	dt_root =3D of_get_flat_dt_root();
> > +
> >  	mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mach);
> > =20
> >  	if (!mdesc) {
> > -		const char *prop;
> > -		int size;
> > -		unsigned long dt_root;
> > -
> >  		early_print("\nError: unrecognized/unsupported "
> >  			    "device tree compatible list:\n[ ");
> > =20
> > -		dt_root =3D of_get_flat_dt_root();
> >  		prop =3D of_get_flat_dt_prop(dt_root, "compatible", &size);
> >  		while (size > 0) {
> >  			early_print("'%s' ", prop);
> > @@ -243,6 +244,10 @@ const struct machine_desc * __init setup_machine_f=
dt(unsigned int dt_phys)
> > =20
> >  	early_init_dt_scan_nodes();
> > =20
> > +	/* Scan for serial number */
> > +	prop =3D of_get_flat_dt_prop(dt_root, "serial-number", &size);
> > +	system_serial =3D prop;
> > +
> >  	/* Change machine number to match the mdesc we're using */
> >  	__machine_arch_type =3D mdesc->nr;
> > =20
> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> > index 1d60beb..69fa7ef 100644
> > --- a/arch/arm/kernel/setup.c
> > +++ b/arch/arm/kernel/setup.c
> > @@ -93,6 +93,9 @@ unsigned int __atags_pointer __initdata;
> >  unsigned int system_rev;
> >  EXPORT_SYMBOL(system_rev);
> > =20
> > +const char *system_serial;
> > +EXPORT_SYMBOL(system_serial);
> > +
> >  unsigned int system_serial_low;
> >  EXPORT_SYMBOL(system_serial_low);
> > =20
> > @@ -1091,8 +1094,12 @@ static int c_show(struct seq_file *m, void *v)
> > =20
> >  	seq_printf(m, "Hardware\t: %s\n", machine_name);
> >  	seq_printf(m, "Revision\t: %04x\n", system_rev);
> > -	seq_printf(m, "Serial\t\t: %08x%08x\n",
> > -		   system_serial_high, system_serial_low);
> > +
> > +	if (system_serial)
> > +		seq_printf(m, "Serial\t\t: %s\n", system_serial);
> > +	else
> > +		seq_printf(m, "Serial\t\t: %08x%08x\n",
> > +			   system_serial_high, system_serial_low);
>=20
> How about this becomes just:
>=20
> 	seq_printf(m, "Serial\t\t: %s\n", system_serial);

Okay, always printing the system_serial string in cpuinfo's c_show seems
cleaner and clearly states that the string way is preferred over the old
one, which becomes legacy.

> And we arrange for system_serial to always be initialised later on
> during boot if it's not already set from the system_serial_high and
> system_serial_low variables?  Eg, adding in init_machine_late():
>=20
> 	if (!system_serial)
> 		system_serial =3D kasprintf(GFP_KERNEL, "%08x%08x",
> 					  system_serial_high,
> 					  system_serial_low);
>=20
> and is there a reason we can't look for the serial number in DT at
> this point as well - is there a reason we might need the stringified
> serial number early?

Not that I know of -- I just thought it would be a good fit to fill-in
the string in setup_machine_fdt since ATAGs were being stored in
serial_low/high in setup_machine_tags (to preserve some kind of
"structure parallelism" in the way the serial number is obtained).

Now if the serial from ATAG is going to end up in the system_serial
string too, it doesn't make a lot of sense to keep the structure I
suggested, so I agree with your proposal.

We could simply check whether the serial-number property is there (when
DT is enabled at all) and fallback to using serial_low/high when it's
not the case (which would perhaps be 0), at a later point in
initialization. If you think init_machine_late is a good fit, then I'll
go for it.


--=-5rDbM611SZHXoQF4rpdi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVL42PAAoJEIT9weqP7pUMpwcQAIMnmCVUHp87OCnai4rZNt8n
SfAwvhe5DKmvwsVAqjTmR095jrl+GqDnaoyOGhjgDHBKm3pDtLnVYHP+OhQtZ0P/
BCnsOXckOdt3zv3eq/dEJ5+hHu76JcxNCONds63fuYEBoSJ2P/y4o2W3+KTUZIXm
LIhpoRxo56aeEyuceF42C9K0sidosMKpJpVKpwtNU6IhTrODpbw6d4k3VnZVFlNc
Zg4qJ+d1HcFrrq/PJ6Y+muJgtXADETPgAgivI0Js9bj8aeaXbthBsSkXj1zc/1mf
bq+1K9XnVuFvRbI7JBDkpW5BQolGpEjZ2EFqxXdX6ZMeTZlYeyAlEfgnl16Euw0V
wCPjTqbluGxHqOyWjuxdlTOhpCajSq7nBsXiTkDBIOFrWdSpS/L2QyFYHIN4V5R+
aJF675R5A3SxpeUd1DoRKAimYftLkVLK8QGF7/rrJVxYYv6pkr/JNjwFtHSu7/Xw
0I4HVJ5z7u1zz9ds57zE0mKzKwTSCz1c/AvP6rLrzamkZCH+8DuHE9AubOxREKue
H8HLvZI2fVFa+S7LfhHsM5ZMdjFm1oxhXppVHIle7aVwVJNvjYKAWmzrprRGWJB6
2Prgy8dEsS96DBkp1Bo94pWj91kRhy1sUi+0CUCgR8IXIhIohsgjoLTYv0sYVtuF
wPm7AxxNFU4n9mh9M6xO
=21gO
-----END PGP SIGNATURE-----

--=-5rDbM611SZHXoQF4rpdi--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
