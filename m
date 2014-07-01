From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: dts: sun7i: Add board support for
 LinkSprite pcDuino V3
Date: Tue, 1 Jul 2014 09:59:58 +0200
Message-ID: <20140701075958.GJ28647@lukather>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com>
 <1404165479-23785-7-git-send-email-hdegoede@redhat.com>
 <CAGb2v65mDnuwveUiTKU2J3b3jbNzRLvPjS+wXNEj2MRtDN4Q2w@mail.gmail.com>
 <53B25F60.2050704@redhat.com>
 <CAGb2v64KMxXQ7QaRcsWxHbCLNJtWkh5sxj82C-y9GyNW7R+M_Q@mail.gmail.com>
 <53B2638A.3060206@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bWEb1MG/o7IKOlQF"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBBGVZGOQKGQEDIL7ZGI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53B2638A.3060206-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bWEb1MG/o7IKOlQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 01, 2014 at 09:30:18AM +0200, Hans de Goede wrote:
> Ok, I'm not seeing anything for 3.17 here though:
> https://github.com/mripard/linux/
>=20
> Maxime, can you push a sunxi/dt-for-3.17 with what you currently have the=
re?

Ah, sorry, my bad.

=46rom 3.17, I started to use a kernel.org git tree there:

git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git

And forgot to notify you.

There will also be linux-next coverage for the patches I gather.

> Then I'll rebase this series on top, fix the commit msg thingie Chen
> pointed out and send a v2.

Fixed the whitespace error, the conflict, and the commit message, and
applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--bWEb1MG/o7IKOlQF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTsmp+AAoJEBx+YmzsjxAg1iAQAKRDikCOnU83J92AMk7bosQa
ybItW2/8K1CSyKSTFPGuXrJ/MQuVjzSjTu43TOYs23y7+bgnhrYveJtyjTWkV9Rk
fm83rA+QVXOAIPHQum6WZjtqtXQfs4EWMTiKcMPIhfB4uAUfOt9O1Yl/rG/3xE3B
Tgp7bizcHdLUtS5oalRBRbNKnATO3W3CNbkt/rz5D+foZ3igrWPWK5DUYszLJhDR
DrpPN6okvXP1v3N6dL1HNX8xtOniLQR6Hi4+Vgp3TqJDzqNtrWlets29OpZoihAH
bnN2WQ/jfTY9vWYk5VBqzOnAhy+zO+QtaR7V7u3m/3XRnYSzVjbDY77D9o30tyAW
Ei+9mzbD2iiIwn+p50gK5xLPsfMvZ3gKwei+LH/5gQdRT6ufglwDT6goU1F5mnv/
u3nZ4DGEQYRlqdKRvn3MX/CYuHWJfiZvhMZX1iIZDdHZgIrFrLZXnxCHZjNhx7ra
TnSX1XgjWwwVpaUaKElXODUkV1ASfYY99dF35uU8D/6smz6qlXxfQG2sGPegXGcR
thfjgQgZ6GbaGYfzIp0E+1a/njfDK3D3g4gUgzPoLigCFg7q9lbuMfRNKEhxCWCA
TxI8OuspkrUlSIFbvh4gdqXmpkVKGShrnPaBqucbcO4GwPLBthvDOccu+e3Uod2k
mlOcxPMW+EjEFIh1zPoR
=UUmd
-----END PGP SIGNATURE-----

--bWEb1MG/o7IKOlQF--
