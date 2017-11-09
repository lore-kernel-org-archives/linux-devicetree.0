From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] add mali r6p2 dt node
Date: Thu, 9 Nov 2017 14:40:32 +0100
Message-ID: <20171109134032.rwhhf6pvcr6xrgol@flea.lan>
References: <1510049010-5758-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171107110539.3wrm6uu6ohh6dnuy@flea>
 <49715d2b-97f5-7e21-7072-8e050d471a9f@micronovasrl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7moi5ymdnlwkh2ni"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49715d2b-97f5-7e21-7072-8e050d471a9f-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7moi5ymdnlwkh2ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 06:55:22PM +0100, Giulio Benetti wrote:
> Hi,
>=20
> Il 07/11/2017 12:05, Maxime Ripard ha scritto:
> > Hi,
> >=20
> > On Tue, Nov 07, 2017 at 11:03:30AM +0100, Giulio Benetti wrote:
> > > This patch adds device tree mali node compatible with r6p2 utgard ker=
nel driver
> > > provided by ARM and patched by maxime ripard on his github.
> > >=20
> > > It can be easily used in target.dts with:
> > >=20
> > > &mali {
> > > 	status =3D "okay";
> > > }
> > >=20
> > > then loading mali.ko in user space.
> > >=20
> > > Best regards
> > > Giulio Benetti
> > > Micronova srl
> >=20
> > Again, you should have a proper commit log here.
>=20
> As log could it be:
> It seems there is not mali node in sun7i-a20.dtsi    << This is "Why"
>=20
> Add mali node to sun7i-a20.dtsi                << This is "How"
>=20
> Or can you point me to some example?
> I've tried to check lot of other patches,
> but really I can't understand which is the right way.

Not having your signature would be a good start, and describing the
changes would be great as well. You can comment on which Mali chip it
is for example, which variant, whether the BSP uses thermal throttling
or not, and if so why did you leave it out, which frequency it's
running at, etc.

> Now, to avoid any possible other mistake,
> do I have to resubmit patch corrected answering to this thread,
> when you give me the ok?

Please resend it yes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7moi5ymdnlwkh2ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaBFrQAAoJEBx+YmzsjxAgLh4QAK6epVBKyfPfUQPeiJsORuOv
gId7j+FmicUdeTtBhlIYx4f+L/FTXmcVOBFg7I+PMOW0ULCddOw5y7s/pUbsNnHR
G2XsDB3Aa6VYYEfRP4gB2DXhfITfNFBsAeV/IlG3naKPDUhHkTBlGZSBlKCndq2q
ZTSkSqNX+DDI7IwgUCHp7i6ALEF89+XUoTfbQ+r6yw7pWGYUBka5+xY91bcZLLWW
02loUBG50HtFzwZ5R5yVi8BltBcrQqV0O7Zn9dZyEuj1uS0BHydJLQomZFVg2BYZ
/97QjSCYGh7ZE6Xs5uiZqO4UE1J73CeUbfcrTkFFo/UZIqZSCCVyRghzQeXcrN5c
pbwjXLXfev3Z5YpL4Bb3MZDEQ9kuW8Bvm4QoUa768HKbUvkVJoA91nbkzgZNEsmN
OkonYdz7gVs3JVp3ZA/KGWmAN11W/M2ikErYw0zCoXHz8ePlqB75P7IWknptwBm5
YLW1YB4AF5AEleDRflM01TqUjEm/0xQcS7mn5WVpvTruug0G/OFFokiUMJDiJvlA
RbCJFMgPAp7htlNqE1v9ZmjGPCB/O5YF0GP9FeSRM+NOJChSBD1Iim5Brk+nsbh/
VGf5NXWbK7wJ4M9Cj+fG08uN3tw7DX+2oWil/UVZnhwP8weDwg4VR/hsYR3aj4xL
i/Lz9HqVClXshM9MWPVe
=JEHj
-----END PGP SIGNATURE-----

--7moi5ymdnlwkh2ni--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
