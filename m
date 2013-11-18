From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 17:18:14 +0100
Message-ID: <20131118161812.GP26046@ulmo.nvidia.com>
References: <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com>
 <20131024072811.GS30088@pengutronix.de>
 <CAF6AEGuEho9Ms7ifTE-EmBoQ-=_AXgvGcJxi5qEC0vsZ+H9C+A@mail.gmail.com>
 <20131118124518.GA16735@n2100.arm.linux.org.uk>
 <20131118153750.GM26046@ulmo.nvidia.com>
 <20131118161151.GG16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDuspjMMC1Ui5ypn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118161151.GG16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--NDuspjMMC1Ui5ypn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 04:11:51PM +0000, Russell King - ARM Linux wrote:
> On Mon, Nov 18, 2013 at 04:37:51PM +0100, Thierry Reding wrote:
> > Very nice. This is in fact very similar to a skeleton I started to
> > implement locally. The names vary to some degree, but the general
> > approach is the same.
> >=20
> > This also happens to be very similar to what Tegra DRM does, just as a
> > set of helpers rather than a bus type. I like it a lot.
> >=20
> > In particular this gives every driver a good amount of flexibility to
> > implement the matching in a way that's appropriate. On hardware where
> > the relationships are hierarchical, a driver can use that to its
> > advantage. Whenever that's not possible it can be done using phandles
> > or any other meta data that fits the particular use-case.
>=20
> Indeed - I set out to solve the following problems:
>=20
> - How do we deal with a componentised device such that we can find all
>   of its component devices, and know when we have them all?
> - How can we probe the master device when we know we have all the
>   components?
> - How do we tear down the master device when one of the components is
>   removed?
>=20
> I intentionally didn't want the code to answer the question about how
> we specify how the components are organised - that's a subject best
> left to the subsystem and/or device, since it's something which will
> most likely vary.
>=20
> > Do you have a branch somewhere that I could use to test this with?
>=20
> Not yet - and there probably won't be, because the code itself is not
> large - it's currently less than 500 lines.
>=20
> The code has evolved over time - with imx-drm as a guinea pig.
>=20
> The code which I have so far committed (and some people are using in
> patch form on the carrier-1 boards) is an earlier version, which just
> caters for proper init ordering and making it possible to unbind the
> "master" device.  It gets that init ordering by using deferred probing
> if there's no connectors, or the CRTCs which the connectors refer to
> are missing - it needs no changes to the DT representation.
>=20
> Since then, I've augmented it as I described and that's currently just
> as an additional patch on top which adds the master device idea - which
> does need those additional changes.
>=20
> Logically, it can't stay as two separate patches, because it won't be
> possible to "migrate" to it in stages.  So I'm fully intending to
> squash that all down to one patch which adds the core code (probably
> ultimately into drivers/base).
>=20
> IOW, watch this space this week. :)

Will do! Thanks for doing this.

Thierry

--NDuspjMMC1Ui5ypn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSij3EAAoJEN0jrNd/PrOh34kP/3uDAHzQM3DlSapjS223nhr0
0n9UwMGUgR6UM79wLZ0FMz2W/JyHWsRmMLeI2TBa92pI0PU/7W7MEvGF2KY/txKT
Ah6FoG7BpgR78wnxagtvYECs4BvS4ax/eB5+lz7LISLtJKoTKi2fvT/4e/WIcZ/3
tS2sQ7M5CfCuz+L4ZShP9OCM7YjAz0Nl6xuV8AHD4zUPNv+yk4rndzCxOEkgGF+u
aWDRO/n2rMP0Sh+fJ0A4OtB+YRGkuGjyDA72qqqwml9oV6hOzsPEXntfPP7Ccro2
JMHTAif5qxbAwCuTio2cKs/kR20lLHcNJibOyQgEperUo8el0yT+I8+4EuaXAlo3
AoOSELEONVPT5s6SH+icY+92Zj/hT6cWknXD3fjY/g77TOYhUHlLTQo3sZrr83h7
oXDkmIix4oxfAX2oOErWPjlMgWPT2XIRdhlwamarSCHdky+MqM0VThZGBBPwjIMz
rxQjq9AQFF3m7yNHVmUY2+klyAHxvPutu555Sh5HZxH2wGzTGMfMqUW8n7UP4bcs
83JEnDvyXB40USpIo7DKKix2qQqmtTHsh+Rl26sVFkQT9CJqXFrrgTp/mcs7PXcl
pgHJo5HDxHryUsEx3cYIKViqfLlpr3ITUTr6jYGByzVmO7gYk+6wlT2tnn+iDaKN
aO/QVlkY7IFP9OAgcFIh
=ElIk
-----END PGP SIGNATURE-----

--NDuspjMMC1Ui5ypn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
