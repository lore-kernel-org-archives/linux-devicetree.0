From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] simplefb: Change simplefb_init from
 module_init to fs_initcall
Date: Tue, 18 Nov 2014 11:19:13 +0100
Message-ID: <20141118101911.GA15769@ulmo>
References: <1415830124-28787-1-git-send-email-hdegoede@redhat.com>
 <1415830124-28787-3-git-send-email-hdegoede@redhat.com>
 <20141113085238.GE20972@lukather>
 <CAMuHMdXZ4V4GHvyDLOP8FYvPuGArc5G0aO6NCE9FKHT24YRGPg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-sunxi+bncBDTKFPPJUEHRBI52VSRQKGQE6MWOUGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZ4V4GHvyDLOP8FYvPuGArc5G0aO6NCE9FKHT24YRGPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Fbdev development list <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2014 at 09:58:41AM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Thu, Nov 13, 2014 at 9:52 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> -module_init(simplefb_init);
> >> +/*
> >> + * While this can be a module, if builtin it's most likely the console
> >> + * So let's leave module_exit but move module_init to an earlier place
> >> + */
> >
> > Not really related to this patch itself, but do we want to support
> > simplefb as a module? It seems like it's going to be most of the time
> > broken.
>=20
> If it depends on clocks, it won't work as a module, as CCF will have disa=
bled
> all unused clocks at that point.

If it does depend on anything beyond clocks it won't work at all. Clocks
are special because they get set up very early at boot time. If it turns
out that a simplefb ever needs a regulator to remain on, and that's even
quite likely to happen eventually, it's going to fail miserably, because
those regulators will typically be provided by a PMIC on an I2C bus. The
regulator won't be registered until very late into the boot process and
a regulator_get() call will almost certainly cause the simplefb driver
to defer probing.

Now deferring probing is a real showstopper for simplefb, because not
only does it make the framebuffer useless as early boot console, once
probing is attempted again the clocks that it would have needed to
acquire to keep going will already have been switched off, too.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUax0fAAoJEN0jrNd/PrOhETQP/R5d44xFLa57Z4IQn1njPzC5
Wu7zh5R/fvBZ8p0MxblyA0ooyh27NQgI7inThI1zigU2goXhQ8DP2cJD9alCP1EY
B/tAmBbi9t5kR53MvkInxE55CWjNkjpvKx/2YuPb1J8UOu4eQoQfW4eCTlbg2+W4
qg3cT7zcEixZFqLm78Hq1uTDV7XFaDyFUBmlZZQn7JfqLs84topvZkVLqf2UO+nQ
Vn6ucsw3tYq10qiO+X7PIR3/FedaZRDX5i5g+om33woRumim+XANUSrfO6LW+TIx
O9+8F0ldVu2lNeT1+cI/sjoP6/y6GHRQCqFaEZOmV122xs8MWYOjgKBtXfz08oR5
jlz/+P7SSSeNtLwp6nHMSD70xA2X35al3W86ggp7nOaGon/FWvNMk6E+gSU4TMcZ
/WknJpjmgw+qQTqKDeNXvMNlDtagaJPeKOFCNiTI6dqxJERY1exDtBWmpP0css6x
ogQcOHR883AsoLUkV3Foo/VQ3mW9CopW/gaPYyVZ4Chx91CgdBl3McDWDeWSwBQI
3bjn3pX69BqnP/2pOSgIdJJAVIqABUmLENRZY+KfimJPIbF9975cvOa55bNjqpuv
4d4OU7dzzPFHFw8doUSDCVzFoXkRdws6wYbIA/gf79NALGEkJM6+sLTaDxnPKQxq
bCUp6zqHjARxUtRdWH87
=oR9/
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
