From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] simplefb: Change simplefb_init from
 module_init to fs_initcall
Date: Tue, 18 Nov 2014 12:21:24 +0100
Message-ID: <20141118112123.GA3873@ulmo>
References: <1415830124-28787-1-git-send-email-hdegoede@redhat.com>
 <1415830124-28787-3-git-send-email-hdegoede@redhat.com>
 <20141113085238.GE20972@lukather>
 <CAMuHMdXZ4V4GHvyDLOP8FYvPuGArc5G0aO6NCE9FKHT24YRGPg@mail.gmail.com>
 <20141118101911.GA15769@ulmo>
 <546B26F4.50302@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-sunxi+bncBDTKFPPJUEHRBN6XVSRQKGQEN2T56ZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <546B26F4.50302-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Fbdev development list <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2014 at 12:01:08PM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 11/18/2014 11:19 AM, Thierry Reding wrote:
> > On Thu, Nov 13, 2014 at 09:58:41AM +0100, Geert Uytterhoeven wrote:
> >> Hi Maxime,
> >>
> >> On Thu, Nov 13, 2014 at 9:52 AM, Maxime Ripard
> >> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >>>> -module_init(simplefb_init);
> >>>> +/*
> >>>> + * While this can be a module, if builtin it's most likely the cons=
ole
> >>>> + * So let's leave module_exit but move module_init to an earlier pl=
ace
> >>>> + */
> >>>
> >>> Not really related to this patch itself, but do we want to support
> >>> simplefb as a module? It seems like it's going to be most of the time
> >>> broken.
> >>
> >> If it depends on clocks, it won't work as a module, as CCF will have d=
isabled
> >> all unused clocks at that point.
> >=20
> > If it does depend on anything beyond clocks it won't work at all. Clocks
> > are special because they get set up very early at boot time. If it turns
> > out that a simplefb ever needs a regulator to remain on, and that's even
> > quite likely to happen eventually, it's going to fail miserably, because
> > those regulators will typically be provided by a PMIC on an I2C bus. The
> > regulator won't be registered until very late into the boot process and
> > a regulator_get() call will almost certainly cause the simplefb driver
> > to defer probing.
>=20
> Right, this has been discussed already and the plan is to have simplefb
> continue its probe function and return success from it if it encounters
> any -eprobe_defer errors, while tracking which resources it misses.
>=20
> And then have a late_initcall which will claim any resources which failed
> with -eprobe beforehand.

How do you ensure that the late_initcall gets run before any of the
other late_initcalls that disable the resources? Also my recollection is
that deferred probing will first be triggered the first time from a
late_initcall, so chances aren't very high that all resources have shown
up by that time.

> > Now deferring probing is a real showstopper for simplefb, because not
> > only does it make the framebuffer useless as early boot console, once
> > probing is attempted again the clocks that it would have needed to
> > acquire to keep going will already have been switched off, too.
>=20
> That is not true, even with the current implementation, if all necessary
> drivers are built in, then simplefb will come up later, but it will still
> come up before the late_initcall which disables the clocks.

Yes, in the current implementation because clocks typically are
registered very early and thus you don't hit the deferred probe. The
same is not true for other types of resources where it's actually quite
common to hit deferred probing (regulators is a very notorious one).

It doesn't matter whether a driver is built-in or not, once you hit
deferred probing you lose.

> Once we do the split probing described above (which is something which
> we plan to do when it becomes necessary), then simplefb will still come
> up early.

It will come up early but won't have acquired all the resources that it
needs, so unless you somehow manage to order late_initcalls in exactly
the way that you need them, the frameworks will still turn off what you
haven't managed to claim yet.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUayuzAAoJEN0jrNd/PrOhlB8P/RK9Y3rHmcLiGYzX4muIaNyL
WkRIfkw92MyA16UPkvF54KwbHifyggMpBsbltRARBHiTO+p/WSUGT2jg6JT8I7tW
gMtAgREB+5d3AXiHwZTWMkr9G4Ku83Gfhw5bTOVC3r+6GUjutw63eTurpHimLtdN
h1WIRxqp3VKehklIhrOGgh5hYq9vXtkBKQUf0t6eSWwGTf3Ua+bfEfs2FdIqur0q
mIsbKQlo3iq1KCH6j6KnPP3DOuJ+65zB7Ns1OLnR7QBjI3XTDPSd+DQm9ddB/1Z6
k+n5zPMUIxi7AcqDU7KqpjKJ2bxGkRb2k/1RUcmSY2u6nLVsiYc8l4Fj2vN5QuoV
XXOGJI9v2v/QxlLFGFFyIXUE/OME0hxf/l5gGro+6qw9Rt4eCiFkLq8ZOh9pOxAa
JUQlZwLuBIUPVHc9+1ntmqkeIKwRJB9VWvPnH0/cMsZtJbf7w+TspKS2YPow8ltA
wBC4Sas2dHZKYKZo3/dbkqFMYl1mXduyiWCyUQXOqL7YeCheUScMU8FEh8jyJUDr
oNqlAwf7eAaGaeDnH1W9rAzSRLbCafL6YCvCSMkzTq3FE+RKd5gphUFemLyWZODC
B9tNFZPo12s/0oJEkps+D4k9eysEGJ2L2NNT1Hny5tLKT74G0ggfpXlDGqN6QQUF
BiEFaUn/wF0c7QeIN/eH
=XWcZ
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
