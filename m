From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v14 3/6] drm/panel: simple: Add support for NEC
 NL4827HC19-05B 480x272 panel
Date: Thu, 13 Aug 2015 14:23:13 +0200
Message-ID: <20150813122312.GC11095@ulmo>
References: <1438158605-28248-1-git-send-email-jianwei.wang.chn@gmail.com>
 <1438158605-28248-4-git-send-email-jianwei.wang.chn@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438158605-28248-4-git-send-email-jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2015 at 04:30:02PM +0800, Jianwei Wang wrote:
> This adds support for the NEC NL4827HC19-05B 480x272 panel to the DRM
> simple panel driver.
>=20
> Signed-off-by: Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> ---
>  .../bindings/panel/nec,nl4827hc19_05b.txt          |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/nec,nl4827hc1=
9_05b.txt
>=20
> diff --git a/Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.t=
xt b/Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
> new file mode 100644
> index 0000000..20e9473
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/nec,nl4827hc19_05b.txt
> @@ -0,0 +1,7 @@
> +NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "nec,nl4827hc19_05b"

Underscores are deprecated in compatible strings, so I've applied this
with "nec,nl4827hc19-05b".

Thierry

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVzIwvAAoJEN0jrNd/PrOhvOEP/iMOP4wGrP3JEFom6fzfqOpl
QCJpjQw7QDqebq47rZV1kD/j61EiFpIuzuDDdlTzucXTfC7f6QtCp2Qj+1DwYyPe
A2MGY0J5BmXbGP/2E9nR9+We4MNZF17/id1GU9R5Zc0KSVKPo1eTqB21n8JV68CK
ObCKqFIIeNOFmfaEwI7rSTOlWAtuNgk3Iw7pPMOS25vr0Pje9AvT7bqnfm7U+w1a
T70f1wquy7ovgNogglmwIoUBC8Ro3jc2ATE/g35PNSNDL+neIPS5b6VbSgcGTzkd
9nrznXE7xUAfC4Exqdn8hhPbhRh9B2n/ViBHXXThnQdH50gGZrKM2f4xNyQpH7Dt
XLiQ5eEm1FLabCe8utIHye0qNV/qRHupfUurPeM0XUqDWC83Ut4VrLGOw4eTQfgj
QnzEgk55cDZGLSry1NQD0glVLYOghoBto8aKlQfThs5BYBQOohYpKcJ69Vfw3nyc
eT1DGZc/+vG6maHNvVTxpoOugOxtwFGWNnGfMp2gF9Kl1jw92r4lZJe5yA6vD0nA
mgn4VrLWtK15OzTL7sMpcJRcIHpYk4z2xaCcYchYOlff9LlV4ovF+k7jUtdJ1c93
xHZfXI7PZ5LxfXEjTNyTksLbT8V93Ci2ulowZRGmhIxbATuYmT6TSqvV/T1S0swx
rG6sgUMkuRfWME1xGR5f
=e5yw
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
