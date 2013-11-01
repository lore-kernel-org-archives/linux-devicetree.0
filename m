From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Fri, 1 Nov 2013 11:36:15 +0100
Message-ID: <20131101103614.GM27864@ulmo.nvidia.com>
References: <5265AFED.1040503@roeck-us.net>
 <52665314.2040904@imgtec.com>
 <232aa6e4-19fe-4460-8101-8bf1d639ff3c@email.android.com>
 <20131022164922.GA29852@roeck-us.net>
 <20131022203546.GC8037@mithrandir>
 <20131022211000.GA30394@roeck-us.net>
 <20131023075758.GA7404@ulmo.nvidia.com>
 <20131023160131.GA20675@roeck-us.net>
 <20131023210715.GF8828@mithrandir>
 <20131024151853.GB25355@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/t6ASE28jIy1gGy9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131024151853.GB25355-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/t6ASE28jIy1gGy9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 08:18:53AM -0700, Guenter Roeck wrote:
> On Wed, Oct 23, 2013 at 11:07:16PM +0200, Thierry Reding wrote:
> [ ... ]
> > >=20
> > > Was this just a matter of enabling OF on this platform, or do you hav=
e an
> > > out-of-tree set of patches ? If the latter, is it available somewhere
> > > to look at (including the complete devicetree from your above example=
) ?
> >=20
> > It was mostly a matter of enabling OF and writing the device tree. Most
> > of the generic kernel code changes I even got merged, but there were a
> > few patches that I never got around to merge. Some weren't anywhere
> > close to a mergeable state either.
> >=20
> > I no longer work for the company and don't have access to the patches.
> > But I can ping a few people and see if I can dig up something for you.
> >=20
> That would be great.

Hi Guenter,

It took some time, but here's the tree:

	https://github.com/avionic-design/linux/commits/medatom/master

The device tree files are in arch/x86/boot/dts (as expected I guess). A
linux-next from over a year ago was used as the base for that branch, so
some of that will be stale, but DT is a stable ABI, so that should still
be valid. =3D)

If you have any questions, please don't hesitate to ask. Although I have
not been working on that for a while, so my memories about it aren't all
that fresh anymore.

Thierry

--/t6ASE28jIy1gGy9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSc4QeAAoJEN0jrNd/PrOhvoYP/1fF57wvBIMGTR/F1DKxNiz1
5tr8dJBikJIvXRG2waaPWREA/XFUoTG+7lUkcARp7hk57N6budCQbjetns7bn5ru
0HF7/bIOoDrDlFR+GNzGbIZWXnJRJs+9nfInsXOB9C29Q+RvywKbewOXt/04f7hK
LQQ4G/oOM/wstytCXYqtVVXouQWH7TF1Ec1/z1/O8xcMANqPcxTeckVwvnegS5X2
XabOfE0xeERMfN9l+qWZ5QH+4MM7I4dhjyMUTkSKKw6iHd+we6cBVjYUk+GJMw7+
xWuXke7y4bhHtRKofXAYRXqRnm19MVgCwXtXGSgww4Pi1UmERUC3OVvx8wPv+ljy
B3h+0ns7GVguVIMlVXTu/XqLhmbbpnBXS7nEVgjSngiXhIMfu6vhL6NmMNL1Lulq
J6jPxup5nvuC7RdJRzKADzZGPpM4khvrkB/0wXwDcoE2BU42new/77PR8smLvqo9
v2gfzH035U45OC4MsV+QDhHPEdL/gMB2eVR+pVF4LBHf9umVXCmptsCRB9REDf+D
pdufKCsWOCnUZjVRyQN43Xdxuqs6L4pY6WImARu47aOmbLCLkBwWDe9R1BiZilmp
TM4u4LvdZOv4A3FwN15v2oQ7eYmnvKiEQQgxKlawpX5zYYoxgr8EdZSLqDP9wIew
PhUqiOkFCvrk5+wnD1fd
=9M/J
-----END PGP SIGNATURE-----

--/t6ASE28jIy1gGy9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
