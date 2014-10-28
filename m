From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Tue, 28 Oct 2014 12:44:10 +0200
Message-ID: <544F737A.7000109@ti.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="OlxhDqcf3w05tM4r8FnJdrENGuXD7ElC7"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBC7HXWRAKGQEHZBCMMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1413996311-4287-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--OlxhDqcf3w05tM4r8FnJdrENGuXD7ElC7
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 22/10/14 19:45, Hans de Goede wrote:

> Since we seem to have broad agreement on how to move forward with this,=
 I
> would like to ask you to please merge this patch-set for 3.19.
>=20
> I know 3.19 is still somewhat ar away, but I would like to submit the u=
-boot
> side of this to upstream ASAP, so can you please let me know if you pla=
n to=20
> take this patch-set for 3.19 soon ?

This series looks fine to me, except patch 3 is missing a description,
and patch 4 makes the desc a continuation of the subject. Each patch
should have a description (independent from subject).

No need to resend, I can cook up something for those, or I can edit the
descs if you provide the text.

So if there are no strong objections, I'll queue this for 3.19.

 Tomi



--OlxhDqcf3w05tM4r8FnJdrENGuXD7ElC7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUT3N+AAoJEPo9qoy8lh71m+0P/0LdN7HM5Utmnuza5UDHOO2P
fD3h4p7EDUvGxP+kE7QwV+2YNnY1cGWHIDy0wL0URrRpVrtV9BVrpLHssIPqWCQt
w3IE9fK8S3vpkw21YQdN+vz0HmzESM52kODAjn1seiLtCSuytEXIBSym/bMQP6DD
W4sY99+8Rww68mmD3l1Jv3yMX2GyovMPmmQYLGbpNfKdpcVNYIPDBwbfS0udEePt
jq7PzWj9niC1CVEW7/LxklowDG89p3yuh1bQsHhPnpqqX8paxIq3pDx151+qRdH3
gsRBPwRzJik4BiLRkHqYy40svhq8cPWgsR8cyOLkSQ0/zFGzDEuX9nxxRQbuMU/5
tmhbYCV2+cidlMytPHNVMpGYXqBme6nA7cKyIsswk8lj2G4fX52tArQH9dMJl84l
HxqXDfj4+O2sRksPwc9IdXeQ7RE6zET8ZXU4rJ/sA9MqgUjVmJsryG4X1cQSrG7K
npSC1+ZLtDQ14I8v03IzP3Nb7dqY94AAgJqJWKkMwL1DIYdO5MH3jDh22IXv1VVV
3f29epRXrcEBl4EjEldg8xNnX/U301c0fhBhZq636rx0XuAEi68j2/E9xhre33JW
4Zj8gZfNU7WlKNZRI8fRdiRuPr6zx67JtNC3zlD0DHSOLL9RPxewbzys+oNgwrRV
uRjDW0XAeZAaohs7+RFA
=NbE4
-----END PGP SIGNATURE-----

--OlxhDqcf3w05tM4r8FnJdrENGuXD7ElC7--
