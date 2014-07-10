From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: a case for a common efuse API?
Date: Thu, 10 Jul 2014 17:09:45 +0200
Message-ID: <20140710150945.GF27469@lukather>
References: <53BC4DD7.20906@codeaurora.org>
 <20140709083509.GQ13423@lukather>
 <53BDD0F3.7040906@codeaurora.org>
 <20140710142616.GD27469@lukather>
 <53BEB443.9000606@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53BEB443.9000606-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 06:41:55PM +0300, Grygorii Strashko wrote:
> On 07/10/2014 05:26 PM, Maxime Ripard wrote:
> >On Wed, Jul 09, 2014 at 04:32:03PM -0700, Stephen Boyd wrote:
> >>On 07/09/14 01:35, Maxime Ripard wrote:
> >>>Hi Stephen,
> >>>
> >>>On Tue, Jul 08, 2014 at 01:00:23PM -0700, Stephen Boyd wrote:
> >>>>Hi,
> >>>>
> >>>>On MSM chips we have some efuses (called qfprom) where we store things
> >>>>like calibration data, speed bins, etc. We need to read out data from
> >>>>the efuses in various drivers like the cpufreq, thermal, etc. This
> >>>>essentially boils down to a bunch of readls on the efuse from a handf=
ul
> >>>>of different drivers. In devicetree this looks a little odd because
> >>>>these drivers end up having an extra reg property (or two) that points
> >>>>to a register in the efuse and some length, i.e you see this:
> >>>>
> >>>>	thermal-sensor@34000 {
> >>>>		compatible =3D "sensor";
> >>>>		reg =3D <0x34000 0x1000>, <0x10018 0xc>;
> >>>>		reg-names =3D "sensor", "efuse_calib";
> >>>>	}
> >>>>
> >>>>
> >>>>I imagine in DT we want something more like this:
> >>>>
> >>>>	efuse: efuse@10000 {
> >>>>		compatible =3D "efuse";
> >>>>		reg =3D <0x10000 0x1000>;
> >>>>	}
> >>>>
> >>>>	thermal-sensor@34000 {
> >>>>		compatible =3D "sensor";
> >>>>		reg =3D <0x34000 0x1000>;
> >>>>		efuse =3D <&efuse 0x18>;
> >>>>	}
>=20
> Why don't use "syscon" framework for your needs? (mfd/syscon.c)

Because syscon is restricted to MMIO, and not really meant to be used
for this.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTvqy5AAoJEBx+YmzsjxAg9FEP/AzTKdqhMRjA29BuXRb3H+w4
faFCHslPItZ4KDb84Wy+UT3SI7DTTzg+oUFH4csXHUhm4xWEGcKstOQA/c3SULgC
CBAnFlqLRdExiKticYxmtjnqI1K70DwnkjH/Lts9ICdHqaOhvwcs77C5dc46jsAs
sKd15NAAvFTXidNwtU37iOR2ZY3DiWJfAcpSeUa1TtK+GzSMskTxX8Tnm0q97hFG
MgHjDLCXsHbM2t1en5zCCAgJ5GXw9p3B2urweEvQW/bzc1ybTxp/mfvHLIvM93vF
K9ie02+ErG3ML4K80Ts/OXbskNa2Q4GT7CPIleHC2Ic/urfsJrsWv7cJpCUXU29S
wuPSHfGdbtfIgbsTpIrF/TzqKEFmcoLTqHdS2umhrweAg9l/lnLiL8Ffk56wbbD5
oUlpwJtB8vKCEwTvbv82hJKHyq0bmgjiiD7md6XbsgjDhMtzVCziJOBndHozVbEM
m7cm396lA9L38pRiBCYuPxwqnDO83McyZERtZDognUh3eH4aLCkqA1EQQxYBGyvG
hiX6LqjSx1HvnvLtFMgq5GXDzfmk0fXnptxwm4TQgrUqWR6X2yHzyw2aN15FO0Bi
mMuY13Fq1jyOKATZMxwIO9ZTNogWK5+vjLb2Ss/OrsEMPOEIDmXDBPc+i8MZs+OM
pQTmDg/2NFF6CohLfrX7
=BgiY
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
