From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 2/2] ARM: qcom_defconfig: Enable Qualcomm remoteproc and
 SMP2P drivers
Date: Sun, 5 Mar 2017 06:01:25 +0100
Message-ID: <20170305050125.b6lzx2fiest4xmre@latitude>
References: <20170215045157.11659-1-j.neuschaefer@gmx.net>
 <20170215045157.11659-2-j.neuschaefer@gmx.net>
 <20170304012032.GA1694@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ojukx5qtu2svexhk"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170304012032.GA1694@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jonathan Neusch?fer <j.neuschaefer@gmx.net>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org


--ojukx5qtu2svexhk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2017 at 05:20:32PM -0800, Bjorn Andersson wrote:
> On Tue 14 Feb 20:51 PST 2017, Jonathan Neusch?fer wrote:
>=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
> >  arch/arm/configs/qcom_defconfig | 5 +++++
> >  1 file changed, 5 insertions(+)
[...]
> > +CONFIG_QCOM_SMP2P=3Dy
>=20
> We also need CONFIG_QCOM_SMSM=3Dy here, its currently used to signal state
> of the ring buffers for WiFi.

FWIW, I enabled CONFIG_QCOM_SMSM on my test system (an Asus Padfone,
based on MSM8974; I'm using the Sony Xperia Honami DT because it's close
enough), and I think it failed to initialize:

[    0.647743] qcom-smsm smsm: no smsm size info, using defaults
[    0.647775] qcom-smsm smsm: unable to allocate shared state entry

I think CONFIG_QCOM_WCNSS_CTRL may be needed too, but I'll leave that
for a future patch because I don't understand WCNSS well enough.

> With the addition of that you have my:
>=20
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I'll send a v2 of this series with your R-b and A-b tags.


Jonathan Neusch=C3=A4fer

--ojukx5qtu2svexhk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJYu5ucAAoJEAgwRJqO81/bBP4QAMG/AxLzp3y7VII+z3IF6/Fg
h0hAj7+GzhzVwaiTCD9HqthKuUJcRxirBgcBbAMfqJNZ+zB5giZTkrVFddZPGqEp
sXeKgB75YopBQhVTYg7pasw+G1mKUhND4Weqj/75f0PJS4mDgoB4ZGDRvE0g9J9E
PUxlTL7jMPU6FU1ROGHNzXlvMn9eUdcQYPcG6M3IAbAt4k6BV2SLwT+feD/dR7E3
8R3wsU8eu2w2XVWIRTO999Yoanneybjkg0vdaumyqrsaux0mruevA7sya4kg7GAt
WuISVznd8Pmk2Sg6NdZF0CeU4AJ5WUX2f6TRVbnvVJNJuBVgRX7bSHK2NvngwXTW
UZ/juT4f5MjFqjxvfOv1VZwVf0dJ8gE+WndC8n/c/k00GabJxst3f3pR7ux6kSrV
tjm6qNNIZY1ToLipVHizymtZRhRmK9dGbMluUNvmmDibc4/5at8O8sVtq8KsGu4d
cbA4KIyFjx88em21yXYsC56tcfXJ2yfX6dmvY7/KbLQ+cbdS0ZB7Zjvkan31FYX6
0t0HMa7/C5GuPygq7IxXCdJrhIm+qI/XoPZmZupMFy1LKvpIJA5K23sHRt84nV8l
DTIzQqmPaV84Qxhhk/QoICB8dvRFRopoRPjYJhTN3lKs8TOsj3d9xLXrS1tEjQRg
KbbM0EAitz1D5rBguaYl
=TA4z
-----END PGP SIGNATURE-----

--ojukx5qtu2svexhk--
