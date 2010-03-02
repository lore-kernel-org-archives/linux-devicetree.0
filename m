From: "Albrecht Dreﬂ" <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [Patch] mpc5200b: improve baud rate calculation (reach high
	baud rates, better accuracy)
Date: Tue, 2 Mar 2010 09:09:43 +0100 (CET)
Message-ID: <14429243.1267517383754.JavaMail.ngmail@webmail14.arcor-online.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Wolfram!

Thanks a lot for your comments!

[snip]
> > + * as the chip can be only either a 5200B or not. */
> > +static int is_mpc5200b =3D -1;
> > +
> > +
> =

> One empty line too much. Maybe we can also get rid of the static later in
> the
> process, but first things first.

Ooops....

[snip]
> > +	if (is_mpc5200b =3D=3D 1)
> > +		return mpc5xxx_get_bus_frequency(p) * 4;
> > +	else
> > +		return mpc5xxx_get_bus_frequency(p) / 2;
> =

> Isn't this wrong? You can also have /32 on the 5200B (the fallback).

Yes, but I do all /calculations/ with the /4 prescaler for higher accuracy.=
  If the divisor exceeds the available 16 bits of the counter reg, I round =
(divisor / 8) to use the /32 prescaler.  Think of a 19-bit counter value, w=
here I can choose to use either the lower or the higher 16 bits for the cou=
nter reg.  Remember also that using the higher 16 bits (/32 prescaler) is p=
robably the exceptional case - with an IPB frequency of 132 MHz this will h=
appen only for standard baud rates B300 and slower.

[snip]
> > +	/* Check only once if we are running on a mpc5200b or not */
> > +	if (is_mpc5200b =3D=3D -1) {
> > +		struct device_node *np;
> > +
> > +		np =3D of_find_compatible_node(NULL, NULL, "fsl,mpc5200b-immr");
> =

> This should be handled using a new compatible-entry
> "fsl,mpc5200b-psc-uart".

I agree that this would be a lot cleaner, but it's also a lot more intrusiv=
e.  CC'ing the device tree discussion list here... comments, please!!

> > +		if (np) {
> > +			is_mpc5200b =3D 1;
> > +			dev_dbg(&op->dev, "mpc5200b: using /4 prescaler\n");
> =

> Does this message respect the fallback case?

See comment above...

> You could also have a set_divisor-function for 5200 and 5200B and set it
> here
> in the function struct (one reason less for the static ;))

Hmmm, but then I would need a 'static struct psc_ops mpc5200b_psc_ops', whe=
re only two functions differ from the generic 52xx struct as it is implemen=
ted now.  Using the static int needs less space.  However, in combination w=
ith the new compatible entry, it would of course make sense.

Again, any insight from the device tree gurus would be appreciated!

Thanks, Albrecht.

Tolle Dekollet=E9s oder scharfe Tatoos? Vote jetzt ... oder mach selbst mit=
 und zeige Deine Schokoladenseite
bei Topp oder Hopp von Arcor: http://www.arcor.de/rd/footer.toh
