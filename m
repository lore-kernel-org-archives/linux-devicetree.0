From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: How to represent negative values for device tree property
Date: Tue, 2 Apr 2013 17:29:25 +1100
Message-ID: <20130402062925.GJ7426@truffula.fritz.box>
References: <5159F760.1080605@codeaurora.org>
 <515A038F.2090902@wwwdotorg.org>
 <515A2533.8050005@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <515A2533.8050005@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2013 at 05:24:19PM -0700, David Collins wrote:
> On 04/01/2013 03:00 PM, Stephen Warren wrote:
> > On 04/01/2013 03:08 PM, David Collins wrote:
> >> Hi,
> >>
> >> I am working on a thermal driver which needs to be able to read a
> >> temperature threshold from a device tree property.  The hardware suppo=
rts
> >> thresholds in the range -204.8 to +204.7 C in 0.1 C steps.  I have fou=
nd,
> >> as I am sure others have as well, that dtc treats a '-' before an inte=
ger
> >> in a dtsi file as a syntax error.  Therefore, I need some artificial w=
ay
> >> to represent negative numbers in device tree.  Here are the possibilit=
ies
> >> that I have thought of so far:
> >=20
> > Doesn't the very latest dtc, which contains integer expression support,
> > allow unary -? I thought that code had been imported into the kernel
> > (goes and checks) yes it has. What's the error you're seeing;
> > over/underflow or syntax?
> >=20
> > That said, DT cells are supposed to be u32 not s32, so perhaps this
> > isn't unexpected.

That's.. sort of true, but misleading.  As far as the dtb format is
concerned, properties are just a bag of bytes.  Individual device
bindings define how software should interpret those bytes.

The dtc data "types" are really just convenient ways to enter various
sorts of commonly used bytestrings.  Some of the dtc code treats cells
as u32 because that works for its purposes (and in particular avoids
some nasty C standard gotchas where signed overflows may have
undefined results), but there's no reason you can't treat it as an
s32.  On dtc versions recent enough to have arithmetic, unary minus
and subtractive overflow will use 2's complement, as you'd expect.

> It is likely that my dtc version is out of date.  dtc -v outputs 1.2.0.  I
> will try updating to a newer version of dtc.  The error that I currently
> get is a syntax error: "FATAL ERROR: Unable to parse input tree".
>=20
> Does the device tree binary documentation define any format for negative
> numbers?  Unsigned 32-bit integers are clearly defined as bytes in
> big-endian order.  I suppose that you could assume 32-bit signed integers
> are 2's complement with bytes in big-endian order, but that would need to
> be well defined somewhere.

Yes, it should be defined somewhere, but that only needs to be the
binding for your specific device, not anywhere more general.

> Assuming that dtb has no well defined means of holding a negative integer
> value, then what is the most elegant workaround to specify a negative val=
ue?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFaesUACgkQaILKxv3ab8bjrQCgkaNoQfgPio/ax9IDpjA7E/VQ
0x8AoIEvzld5ROdU3Xcu2EEuzITb5+pr
=aMxW
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
