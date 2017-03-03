From: Alban <albeu@free.fr>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Fri, 3 Mar 2017 14:30:21 +0100
Message-ID: <20170303143021.46381429@tock>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
        <1488484223-844-3-git-send-email-albeu@free.fr>
        <b2df74bb-dd86-bac1-ab8b-cbff6ca29b6f@linaro.org>
        <20170303133419.2383dbce@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/m9S=jHwykYWTowWyRBAGNZR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170303133419.2383dbce@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Aban Bedel <albeu@free.fr>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

--Sig_/m9S=jHwykYWTowWyRBAGNZR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Mar 2017 13:34:19 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Fri, 3 Mar 2017 11:23:16 +0000
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
>=20
>=20
> >  =20
> > > +	mutex_lock(&mtd_nvmem_list_lock);
> > > +	list_for_each_entry(mtd_nvmem, &mtd_nvmem_list, list) {
> > > +		if (mtd_nvmem->mtd =3D=3D mtd) {
> > > +			list_del(&mtd_nvmem->list);
> > > +			found =3D true;
> > > +			break;
> > > +		}
> > > +	}
> > > +	mutex_unlock(&mtd_nvmem_list_lock);
> > > +
> > > +	if (found) {
> > > +		if (nvmem_unregister(mtd_nvmem->nvmem))
> > > +			dev_err(&mtd->dev,
> > > +				"Failed to unregister NVMEM device\n");   =20
> >=20
> > I will be nice to feedback error to top layer, as it does not make sens=
e=20
> > to remove providers if there are active consumers using it.
> >=20
> > del_mtd_device(), unregister_mtd_user() have return values, I see no=20
> > reason why notifiers  should not return errors.
> > May be if we should fix the remove() call backs to handle and return er=
rors. =20
>=20
> It's more complicated than that. What should you do if one of the
> ->remove() notifier in the middle of the list is returning an error? =20
> Some of them have already taken the remove notification into account.
> Should we call ->add() back on those notifiers? Also, I'm not sure they
> are all safe against double ->remove() calls, so if we might be in
> trouble when the removal is retried.

Re-adding make no sense as that could also fails. Keep it simple,
remove the notifier from the list when remove() succeed, abort when one
fails. In such a scenario that mean there is a dependency, the sys
admin should then solve this dependency and re-trigger the MTD removal.

Alban

--Sig_/m9S=jHwykYWTowWyRBAGNZR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuW/tAAoJEHSUmkuduC28FR4QAKkZDGpJu9pxKg990lTjTVzT
N86Wi7OUzhIoBbAnE99Q7a92ZuT/nlgCqyuMvq8RdH+G1UqNiApsBJpr13YRMDKy
c12GHdjgjOllwhIlG+Q+59yCTi2cIPEwXlBQQ3iIXZFsZb1FKO4jKOGIRQt+JJmj
/J1KTP7ruHj/7yuZuTRuq7xDr2mZErDi8uY5bw46PRRwpQxrQdhpFeiDbSm60dg7
mkzFLYD9IujoxrBfghlZH7ItNTXeFE2FPdkXIFPyz1Ts7Urq/cw3XSi2zMPM30qE
HadaF2y8+9d7qGYHD0nvio2EgQvuiOF3DayFXA5oh6oMtHRUDe/eFSHg+m4ok0kM
3XFLrZUxz+4QPN8br7TWUgP3xicmxpOnRZ3RZeoYwHdNeG67uZ+YFjaP5otevhj4
fwTz1jE1y7s3RtATpLyEpZcEyi3rXkdfCNAOxHKLPY/b0A2nLPordhKPEfzfA/Dy
j9PCZqwIJMQdCoMgixbHKf5gyw12b5Agn6IjJY9cICT2C9qcZut4BnQy9iFlyrvY
9yyjqHmArF/yUJlhu0N2HxxOfPsJ21vvCPNd1i3sj1se81OYOCbvbXEVuDtop9LV
xFiRa4pbcLlUEnQ+AwQhVNrthSbN63ZPpZTCCRXquWWSFTOWg2/QBxjzBWrIDLX2
nM1owW0SqubBHs7Mqod8
=00YK
-----END PGP SIGNATURE-----

--Sig_/m9S=jHwykYWTowWyRBAGNZR--
