From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 2/2] ARM: qcom_defconfig: Enable Qualcomm remoteproc and
 SMP2P drivers
Date: Tue, 7 Mar 2017 03:01:45 +0100
Message-ID: <20170307020145.xfqz4wolc3tuqv6x@latitude>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170215045157.11659-2-j.neuschaefer@gmx.net>
 <20170304012032.GA1694@minitux>
 <20170305050125.b6lzx2fiest4xmre@latitude>
 <20170305164930.GA49943@Bjorns-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vdynnxt74aickndc"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170305164930.GA49943@Bjorns-MacBook-Pro-2.local>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jonathan Neusch?fer <j.neuschaefer@gmx.net>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org


--vdynnxt74aickndc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 05, 2017 at 04:49:30PM +0000, Bjorn Andersson wrote:
> On Sun 05 Mar 05:01 GMT 2017, Jonathan Neusch?fer wrote:
[...]
> > FWIW, I enabled CONFIG_QCOM_SMSM on my test system (an Asus Padfone,
> > based on MSM8974; I'm using the Sony Xperia Honami DT because it's close
> > enough), and I think it failed to initialize:
> >=20
>=20
> Using Honami should work so far, but please do write a patch adding the
> Padfone, so that we don't accidentally break your HW at some point.

I can try how far I get, but unfortunately I don't have hardware
documentation or schematics, because I'm a hobbyist.

> > [    0.647743] qcom-smsm smsm: no smsm size info, using defaults
> > [    0.647775] qcom-smsm smsm: unable to allocate shared state entry
> >=20
>=20
> Could you please confirm where in qcom_smem_alloc_global() we're
> failing? As far as I can tell we should fail with -EEXIST or if the
> passed "size" parameter is bogus -ENOMEM (but the default number of
> entries really should be less than the amount of free SMEM space).

* qcom_smem_get returns -EPROBE_DEFER:

	void *ptr =3D ERR_PTR(-EPROBE_DEFER);
	if (!__smem)
		return ptr;

* smsm_get_size_info prints "no smsm size info, using defaults\n"
* qcom_smem_alloc also returns -EPROBE_DEFER early.


BTW, I think smsm_get_size_info is using uninitialized memory here:

        size_t size;    /* is uninitialized */
        struct { ... } *info;

        /* qcom_smem_get returns early without setting size */
        info =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_SIZE_INFO, &si=
ze);

        /*
	 * PTR_ERR(info) is not -ENOENT.
         * size (still uninitialized) is compared with the size of the local
         * struct defined above.
	 */
        if (PTR_ERR(info) =3D=3D -ENOENT || size !=3D sizeof(*info)) {
                ...
        }

> > I think CONFIG_QCOM_WCNSS_CTRL may be needed too, but I'll leave that
> > for a future patch because I don't understand WCNSS well enough.
> >=20
>=20
> Missed that one, when the WCNSS firmware boots the WCNSS_CTRL driver is
> probed - it will upload the NV parameter file to the WCNSS "OS" and when
> that is done it will probe the WiFi and BT drivers.
>=20
> So, you need it as well.

Ok, I'll add it to this patch.


Jonathan Neusch=C3=A4fer

--vdynnxt74aickndc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJYvhSBAAoJEAgwRJqO81/btTEP/ReHOL63BiY/MSPS/t5ELExC
75hEWPPql2Cqdnamzhvsak0T6sN05u2nI1EFe9GT+LxXsxTtBPbZ3CNm20YvbpGd
Nn+8erctruGUJ/Jv7rQDvN/NpCjXN1gx1AyKW27JqTJKakW6fMg+X4tDtcK5s4RQ
tfYd7pDM1Musc9TxjF3Ln9H3CRharEYXrQGwee75c5mSc3hNfi85j27HvE5t/wLp
+86gxdBFbTnMFVgtF1Z7ojb+TOjLOYvtoJsbgA0Kap3K962sUyYPlfouzjFGQFgW
U0qIXlqqh3tNisQQxP32EIvBNNx6TS5ePVxlrZzHb1PpU/qeSp5A4wZ5V2UlRjrn
klI2tdDWfJoJCZOs8zfXrK90c/pvzl8uAZMioEb/fEzC9dmlCaocqhGafSYFhDxw
dzw9RJvQ1BVMwFgxkUTshXGVzJw50Xj9k4JREZWwRCRvua6KFQV916PTMauiEB5r
aV57W1GzgUZ4+iX6LdgSMO9eklD3aQK7roLeyiX7OmV0jPZ5ZFQv/CaaTFG9z/Tf
6ZJNm1HYK+IQpwYSVyDsudPJOpl145gRu/yQDuSts20+cgbNTfbhzypTS8icamx/
ezI/SUXmCijdSr1UFeJpqOFZA1XnZaj3Muxb5UfJuzbq7kIA7FRoKCUl4gvkKy2T
SYJZds1BukyruCnJlAJc
=7lnz
-----END PGP SIGNATURE-----

--vdynnxt74aickndc--
