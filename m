From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core
 to drivers/of
Date: Thu, 27 Feb 2014 10:36:36 +0200
Message-ID: <530EF914.3000407@ti.com>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de>	 < CAL_Jsq+U9zU1i+STLHMBjY5BeEP6djYnJVE5X1ix-D2q_zWztQ@mail.gmail.com>	 < 20140217181451.7EB7FC4044D@trevor.secretlab.ca>	 <20140218070624.GP17250@ pengutronix.de>	 <20140218162627.32BA4C40517@trevor.secretlab.ca>	 < 1393263389.3091.82.camel@pizza.hi.pengutronix.de>	 <20140226110114.CF2C7C40A89@trevor.secretlab.ca> <1393426129.3248.64.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="tbslvQKphTF8vBEECJCkWDMkFG79k2pmB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393426129.3248.64.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--tbslvQKphTF8vBEECJCkWDMkFG79k2pmB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26/02/14 16:48, Philipp Zabel wrote:

>> I would like the document to acknowledge the difference from the
>> phandle+args pattern used elsewhere and a description of when it would=

>> be appropriate to use this instead of a simpler binding.
>=20
> Alright. The main point of this binding is that the devices may have
> multiple distinct ports that each can be connected to other devices.

The other main point with this binding are multiple endpoints per port.
So you can have, say, a display controller, with single port, which has
two endpoints going to two separate LCD panels.

In physical level that would usually mean that the same pins from the
display controller are connected to two panels. Most likely this would
mean that only one panel can be used at a time, possibly with different
settings (say, 16 RGB pins for one panel, 24 RGB pins for the other).

 Tomi



--tbslvQKphTF8vBEECJCkWDMkFG79k2pmB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTDvkUAAoJEPo9qoy8lh71ShEP/2H+TP+aNKfmsfd3A6pZl01T
8Em17vHnfXjxX+7KxhoqJGiydt8NGKEZLrlEuBzyZws2h7tKcQIDh+uV9SKDRTZu
qWPFWc734SR5kyuCfH9bRDyVQzi5lfLZs8PeQaglxgN6XWe9MQ9YzcLh2aQjZHyN
f5LRJ3SdOG3rx46skL9kYdOmQw/NtoSIpJeU6X+CISYcoDcIXDKvgSlEYAOHy6oV
tjORDF05GlsMotKOnehrhmmlXKrnGg21wD1adFYpMhR1ztFbkMpsn9SI9M6IMXno
bbVa/Ik8BpT2qotMytu8sT83qWgP7DomMPAZkNLtn/D9rLqEntmSV2S8D99qa+Mo
Zn81g/iUGY9AXF5L/GB935o6kTZAwaB5iXCyceLKaRFaBAoddEHg05hLOAvvmd0o
D2GXp98N4S3S619dKg3jD634BwnwxeOAa9YJu7+4nvgx+Hi9uGH7kXYLwHOzsX9n
jJDAZNggrhk4q3+EkM1TXaQ6NyRd8uMb6hK1x4MR9+wfsSQsT6jZlMJ2brndlgtT
tK8UAR+m+n3mGkRWXx/+a0u5RCGy0YXJeqn25ctAsVE4hmUWgW6vm1bspCZdFA3O
xvk40WhW6kafAWSbkeGt5BiDt8wD6L+9VQ/6ElT8ivlcMPv2S+GgDzmHgiC3T/40
NXXecxeyuER7yZsCTjni
=mQrO
-----END PGP SIGNATURE-----

--tbslvQKphTF8vBEECJCkWDMkFG79k2pmB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
