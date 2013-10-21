From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 21 Oct 2013 12:24:49 +0200
Message-ID: <20131021102448.GD21518@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <20131021095757.GY25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131021095757.GY25034-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 10:57:57AM +0100, Russell King - ARM Linux wrote:
> On Mon, Oct 21, 2013 at 11:27:30AM +0200, Sascha Hauer wrote:
> > If you have a better vision how imx-drm can be implemented without
> > getting crazy I'd love to hear about it. Please also think about the two
> > IPUs the i.MX6 has, the single one on i.MX5, parallel displays, HDMI
> > displays, LVDS displays, VGA encoder on i.MX53, external I2C slave
> > encoders,...
>=20
> Well, the multi-driver solution is just too fragile: the problem
> with it is you can never be sure when all the drivers have definitely
> finished initialising.  This problem is made much worse should one of
> them use deferred probing.
>=20
> To put it another way - with a multi-driver solution, there is no
> definite point you can say "okay, we got everything".
>=20
> So, as long as a subsystem contains something that needs to be done
> once everything is known (such as initialising the fb_helper), there
> is a fundamental disconnect between a multi-driver solution and the
> subsystem.  To put it another way, a multi-driver solution should
> not be used.

Multi-driver with DRM has worked pretty well for Tegra. Essentially what
I created was a sort of abstraction layer between DRM and the individual
drivers so that each driver can register itself with that layer. Once it
has been determined that all drivers have been probed, that glue layer
can load the DRM driver and call back into the sub-drivers to register
their respective components with DRM.

That even works fairly nicely with deferred probing. Note that the code
currently in Linus' tree has some issues, but I've reworked it since in
linux-next and the final result isn't all that bad. I've even attempted
to make it somewhat generic so that it could potentially be reused by
other drivers. It's not reusable as-is, but perhaps it can be further
improved.

I agree that hotpluggability within DRM might have made things easier,
but it would likely also have made the core more complex. Furthermore
there simply was no need for DRM to provide that kind of flexibility,
simple because no driver has had that need so far. Quite a few ARM SoC
drivers have appeared lately, and hopefully that'll provide more of an
incentive to evolve DRM as needed, but I don't think we can hold it
against anyone that they haven't provided us with the ideal subsystem.

Thierry

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZQDwAAoJEN0jrNd/PrOhrPAP/jrpC2A0UAuhP6juHefUCzX3
DEM7gkjlSECkpXyuqJySfn01Pvb0EBgmhhtybf7nSL8i5J1i+BcNGUM44aZFgzyO
74bjkKTGF3z7O4HdGQnQYSB390EAjvtJrK6BaQ2cAE0qfFiGB0jooKr/P+p5fmr6
ot0XEgmtexrKNJ20y6DG9iIO+jGIpvo8NMvdYqlXNna/oTLefFsK11TIolFU7MrO
K4l8l4PuEMuAaUISeu7rpErKdDZKSceutjFfcTMPKeXqjqsclKatmNZipmbEXis/
f5EfhX/yYS40kN7ia2DMNsDs8jk6upWP157xkT23oYRTHbDQxbtyokZVJyqCy4GW
fDYUthz5PKtRaHxdk8WhYKQtJrgwJRSoafMdu5VjXag1LGWLMUYKCPztm1JAaYiP
EBzkhRidHRhZZbBzvl03qvmfpbzaPANps8E5IXGPF4dvBb3Tegpx5ZsI4Tc8X+Jr
s96ubh3Lz784YYNAii9hjZwXARjEFG8XW8jTmL/WvZj7BoTo8zqTEjBe6ww4wLc7
xGvqLQ3eNF8OKgyOCKbelYkPsqYPy+zB1cdTcvKH15gz5lihC2xYLr+7ymKZpvYG
c07gTEOl72KP8xq2dDJGrxX8uIzPTli6kqij7I7ZIUI3LYbEiVVDlbp2J+T9BCBr
SKZT57HijdSKpvA9VKqA
=ZGj0
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
