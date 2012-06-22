From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by
 regulator-compatible
Date: Fri, 22 Jun 2012 08:13:14 +0200
Message-ID: <20120622061314.GA15627@avionic-0098.adnet.avionic-design.de>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com>
 <1340194987-23654-3-git-send-email-ldewangan@nvidia.com>
 <201206201924.09618.arnd@arndb.de>
 <20120620194609.GA4037@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6020754180291486120=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120620194609.GA4037-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============6020754180291486120==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 08:46:10PM +0100, Mark Brown wrote:
> On Wed, Jun 20, 2012 at 07:24:09PM +0000, Arnd Bergmann wrote:
>=20
> > 1. What is it that the new property can express that cannot already
> > be expressed by using the phandle.
>=20
> As well as being able to refer to the object from within the device tree
> we also need to be able to tell what the object represents - we have a
> bunch of regulators in an array under a node for a PMIC and we want to
> know which regulator on the physical device each array entry corresponds
> to.  Previously this was being done by parsing the phandle name but that
> means we can't have more than one device with the same set of names.

I thought the reason was that matching the node names up with the
regulator names was considered bad practice. As Stephen already noticed,
the matching is done by node name, not phandle. Correct me if I'm wrong,
but you can have more than one device with the children have the same
names.

Thierry

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP5Az6AAoJEN0jrNd/PrOheHkQAIaIK+A24GJcH4rPatPpVx57
L/SipiL1qo8qoL8ulMjsxaCibXzRlN6GVsvQDWea1Dm4AYxEDvbwklC7pU6dTzT5
vGkTod1OfHvn0ba2XDD96QodYV9tC/SGyjXgucGOyfq6OJNsCtfGtGqQv7OF8K/U
JEZtSkusj3bc0PZmv371hvtUoJLlPXSrtQYk1btL+OPfygFKox16Nndb3NFpvaIo
joMAgg/Y7TABRoABAyp3CUlKDQ9pmx1CgCmtIYSA+eE/KRQVdecQqRtV2jv8I9zt
gqYxs5wnUF/ylLjIt8VyqLD2AyHu82YjJCeWmdofVMCp53ZYmd9MEGERPUFimp8o
ZISadrZ3Nt4txpo+P172ldAPvfCpKYNnHnwnGLbTJUAz9V4loUHVKSZjyKLvpMO4
ezcsegAgeR0RsfVd2ky5/4nOtnyQOuAAIRtzhxWqlvxhb6aNRZ+kjyTjKtuGPCEC
QcNPfo/39g2/pZLrAj9AExScvYFQ4WNuhGRZ9vxD9fJXgxx6iP0R71CYK8DGFmyK
IbAcRLDleToMd68H2nrg9+6GfUCpH9kZEWue+m8iVFSqmGQqbrNfD02lGha1xQMx
aVUINOMUZGkpYuzn50+qzVPwI01djA+zby72L9AqpA3RvzUcrTifyoQpnBir+ir+
WD4xjsx8H0qo8rYmsYmt
=nm1n
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

--===============6020754180291486120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6020754180291486120==--
