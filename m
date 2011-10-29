From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: include errno.h
Date: Sat, 29 Oct 2011 12:38:43 +0200
Message-ID: <20111029103843.GC20132@ponder.secretlab.ca>
References: <20111006124044.1066.7111.stgit@localhost6.localdomain6>
 <CAMuHMdX-V6FqSZ_mmPm5aW_bTUNMk4sz5cADryX3Xyk627wRdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX-V6FqSZ_mmPm5aW_bTUNMk4sz5cADryX3Xyk627wRdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, devicetree-discuss@lists.ozlabs.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 29, 2011 at 10:38:16AM +0200, Geert Uytterhoeven wrote:
> On Thu, Oct 6, 2011 at 14:40, Kalle Valo <kvalo@qca.qualcomm.com> wro=
te:
> > When compiling ath6kl for beagleboard (omap2plus_defconfig plus
> > CONFIG_ATH6KL, CONFIG_OF disable) with current linux-next compilati=
on
> > fails:
> >
> > include/linux/of.h:269: error: 'ENOSYS' undeclared (first use in th=
is function)
> > include/linux/of.h:276: error: 'ENOSYS' undeclared (first use in th=
is function)
> > include/linux/of.h:289: error: 'ENOSYS' undeclared (first use in th=
is function)
>=20
> And now this build failure (also on m68k) has hit Linus' tree, more
> than 3 weeks after
> its detection in -next...
>=20
> > Fix this by including errno.h from of.h.
> >
> > Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>=20
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Appied, thanks, and I'll push out to Linus as soon as the test build fi=
nishes.

g.

>=20
> > ---
> > =A0include/linux/of.h | =A0 =A01 +
> > =A01 files changed, 1 insertions(+), 0 deletions(-)
> >
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 9180dc5..219c29d 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -17,6 +17,7 @@
> > =A0*/
> > =A0#include <linux/types.h>
> > =A0#include <linux/bitops.h>
> > +#include <linux/errno.h>
> > =A0#include <linux/kref.h>
> > =A0#include <linux/mod_devicetable.h>
> > =A0#include <linux/spinlock.h>
>=20
> Gr{oetje,eeting}s,
>=20
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0=A0 -- =
Linus Torvalds
