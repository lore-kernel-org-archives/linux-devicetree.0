From: Alban <albeu@free.fr>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Fri, 3 Mar 2017 13:36:29 +0100
Message-ID: <20170303133629.3aac2945@tock>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
 <20170302221803.223ff23b@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1739610984364288782=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170302221803.223ff23b@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Aban Bedel <albeu@free.fr>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

--===============1739610984364288782==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/v2ngm_U9_8oXjGTMC_5s3Ie"; protocol="application/pgp-signature"

--Sig_/v2ngm_U9_8oXjGTMC_5s3Ie
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Mar 2017 22:18:03 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Thu,  2 Mar 2017 20:50:22 +0100
> Alban <albeu@free.fr> wrote:
>=20
> [snip]
>
> > +static void mtd_nvmem_add(struct mtd_info *mtd)
> > +{
> > +	struct device *dev =3D &mtd->dev;
> > +	struct device_node *np =3D dev_of_node(dev);
> > +	struct nvmem_config config =3D {};
> > +	struct mtd_nvmem *mtd_nvmem;
> > +
> > +	/* OF devices have to provide the nvmem node */
> > +	if (np && !of_property_read_bool(np, "nvmem-provider"))
> > +		return; =20
>=20
> Might have to be adapted according to the DT binding if we decide to
> add an extra subnode, but then, I'm not sure the nvmem cells creation
> will work correctly, because the framework expect nvmem cells to be
> direct children of the nvmem device, which will no longer be the case
> if you add an intermediate node between the MTD device node and the
> nvmem cell nodes.

Yes to support such a binding we would have to fix of_nvmem_cell_get(),
but that should be quiet simple to have it support both the new and old
binding.

>
> [snip]
>
> > +static void mtd_nvmem_remove(struct mtd_info *mtd)
> > +{
> > +	struct mtd_nvmem *mtd_nvmem;
> > +	bool found =3D false;
> > +
> > +	mutex_lock(&mtd_nvmem_list_lock);
> > +	list_for_each_entry(mtd_nvmem, &mtd_nvmem_list, list) {
> > +		if (mtd_nvmem->mtd =3D=3D mtd) {
> > +			list_del(&mtd_nvmem->list);
> > +			found =3D true;
> > +			break;
> > +		}
> > +	}
> > +	mutex_unlock(&mtd_nvmem_list_lock);
> > +
> > +	if (found) {
> > +		if (nvmem_unregister(mtd_nvmem->nvmem))
> > +			dev_err(&mtd->dev,
> > +				"Failed to unregister NVMEM device\n"); =20
>=20
> Ouch! You failed to unregister the NVMEM device but you have no way to
> stop MTD dev removal, which means you have a potential use-after-free
> bug. Not sure this can happen in real life, but I don't like that.

Yes, I'm aware of this problem. Sorry, I forgot to mention this in the
cover letter.

> Maybe we should let notifiers return an error if they want to cancel
> the removal, or maybe this is a good reason to put the nvmem pointer
> directly in mtd_info and call mtd_nvmem_add/remove() directly from
> add/del_mtd_device() and allow them to return an error.
>=20
> Not that, if you go for this solution, you'll also get rid of the
> global mtd_nvmem_list list and the associated lock.

IMHO the MTD users framework has to be re-worked to be useful. First
both the add and remove callbacks should have return values. Users where
the add failed shouldn't be removed later and users where the remove
fails should block the removal of the MTD.

Furthermore only passing the MTD device to the add/remove callback
force the users to keep their own list, which is annoying to say the
least. A simple fix would be to have the add callback return a pointer
that would be passed back to the remove callback. Trivial to implement
and the MTD user wouldn't have to keep any list. I will look into this
in the next days.

Alban

--Sig_/v2ngm_U9_8oXjGTMC_5s3Ie
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuWNNAAoJEHSUmkuduC28QeUQAJH4KiFG3qMeKLSG4jlSniqI
DGp3AZS/OhZ5h/lxelly4BC2pWp4EOfw5V45pcBtLsg0J0RaXRyixWPbtowhBksz
LPEWMWt1lm6zX4l/VvUhyGW0NEprTGKH0oIbMx260/5swHJpojNp2vHTglgGRx9q
VqDZC4yKxokkCHRNoCxj1S3S6A0SPQ4UX6EttPb9uVCHjwMG53MXrxH5Gxmj76gi
neOOhqyusv44pBwDeuQLpaXknwxCqNhsGrMTBK5TQ4ZedlLAJfk6nABLP52U5aCf
7ByVMuHBY0jwIsstHJrI6/K3DZ8Wff3qJy1+3+ZlDESggM2RywltX/XI3FOE/Qb+
7sIDGS3/5XRWRFA43CA4tHg3hYKL2XDvRtxrNFm3Cd+a2o9YLmEcWD/3KtmZYOJS
CCs+dg/HTD0QX3ArKTDHUAgcegAu2eFOBhTLGTppQLAqcZb1rqeZTFJgquB9nrkl
hZjczSDkXXcZdcaCQmqJ/3XhAdNkpYakRFCJiAtk8NPl9kK4i+4TDB1aBAKJD+fE
mxdk6BDObv2uBGkx0hTJouu6ovLauqI1RLZf1Ha3PrPvswRX8lClDSkT+OkRSzDb
hXLkNMEzBOjdcTchRxDPCD4Jhj0CL155GDkhaCjcAS8MTUSJmNCmd256TCEICZ9+
9yhqpl3bNdmrzm92Zn1x
=yeC6
-----END PGP SIGNATURE-----

--Sig_/v2ngm_U9_8oXjGTMC_5s3Ie--


--===============1739610984364288782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1739610984364288782==--
