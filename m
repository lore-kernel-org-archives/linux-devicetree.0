From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sun7i: Add Cubietech Einstein A20 board device-tree
Date: Fri, 3 Nov 2017 09:44:27 +0100
Message-ID: <20171103084427.rba6zc333fawbrv4@flea>
References: <20171102143534.19353-1-mailinglists@kunz-im-inter.net>
 <20171102155736.qab746tkaspfe47n@flea>
 <4661874.z7VF5iD9hg@donald>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wdep34szyz3jantr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4661874.z7VF5iD9hg@donald>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Kunz <mailinglists@kunz-im-inter.net>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, wens@csie.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--wdep34szyz3jantr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Thu, Nov 02, 2017 at 07:59:04PM +0100, Frank Kunz wrote:
> > > +&mmc2 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&mmc2_pins_a>;
> > > +	vmmc-supply =3D <&reg_vcc3v3>;
> >=20
> > What regulator is this connected to on the PMIC?
>=20
> Fixed, On the schematic it is finally connected to 3v0.

Sorry, it wasn't really what I meant. Surely there's a PMIC regulator
providing that 3.0V, you should put that regulator here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wdep34szyz3jantr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ/CxqAAoJEBx+YmzsjxAgouYQAIGUYXts7t+FnLqRYN08Aeb2
xfP2egMD3aoevk9coy250DrnFa0Xv/qyJPcXwFD0+Z+Ku2W/MFaxXP/eLin9YzLe
75BlZ9c0SBl8Oims8m9JnznxbA3YBxruofhdwSkr45IbdU+ms+Qu1QxprcV/tujo
mMwZiI5VzitUxjVqXqVxIkRMVJWiXpFuvkNgYWuC2ZVJ8vJoGWEMYqln52r7je4t
0+LFQWQ9f5Gok2iK5ruSp4nPzQT6AncIWfCcDVN/LiIJIXnWsujNk8Vqm7099/i7
tagwy5aS6XUh07286rEBnPpE/r7JIQpiBHX/ihpnQSxkoQ9K9QCFy38e7CggZYhs
d928kHEEDbK2yjRDNOQgKC5nur+vnwnfnKtJu97SZfQEmzlyqBIvjcGhjbKqqjiU
kl+8sAcP2zzVM9ZUhTNNGCbvUKnyXhG5LFDbrAOdefbZ2N6pTvHQm3HaYsBqZ3S2
3DNORY9VJXLw6fhIvrGhi9QHRF76Gz+fJi5kNdpx9o16A2cjnjLe8x/mQTQHGxqz
Z1TZ8ACF3apN8/RgaEI5ikqHl1Kw5MpfyuoB7OxK9T/uzYsurTUti5+f3XHhMGAk
S7AGGDXA0oIMJAsWQOZSCrAmD7HBlQ4WZPuqTjG9/jU1Bpz0beqQyRm67AIfvf2u
gQCfsHJWBJBQkNR7wlb4
=fx5y
-----END PGP SIGNATURE-----

--wdep34szyz3jantr--
