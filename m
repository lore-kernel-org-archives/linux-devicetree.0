From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Initial support for XPowers AXP288 PMIC
Date: Fri, 12 Sep 2014 17:18:24 +0200
Message-ID: <20140912151824.GU31276@lukather>
References: <1410477357-6407-1-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K6Vt3zCKtaqyTnPU"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410477357-6407-1-git-send-email-jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--K6Vt3zCKtaqyTnPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2014 at 04:15:52PM -0700, Jacob Pan wrote:
> XPowers AXP288 is a customized PMIC found on some Intel Baytrail-CR platf=
orms.
> It comes with sub-functions such as USB charging, fuel gauge, ADC, and ma=
ny LDO
> and BUCK channels.
>=20
> By extending the existing AXP20x driver, this patchset adds basic support
> for AXP288 PMIC with GPADC as one MFD cell device driver. It also adds ho=
oks
> for ACPI opregion handler driver which can be used to handle ACPI request=
s.
>=20
> Currently, the PMIC driver in this patchset does not support platform data
> enumeration. But when ACPI _DSD and unified device properties become avai=
lable,
> cell devices with platform data will be added.
>=20
> This patch does not use intel_soc_pmic core for i2c and regmap handling i=
n that
> axp288 shares similar programming interface with other Xpower PMICs suppo=
rted in
> axp20x.c. Therefore, extending axp20x.c to include axp288 makes more sens=
e.
>=20
> Changes
>  v3:	- put all file rename changes in 1/5

The variables renaming are still not in 1/5....

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--K6Vt3zCKtaqyTnPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEw7AAAoJEBx+YmzsjxAgYi4P/3ns+5+YnbGJGUxtQECppx2c
UV+PkBjF5Z/5EXr2WbsAv2pnqr0KoT0YYY41HyNeq3qvlFcvpteaTVvT08uj2z2m
F91dSWuTKkjkLCYorhlldhA7YakBKNCzgGHHNkyRP/sFimcxkexOvr9s1PMha7mC
bV655aqhnD6kvgyNlUwJabeNPt9af3QSrTTTpuKcwqu/qFsKJs2JhxuvncJLWQYc
jt0thJbaEq8C98PgXDOOHztGo7PqMq3sPRkp6D8jaqpRiY+ixAN8z5+2ZQnceh34
z2xaoMAlMRvp51Leb0QLnfDDd6l9QHB19FVchqMb2RnJ9ykrMKmRavxtojKKiCj7
jo/DdraQFHv89IzcWGGzIBFl76rl6KSNsMHZryqrnb0ocEO+2qjLkL/rMSt0wuad
lugZZfP9oLJDlT+KbQ3A0oLpr3qyxdnvWQLZgqdkSUCzD5kNuKL9/8hj+w4AdkwD
M4DgOyPsMIQVuh77TaIPEuQ5PhWtDfYpfB1PH1MeCkb3nL/ZgpIiVdo4gRD0UbRa
EauVIhBzZQKfip9FmTzEG/W8HsSD7cpDH3xFXrkn9OTIINp6E9cW7hQfrjqsPFct
n/ruVIevK8LZRtH1sgiamPl1bzejg649J5QVaIvfhHZIqgtmZOZ7jWCROoqtM6j0
stKgyUJUrKy/xqsuSHZd
=HkLt
-----END PGP SIGNATURE-----

--K6Vt3zCKtaqyTnPU--
