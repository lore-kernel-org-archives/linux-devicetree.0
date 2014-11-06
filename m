From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/5] simplefb: add clock handling code
Date: Thu, 6 Nov 2014 16:18:32 +0200
Message-ID: <545B8338.8060908@ti.com>
References: <1413996311-4287-1-git-send-email-hdegoede@redhat.com> <54534523.8080801@ti.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="IphvcSFB3B0gjC66LFiLCkv3nLlx4icoE"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBR4G52RAKGQEBBOKX5Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <54534523.8080801-l0cyMroinI0@public.gmane.org>
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

--IphvcSFB3B0gjC66LFiLCkv3nLlx4icoE
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 31/10/14 10:15, Tomi Valkeinen wrote:
> Hi Hans,
>=20
> On 22/10/14 19:45, Hans de Goede wrote:
>=20
>> -We will add a clocks property to the simplefb devicetree bindings, so=

>>  that u-boot setup framebuffers passed to the kernel (for early consol=
e
>>  support) can properly list the clocks used, and simplefb can claim th=
em to
>>  avoid them getting turned off, thereby breaking the early console
>=20
> Perhaps this has been discussed earlier, but I started to wonder if
> managing clocks is enough.
>=20
> What about regulators (to power the LCD), gpios (to keep the LCD
> enabled) and pinctrl (for video signals)? I guess any those could be
> reset by the kernel if no driver uses them.

Hans, ping. Have these been already discussed?

 Tomi



--IphvcSFB3B0gjC66LFiLCkv3nLlx4icoE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUW4M4AAoJEPo9qoy8lh718cQP/3ThDuUm0A1wtqSE/90n26yE
njDY6ZeNa5bw5xKjnk6LGOf2GwNzXFCdEop7P+U8FqKLvlDZWG6Md8NhwITBIYyh
Xa8mqf06P5gWoV9d3tpkUp69h6Wuwdk8Xb0+P9DNPqMTWbhk8T2TGwW1HBWclXhv
Fo1g45fFdXCx6H7h343PlhJShGmz+9t+rdP3uS/jga2beUlLpliOXk2YuX81Kro/
SNU+QawCXrN/Efv8JBREblhkTzxvXqRsZP7g5so/HhhTqmnOeNKHkIelCfvhDkmQ
jHCwqwZNvbmrKRv+GfQawVy6X/+tUesjRMgsTTN0j+k52jVFR//GIznz1/1kMpUZ
gAquwlOFogow2Dxu7O91FCEhzM6nNj5AlPu/eSguf6g2y2eAb0zxyk6p/JQKENYz
sUxBWX59uHFPY37QfSOtY3wEmJTl/5BzbxyFnRGSIinaU0JQ8KYlE0I7NncXRNqw
M6BmTjO7//dwvzqRRjuEG2GTCPMfGFrb34eqRvb+zgTJtLlFXo5nTp7BN6wUR1Fx
Sbyg/bnFNUISXJfZBdoTT8O3LMGfqZ1owO7vaHmoF7qghKBLEN17xEyIOw70JhlM
bZPIH3Paa9Xmj0uSxp44tr0R9Sm5ShoRnO3v2Wz6CQ35rcBPzNj4NKnWVUWVNQxT
owpCViiN7evgM2EeLHd3
=CC0L
-----END PGP SIGNATURE-----

--IphvcSFB3B0gjC66LFiLCkv3nLlx4icoE--
