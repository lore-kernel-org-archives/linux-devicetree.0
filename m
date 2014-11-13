From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 0/5] simplefb: add clock handling code
Date: Thu, 13 Nov 2014 18:22:42 +0200
Message-ID: <5464DAD2.5040505@ti.com>
References: <1415808952-23549-1-git-send-email-hdegoede@redhat.com> <CACxGe6ua8OF5+SNjgO3Nc5ZSVvaic3OzrFES-5=f+bsj-fvE3g@mail.gmail.com> <CACxGe6ssdeOnQnem1012h_jFK1wWOD_WwosjFgiAcgBoqyDt9A@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="DQWa9XcFRIK46LUSVgrfulOQdUPRvDduE"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBXFVSORQKGQENDLCLKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <CACxGe6ssdeOnQnem1012h_jFK1wWOD_WwosjFgiAcgBoqyDt9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--DQWa9XcFRIK46LUSVgrfulOQdUPRvDduE
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 13/11/14 18:05, Grant Likely wrote:
> On Thu, Nov 13, 2014 at 7:38 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=
 wrote:
>> On Wed, Nov 12, 2014 at 4:15 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> w=
rote:
>>> Hi Tomi,
>>>
>>> Here is v5 of my simplefb patch-set, this time with an Ack from
>>> Grant Likely for the dt-bindings bits, which should end all controver=
sy
>>> surrounding that patch.
>>>
>>> For changes since the original postings please see the per patch chan=
gelogs
>>> in the patch commit messages.
>>>
>>> Please merge this into your tree for 3.19.
>>
>> Hi Tomi,
>>
>> I'm discussing this with Rob today. Please hold off 24 hours before
>> merging. If you don't hear anything to the contrary by tomorrow then
>> go ahead and merge.
>=20
> I just talked to Rob. All is good, you can apply.

Ok. I'll apply tomorrow if there are no more comments during the night
for the new series, and the compilation issue has been solved.

 Tomi



--DQWa9XcFRIK46LUSVgrfulOQdUPRvDduE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZNrSAAoJEPo9qoy8lh71ogMP/i/Ae6CzfHaeU8RVb1J06Xyo
8v34UGlKGLLa8zrzxCylJqPvrA4X974i7n4858BnUMZ/f80Lq9uJ4oOxSFp1Ighf
v8BIiTE73iMjFkkLxxwEP+OjPEat7KSo3uJ2qFMqI14veW36Y/tcT4neFo6dqkdT
ZArbvwwwAbrXSZ5N0GzXDPNmSR5unkrxccQSneuzz2NnpCFJEQ98tZovB9C7HurG
EjdB9UJtbAFVMME7VYKMmEJ1So6lZhwMDb3BjDAm3RSe1ScaqzaPwYZqcEudfH5j
OCn72cPeobzQbgWiQi16EFZ9hgHLHp++Sjn+egpVCYbABErFJDvggvEoCMmxMxkn
GvrIxguOo2EWWPS4N+LcrG9mJr9oYwWPCEOBKnSvil9BxhmCQnQitQ/TtkfITJ70
uUnYllEl7GpCv+T+ufmrsTARPL6pLh36x4dieYMfKJkeX/ZPpGu5k4lsUED9ndQg
6GKOCLvAoMJVqucN6EVLT1Zto/PRacem0KP96HRNO7XyXXB6XcZ8Cd9V6+YVBNI9
Thv8wC8TeLM3L9PkgEsMYrMO0GYv5d9fUwkzOJMrb+tyumsxsCu7sZlNxSfXAgr1
YFgBZ7+6Nv7Q/gykM7PuuOdAuSJDKvzlYcAoKSwu3dwectiknBymUNrFk4LgrKxD
NA/sdID3CbIGQf1S94wy
=ZpwK
-----END PGP SIGNATURE-----

--DQWa9XcFRIK46LUSVgrfulOQdUPRvDduE--
