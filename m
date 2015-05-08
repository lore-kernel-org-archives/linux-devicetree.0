From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 3/6] usb: dwc3: dwc3-st: Update the incorrect DT dwc3
 example.
Date: Fri, 8 May 2015 11:36:13 -0500
Message-ID: <20150508163613.GH16571@saruman.tx.rr.com>
References: <1430400652-3366-1-git-send-email-peter.griffin@linaro.org>
 <1430400652-3366-4-git-send-email-peter.griffin@linaro.org>
 <20150507151358.GA14123@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150507161555.GA29183@saruman.tx.rr.com>
 <20150508103140.GA15502@griffinp-ThinkPad-X1-Carbon-2nd>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K1n7F7fSdjvFAEnM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150508103140.GA15502@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Felipe Balbi <balbi@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2015 at 11:31:40AM +0100, Peter Griffin wrote:
> Hi Felipe,
>=20
> On Thu, 07 May 2015, Felipe Balbi wrote:
>=20
> > On Thu, May 07, 2015 at 04:13:58PM +0100, Peter Griffin wrote:
> > > Hi Felipe,
> > >=20
> > > On Thu, 30 Apr 2015, Peter Griffin wrote:
> > >=20
> > > > There is a subtle typo phys-names should be phy-names. Using the
> > > > current example means you don't have working usb (as you fail to
> > > > obtain the phys). Also update the example to use the generic phy
> > > > type constants which are now used for miphy28.
> > > >=20
> > > > Additionally also remove the unnecessary new line in the example.
> > > >=20
> > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > Acked-by: Rob Herring <robh@kernel.org>
> > > > Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
> > >=20
> > > Can you take this dwc3 DT doc update patch via your tree?
> >=20
> > only this patch ?
>=20
> Yes, I think the test will go via Maximes STI tree
>=20
> > Sure. Just post on linux-usb and I'll fetch it from
> > there.
>=20
> Brilliant, thanks. I've sent it see here https://lkml.org/lkml/2015/5/7/8=
09
> with linux-usb on CC (sorry for missing that off the first time round)

it's in my testing/next now.

--=20
balbi

--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVTOX8AAoJEIaOsuA1yqRECLcP/2lAub6R8/+Xjbk3VKPnjFS7
BM9Yh2qKlnpAUD1P1vW9h5s9iHSKQBLa0h4qno4sp8IQxtO21SsRuMtZ+tnuvp3D
BsIQfpHk8gFKMi3Ov6manIehR6ZWp5nLG7m3jvXTyBpQ1hal//jOVQGTs/hJaBp6
WfQzcsDoOVRKowXihktbh4c9RI5AF39iGgraRs8Nj7d9i5NrAtQ81RaMD3h5SVCO
vgCpozP0wDDU1bMw9/nt+4Z0LYey4BnLce2e2f+CuIbE93ipzdNdFjnBxObkYSl6
i1LQws0ZzE6zUF5x9HYIJW/r6liqYUSNx0L3Sqe8wvId0UtL11LQYLO+mY49Z/mW
hk510MkVnVCmKQUyvgFINC8tDeBgcWNTbUl7zlxQL33Hdd/EoLdx4dbFve7lQD2B
SkaC987+33BDruJdvDF7d3ZRrNAJ6hF0mqf4ja5tTcSCndE5EmWI4rUJ+htPGdVp
Ye73uXw/bh+HWYzJdWR+ge5AomRJCGJeU7FmgejE0fC7uYLmooLDnVohce9sbrjy
+cjKNYDjzc3LrrXftu84cV/n/4qh7N8xUl2YuAQNSAJwRK/VTrlGG1GuFfCYKzsQ
m+qSFvhiZPyKt4n3HPMzeZlTMTN1admJSEasr9FyeI/4wLxGAgaHnoihKwFLWSwx
FFxvFz01F8lNBVU3x9GF
=mfbB
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--
