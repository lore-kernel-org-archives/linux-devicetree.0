From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCHv3][ 3/5] video: mx3fb: Add device tree suport.
Date: Sat, 26 Oct 2013 02:18:54 +0200
Message-ID: <20131026001854.GE17135@pengutronix.de>
References: <1382532229-32755-1-git-send-email-denis@eukrea.com>
 <1382532229-32755-3-git-send-email-denis@eukrea.com>
 <20131025195040.0CCC3C404DA@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131025195040.0CCC3C404DA-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Eric =?iso-8859-15?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 25, 2013 at 08:50:40PM +0100, Grant Likely wrote:
> On Wed, 23 Oct 2013 14:43:47 +0200, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org> =
wrote:
> > Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> > Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Cc: Eric B=E9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> > ---
> > ChangeLog v2->v3:
> > - The device tree bindings were reworked in order to make it look m=
ore like the
> >   IPUv3 bindings.
> > - The interface_pix_fmt property now looks like the IPUv3 one.
> > ---
> >  .../devicetree/bindings/video/fsl,mx3-fb.txt       |   35 ++++++
> >  drivers/video/Kconfig                              |    2 +
> >  drivers/video/mx3fb.c                              |  125 ++++++++=
+++++++++---
> >  3 files changed, 147 insertions(+), 15 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/video/fsl,mx3=
-fb.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt=
 b/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt
> > new file mode 100644
> > index 0000000..0b31374
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/video/fsl,mx3-fb.txt
> > @@ -0,0 +1,35 @@
> > +Freescale MX3 fb
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Required properties:
> > +- compatible: Should be "fsl,mx3fb". compatible chips include the =
imx31 and the
> > +  imx35.
> > +- reg: should be register base and length as documented in the dat=
asheet.
> > +- clocks: Handle to the ipu_gate clock.
> > +
> > +Example:
> > +
> > +lcdc: mx3fb@53fc00b4 {
> > +	compatible =3D "fsl,mx3-fb";
> > +	reg =3D <0x53fc00b4 0x0b>;
> > +	clocks =3D <&clks 55>;
> > +};
>=20
> This (and some of the other bindings) are trivial, and they are all
> associated with a single SoC. I think it would be better to collect a=
ll
> the mx3 bindings into a single file rather than distributing them all
> over the bindings tree.
>=20
> I started thinking about this after some of the DT conversations in
> Edinburgh this week. Unless there is a high likelyhood of components
> being used separately, I think it is far more useful to collect all t=
he
> bindings for an SoC into a single file. It will certainly reduce a lo=
t
> of the boilerplate that we've been collecting in bindings documentati=
on
> files.
>=20
> A long time ago I took that approach for the mpc5200 documentation[1]=
=2E
> Take a look at that organization and let me know what you think.

I don't think this is a good idea. When a new SoC comes out we don't
know which components will be reused on the next SoC. This will cause a
lot of bikeshedding when it actually is reused and then has to be moved=
=2E

Also I would find it quite inconsistent if I had to lookup some devices
in a SoC file and most bindings in subsystem specific files. So when
searching for a binding I would first have to know if the hardware is
unique to the SoC or not.

Sascha

--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
