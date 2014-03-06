From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/2] video: ARM CLCD: Add DT support
Date: Thu, 6 Mar 2014 12:21:34 +0200
Message-ID: <53184C2E.3000807@ti.com>
References: <1394036606-17784-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Akl0XEf6Nn5aTGssPp7GFb60uLQ0kXm0n"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394036606-17784-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jonathan Austin <Jonathan.Austin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Akl0XEf6Nn5aTGssPp7GFb60uLQ0kXm0n
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Pawel,

On 05/03/14 18:23, Pawel Moll wrote:
> This patch adds basic DT bindings for the PL11x CLCD cells
> and make their fbdev driver use them.

Is this an old HW, and presumably there won't be new users for it? If
yes, this is probably fine. If not, you might want to look at the video
ports and endpoints, which is used by at least three not-yet-merged serie=
s:

[PATCHv3 00/41] OMAPDSS: DT support v3
[PATCH v5 00/11] imx-drm dt bindings
[RFC PATCH v2 00/21] Add DSI display support for Exynos based boards

Using bindings like that would be more future proof, even if the current
driver doesn't use them.

 Tomi



--Akl0XEf6Nn5aTGssPp7GFb60uLQ0kXm0n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTGEwuAAoJEPo9qoy8lh71pdEP/2+bLsds4O6LJTNLLU4mTkCf
L+nkfM3QlX9GJlNXXJ8J9V0jrZwMgMXQBnXQyBxhYT2kEaOydtuMakKFSM70FvuZ
+o4XhHfH6DkzzJcz7OmNjfdKUQ4SmSbiPoGnheCv3TJA5UZRCeyYyO8VAACTNUDi
B9jWE2cR1h/HBQvgtwggoPfpA/GgjCwQhucoFIE7a5DXIEmaUR3ZVRY/raFatDub
0uIGZMkog9PYp+iRKTZwc0ogdqXBUoz/0xyGN+m+V1ZClP+QD9GaD0J7aWoR4IB1
GVIZ05I12xhZMM3YCHh6Prmv1urmzGop7Mrlv9iB/64KVXuUz9aF7blGtPi8tC2+
ZWrCHEN+cZBwLYhTbhd/T7ZOMbDybVGoRjaLlstqsVe2hdCISbLatS+4J16hR5X3
t3LurMdcP0cIULHyO7XFe3GSfBkKYVy1r1Md8RNFFQPvNs3KnTJA23I3bU+AIVdA
haAiGqijShmAS08iDMc0V99cAN+n6hlsjwNzQCDfGiBM9bYKY6yBH7Cceqr/NTh6
6gNY3tM4I/Sz4795g6gy1UQx96wHCXPhNlxH+2T/Re4T8mEYeY0aSV+BIIWvZMdp
onSJNrMbJBXryugWRnM6duO5ABoYgILSF/8p3iNPE1b35REcguWLry3u7VDf29Na
79Zmz71bR6agdtp8Ed8z
=tX/s
-----END PGP SIGNATURE-----

--Akl0XEf6Nn5aTGssPp7GFb60uLQ0kXm0n--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
