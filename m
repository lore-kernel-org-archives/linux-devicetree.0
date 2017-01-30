From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/4] drm/msm: drop qcom,chipid
Date: Mon, 30 Jan 2017 10:09:44 -0800
Message-ID: <874m0gifmf.fsf@eliezer.anholt.net>
References: <20170130164921.20744-1-robdclark@gmail.com>
 <20170130164921.20744-3-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0504534425=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170130164921.20744-3-robdclark@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

--===============0504534425==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark@gmail.com> writes:

> The original way we determined the gpu version was based on downstream
> bindings from android kernel.  A cleaner way is to get the version from
> the compatible string.
>
> Note that no upstream dtb uses these bindings.  But the code still
> supports falling back to the legacy bindings (with a warning), so that
> we are still compatible with the gpu dt node from android device
> kernels.

The gpulist[] seems pretty short, like you could just have 7 compatible
strings in dt_match[] and point them directly at corresponding the
gpulist[] entry.  Or are there lots of patch levels, with the same
struct adreno_info values?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliPgWgACgkQtdYpNtH8
nugDbQ/+MlPu93auoYu1xNNxF9aZ05R4M9y9+oqsD/pP+Exb6Ce1PaK43L0SMop5
EacA6QScFz5+QzyWKEtqTkzvtUeB5zezuxaI8FhGsp6GpyAx6O3oe/gZVaQvuTIb
Ye/bie3qxtPbMtAkdLup8e+QmSyohWTA0kviLl4i3nrEZbhPIxlM2zbVrOHrTEJW
lBnjy1475ifgJvmewwIqNYF6VcUIVEyAhXrubPIW9KEyvab3Jj6+yhfUQC+jPtXp
/0Ir6m9IvmM+601rD2YJEZWSZ9rBbaYX1PUE0KEXi9T2J+hT6hTBt5FOHgkhF5U0
SeW/CMQjcNAvPK6OlqUckzdBugnv5rUTcHcWrbCSOy8g5H312llJfvyQ74PjxWQ2
eI8ecGaoGJ56Vzk6rH4mtP2LUMVKTkjUs9JmkHSzR/78mW0tPzyR3Z4KUP5xZ638
HVfmCp+kJsR/j65KLg0SmoK0GMeqx+niUweDyynQhYFC5Y1AKDwbr43aeAlZtBAU
fdRlHiupoO1x/eb05oyquahoVMGj1U/FTAW6mveQnV/sqIqNsjNdk7YJlcR86fry
B7quYAy/NxmNJlgSqa5OaWb6Xw1ukl4FcRlMG55J4t+kwQu9fm3jNOiE+K1/zqeK
K+PCTJzORUNFkhqXz1SJ6qcr8nFDma1KxRJKWN+Tz2yXyGqfY9c=
=zIjg
-----END PGP SIGNATURE-----
--=-=-=--

--===============0504534425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0504534425==--
