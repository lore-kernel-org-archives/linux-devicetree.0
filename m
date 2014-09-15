From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Initial support for XPowers AXP288 PMIC
Date: Mon, 15 Sep 2014 11:02:55 +0200
Message-ID: <20140915090255.GD31276@lukather>
References: <1410477357-6407-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <20140912151824.GU31276@lukather>
 <20140912123645.3bc6058f@ultegra>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R9b51G30WkD62Ue3"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140912123645.3bc6058f@ultegra>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--R9b51G30WkD62Ue3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2014 at 12:36:45PM -0700, Jacob Pan wrote:
> On Fri, 12 Sep 2014 17:18:24 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > On Thu, Sep 11, 2014 at 04:15:52PM -0700, Jacob Pan wrote:
> > > XPowers AXP288 is a customized PMIC found on some Intel Baytrail-CR
> > > platforms. It comes with sub-functions such as USB charging, fuel
> > > gauge, ADC, and many LDO and BUCK channels.
> > >=20
> > > By extending the existing AXP20x driver, this patchset adds basic
> > > support for AXP288 PMIC with GPADC as one MFD cell device driver.
> > > It also adds hooks for ACPI opregion handler driver which can be
> > > used to handle ACPI requests.
> > >=20
> > > Currently, the PMIC driver in this patchset does not support
> > > platform data enumeration. But when ACPI _DSD and unified device
> > > properties become available, cell devices with platform data will
> > > be added.
> > >=20
> > > This patch does not use intel_soc_pmic core for i2c and regmap
> > > handling in that axp288 shares similar programming interface with
> > > other Xpower PMICs supported in axp20x.c. Therefore, extending
> > > axp20x.c to include axp288 makes more sense.
> > >=20
> > > Changes
> > >  v3:	- put all file rename changes in 1/5
> >=20
> > The variables renaming are still not in 1/5....
> >=20
> 1/5 is for file rename such that the follow up patches are more
> readable.

Which is exactly my point. So why don't you apply it to the variable
renames as well?

> There are so many details in variable rename, I think it
> belongs to the patch that expands the new device support.

This has nothing to do in this patch. Remember that one patch should
do one thing. You're obviously doing 2 in the second patch, and just
like you pointed out, the renaming just make the whole thing less
readable.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--R9b51G30WkD62Ue3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUFqs/AAoJEBx+YmzsjxAgPAkQAMGFCxzRtfjphmFUPJabwHdn
GMGm/ls5OGK8Tu5lPkYm8oq6ffazu4TC1oK6qUR/cPAt07Au4z40OytKRgmsbxsG
AT/6sdtZftSBpSnV5JEy91kqNUZn9YbQiTHSi8SwpKC0uhxt4Pqhq97U00KKGAV8
8veJrmgi178U+J/57lbHZaNrUqeDlAE1zsbSvSw9Kv/UULzFG9S14LOyRUpnbT6/
zgCEYtspMP5ZXOkA4QP46zSnSTwQefmLoVqf8nVu97xsVZeUFzdVs9yvnx8db2Tk
7zsrmXCydDLJqwhHyq0tjcoIN7eAbeVZZnSdfQmdnNIngL2CAX9Qv+fqJC1Ickd4
sh3kSSEz6Np1ieEZhj8uCBcemyhOu+/o1NPAs8oJ+kyW9AaWA5chvFNxorY7NFpz
qLlUTqhpZQjB4jt7GLJEEH9U/cGPo1gJ+eTI2iSLQT0H+moGsi1elpPyIiuTpM7c
o5XimTgSxIJhtwTLhm0yhy/0Px78JNZjlwYxPYLR1mQ60YMyTEqIUJCl2C21FSxV
s5qUHpQhphtW2SqF+O/fr9sFvwDUFJ/tykj5dJ/abKJl+RSj/hpI0BYqLBCpcAfS
/6Mgtq2f1rwg0cGiqCxTJIIErovWkViJIxsZAokawhQAJ2kRlXc/GBZPBxN52ZgN
jgXddRLGUobbzBJN+rru
=4P98
-----END PGP SIGNATURE-----

--R9b51G30WkD62Ue3--
