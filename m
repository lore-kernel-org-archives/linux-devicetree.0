From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 2/2] ARM: qcom_defconfig: Enable Qualcomm remoteproc and
 SMP2P drivers
Date: Thu, 9 Mar 2017 04:01:54 +0100
Message-ID: <20170309030154.y4pa5mtyuc3jk5ng@latitude>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170215045157.11659-2-j.neuschaefer@gmx.net>
 <20170304012032.GA1694@minitux>
 <20170305050125.b6lzx2fiest4xmre@latitude>
 <20170305164930.GA49943@Bjorns-MacBook-Pro-2.local>
 <20170307020145.xfqz4wolc3tuqv6x@latitude>
 <20170307110413.GD49978@Bjorns-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fabviqzovxyfdyod"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170307110413.GD49978@Bjorns-MacBook-Pro-2.local>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jonathan Neusch?fer <j.neuschaefer@gmx.net>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org


--fabviqzovxyfdyod
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2017 at 12:04:13PM +0100, Bjorn Andersson wrote:
> On Tue 07 Mar 03:01 CET 2017, Jonathan Neusch?fer wrote:
[...]
> If this is something that you will continue to hack on and you think
> anyone else will be interested in having then please do submit patches
> for it.

Ok, I'll give it a try.

> > > > [    0.647743] qcom-smsm smsm: no smsm size info, using defaults
> > > > [    0.647775] qcom-smsm smsm: unable to allocate shared state entry
> > > >=20
> > >=20
> > > Could you please confirm where in qcom_smem_alloc_global() we're
> > > failing? As far as I can tell we should fail with -EEXIST or if the
> > > passed "size" parameter is bogus -ENOMEM (but the default number of
> > > entries really should be less than the amount of free SMEM space).
> >=20
> > * qcom_smem_get returns -EPROBE_DEFER:
> >=20
> > 	void *ptr =3D ERR_PTR(-EPROBE_DEFER);
> > 	if (!__smem)
> > 		return ptr;
> >=20
> > * smsm_get_size_info prints "no smsm size info, using defaults\n"
> > * qcom_smem_alloc also returns -EPROBE_DEFER early.
> >=20
> >=20
> > BTW, I think smsm_get_size_info is using uninitialized memory here:
> >=20
> >         size_t size;    /* is uninitialized */
> >         struct { ... } *info;
> >=20
> >         /* qcom_smem_get returns early without setting size */
> >         info =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_SIZE_INFO,=
 &size);
> >=20
> >         /*
> > 	 * PTR_ERR(info) is not -ENOENT.
> >          * size (still uninitialized) is compared with the size of the =
local
> >          * struct defined above.
> > 	 */
> >         if (PTR_ERR(info) =3D=3D -ENOENT || size !=3D sizeof(*info)) {
> >                 ...
> >         }
> >=20
>=20
> Thanks for your analysis!
>=20
> As you say the smsm driver is missing handling of probe deferral - which
> is wrong. Could you please propose a patch checking for EPROBE_DEFER and
> propagate this error as return value from probe()?  (Without an error
> message)

I'm working on it.

Regarding the uninitialized memory read in "size !=3D sizeof(*info)":
Is qcom_smem_get supposed to store a valid size value in any
non-probe-deferral case, or only in non-error cases?

Assuming the latter, I think "size !=3D sizeof(*info)" should be changed
to "!IS_ERR(info) && size !=3D sizeof(*info)", i.e. only check size if
qcom_smem_get returned success. Does that seem reasonable?



Jonathan Neusch=C3=A4fer

--fabviqzovxyfdyod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJYwMWNAAoJEAgwRJqO81/bEn4P/AyV3ji86Cz6+aFLSjhRUurz
yZFKrY3roWN+P0Ybo4LJAQMTtnJrq529l5mz+CQv9NmdJ5AsnweNNWQD5lZrZ+Ax
dPmyw7baEAfpltmwBKozoKpJDuhV1fQPZJ8dcwef6GWSgfz8hbxAh0ILqb/bLr9H
VaGjjy7Q1FVuqH9kvzCo48w7NzoaviTjKgPX2rBuCxJq1YcOLj+/02V/DwFNTAhO
oQAkOIpOz0a++JCQj5ZFtdfPlnT20RH1jQyAmbeXkl9hGCucws9otQLbSKWasOQ2
YVeurUSrXC/tU9Q4jVKhCeFhNH61rWJsSPtAPwyXVT9WHdg7A9FfgHThQMsVtPbU
56Y9RFv6za1KuVfgCUz+eNR7rqCYwtih5LbRdlpDs8MGu4Kq51m+uDkqBgrubA6H
Hr0mfKRjsSWg7htyDxZBZecCBv33E+db0JlASYBaSYihPdHwOQ3DokYJwu5XzwZz
0EQ5EgYTOA9iEQ0rXKQVu+aLS301ajQkUmpnk13U5ZzeRvNB8oabu8ZT14cmseiG
CZv9cYgSNNxKCznzVR6JqHSqprAdiaMzz1axnT517awAuYf7Pbi2+NceZiDN4Ycn
/UgLKI0kVKCc//+nVmrU6izZYsHcLcM/ajjH7IK/nZh3PrI8ULXndwSy4Mlz4HJK
UuDB+G3xhUBFiOM9o4Kr
=RMS8
-----END PGP SIGNATURE-----

--fabviqzovxyfdyod--
