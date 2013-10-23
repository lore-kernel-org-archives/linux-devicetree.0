From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Wed, 23 Oct 2013 22:20:12 +0200
Message-ID: <20131023202011.GD8828@mithrandir>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
 <20131022045833.GB17512@ns203013.ovh.net>
 <20131022072307.GA8681@ulmo.nvidia.com>
 <20131022153445.GD17512@ns203013.ovh.net>
 <20131022200141.GA8037@mithrandir>
 <5267FE81.3070201@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5267FE81.3070201-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 05:51:13PM +0100, Stephen Warren wrote:
> On 10/22/2013 09:01 PM, Thierry Reding wrote:
> > On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe
> > PLAGNIOL-VILLARD wrote:
> ...
> >> I'm sorry but the blacklight descibe in DT have nothing to do
> >> with the common pratice that the current driver have today
> >=20
> > That's not at all what I said. What I said was that the majority
> > of backlight drivers currently default to turning the backlight on
> > when probed. Therefore I think it would be consistent if this
> > driver did the same.
> >=20
> > I also said that I don't think it's a very good default, but at the
> > same time we can't just go and change the default behaviour at will
> > because people may rely on it.
>=20
> It may well be reasonable to change the default behaviour for devices
> instantiated from DT. If it's not possible to instantiate the device
> from DT yet, then it's not possible for anyone to be relying on the
> default behaviour yet, since there is none. So, perhaps the default
> could be:
>=20
> * If device instantiated from a board file, default to on, for
> backwards-compatibility.
>=20
> * If device instantiated from DT, there is no backwards compatibility
> to be concerned with, since this is a new feature, hence default to
> off, since we think that's the correct thing to do.

I actually had a patch to do precisely that. However I then realized
that people have actually been using pwm-backlight in DT for a while
already and therefore may be relying on that behaviour as well.

It also isn't really an issue of DT vs. non-DT. The simple fact is that
besides the backlight driver there's usually no other code that enables
a backlight on boot. The only way to do so that I know of is using the
DRM panel patches that I've been working on.

That said, it is true that the number of DT users of the pwm-backlight
driver is smaller than the number of board file users, and it is much
more likely that people are still actively using them, so if we can get
everyone to agree on changing the default behaviour that might still be
possible.

Thierry

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaC97AAoJEN0jrNd/PrOh1jwP/3lJW9EpGLtJIzpZNlIbo2nj
yklgtjfal3Gf6ceyXGE8e1GmsUEzMeRHkGyqqY8hbwCzflddPZ87sVCEnma3tDH3
BnC4xLEj9OkfnaGCVJr76Po7qNW3/8hCbhAxkePVRldmtScyFaOLfzO3fNBnSfFF
/IBNZz2aetq+ts4CqWbsWgmKpoBVTEYfCAS+MDKyjR7GKUMPOsCQhjgvRAYAoVyG
maL5z451DWc+HjpgP/MZoRaRPwIl7vHmw/JvyU4Pdv4uazRH+y+cV+sgt9PwyH+8
L0ZScigvtmPKq10LytBPD8L/vSv3rJaD9vr7IJCdCDI8pLRO9QfzMBYGSSwM1Jle
HWzReDZ7PAnIjifg7gaXkFL01EI8D+kyCylfYHrFKEaF+SH5GxPkcqt93U8jjdJi
g9+QEvoPURJayZAAc2qOE4RVQJ+PHJPag41sdS3rXl9xRsJXsexBhsNicPejxzkA
QFBWWpYoG0BvEMCj5fbaLkgbaXuFf3DCrS5zkuXoyeEMwQqX2xr7lWlDo/vP+H8X
MQaRg1Ck5FK+u8LjosWXpfJVUqO/629A8FR1361lriAt5bebMnnsTTkCsSvXOxb5
KhyLKQYI/IGjMBQoDWPYOn+KKrPhfBStNDJo8SFzoeF09AFHi53KL7CsjzjAgfMZ
7SX0cHZWtz2beVnrWNgP
=VeEb
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
