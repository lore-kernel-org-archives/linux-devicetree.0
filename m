From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Fri, 31 Oct 2014 10:15:31 +0200
Message-ID: <54534523.8080801@ti.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ER492xxKe18xpMuW2luQFtQPIs7CSwEuS"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBLUKZWRAKGQEU4TC64A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

--ER492xxKe18xpMuW2luQFtQPIs7CSwEuS
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On 22/10/14 19:45, Hans de Goede wrote:

> -We will add a clocks property to the simplefb devicetree bindings, so
>  that u-boot setup framebuffers passed to the kernel (for early console=

>  support) can properly list the clocks used, and simplefb can claim the=
m to
>  avoid them getting turned off, thereby breaking the early console

Perhaps this has been discussed earlier, but I started to wonder if
managing clocks is enough.

What about regulators (to power the LCD), gpios (to keep the LCD
enabled) and pinctrl (for video signals)? I guess any those could be
reset by the kernel if no driver uses them.

 Tomi



--ER492xxKe18xpMuW2luQFtQPIs7CSwEuS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUU0UjAAoJEPo9qoy8lh71Rq4P/iBMueYx1qH1hmpij6KbM3zy
xv920ZWRO6ZmV+lvcZRE+rFJJHkjqOySvcZZxrM35Kfdmu3DgtPKAZmVlr296bhK
Ler9dTX7oXjDJ1liOD+C+5GRLqpr74wWX2bDtjfhdjsQBtHIOkFVyv0/hO0G+wee
X+6aiYlBBbRLizzYTPEyBLTXkI57WmfnPtLfs+11rS7FrFk+LwZ1trdGJjwY3/C3
P+kJkYrd8b5s73giOXsfgsKK4j9rMnfP3eNlEABjBPY+JRN0kQbC3PGoNKJE+CXA
kkJFvxc1WdkZMFoVo32wQm2dQYEz6qPQxg4gWYJGiJrIJ3LRlep3yVPSvOafAOpu
y+7KK98JgzG2wx18y2dPqbJSuTZiF/ndeiysXtHftnjDvJJaVr+OIJrPKpLrSyj/
oqUOIjB7Qs1JWFZ512u67gGzm+cN2oagnGDAW3pCOVmvMXmPCcJk2X0dSDSd23cd
t6ewYybrZP5ip95vAyhFk2m9C3PbnFWWV6NKflG9vEklC9fZFKHTrXMd4O8UTBgO
0T0IXt8KLfvLCY9jWzU6Ve9mYjttUxrAaI8hjqHLb8L/BgJc9NhZ26QX1YVoYmqt
6Pk0Dyry/4vgSvKMzew3eXOe4vwqMW/G4I7NWnqf+R8yHitjHKHlzJWSiqNAczv1
0VdACYy3HLfIbv2oryev
=m8dE
-----END PGP SIGNATURE-----

--ER492xxKe18xpMuW2luQFtQPIs7CSwEuS--
