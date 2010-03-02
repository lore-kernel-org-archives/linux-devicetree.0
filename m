From: "Albrecht Dreﬂ" <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [Patch] mpc5200b: improve baud rate calculation (reach high
	baud rates, better accuracy)
Date: Tue, 2 Mar 2010 09:56:48 +0100 (CET)
Message-ID: <22132814.1267520208614.JavaMail.ngmail@webmail14.arcor-online.net>
References: <20100302082858.GA4087@pengutronix.de>
	<14429243.1267517383754.JavaMail.ngmail@webmail14.arcor-online.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100302082858.GA4087-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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

Hi Wolfram:

[snip]
> > Yes, but I do all /calculations/ with the /4 prescaler for higher
> accuracy.
> > If the divisor exceeds the available 16 bits of the counter reg, I round
> > (divisor / 8) to use the /32 prescaler.  Think of a 19-bit counter valu=
e,
> > where I can choose to use either the lower or the higher 16 bits for the
> > counter reg.
> =

> Okay, now I got it. (Maybe this is an indication for another comment above
> the
> set divisor function?)

O.k., I will add that comment...

> > Remember also that using the higher 16 bits (/32 prescaler) is
> > probably the exceptional case - with an IPB frequency of 132 MHz this
> will
> > happen only for standard baud rates B300 and slower.
> =

> Even the rare cases have to be correct ;)

I agree - will make the debug output and comments clearer...

[snip]
> > > This should be handled using a new compatible-entry
> > > "fsl,mpc5200b-psc-uart".
> > =

> =

> > I agree that this would be a lot cleaner, but it's also a lot more
> intrusive.
> > CC'ing the device tree discussion list here... comments, please!!
> =

> Why intrusive? Maybe I miss something?

Not for the source file, but for all the dts files, if they want to benefit=
 from the detection of the '5200B.  Basically, *all* files have to be check=
ed and touched if necessary.  Again, I agree that this would be the clean a=
pproach, but I wanted to avoid that effort.  Grant???

[snip]
> Leave those two function pointers empty and fill them during probe (probe
> has
> access to the compatible-property it was matched against, see its
> arguments).
> So it should be a matter of:
> =

> if (matched_property =3D=3D 5200b)
> 	ops->func =3D this_one;
> else
> 	ops->func =3D that_one;

Umm, yes, that's true of course.  Will pick it up.

Thanks, Albrecht.

Tolle Dekollet=E9s oder scharfe Tatoos? Vote jetzt ... oder mach selbst mit=
 und zeige Deine Schokoladenseite
bei Topp oder Hopp von Arcor: http://www.arcor.de/rd/footer.toh
