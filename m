From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 4/4] drm/msm: drop _clk suffix from clk names
Date: Mon, 30 Jan 2017 10:15:14 -0800
Message-ID: <87y3xsh0st.fsf@eliezer.anholt.net>
References: <20170130164921.20744-1-robdclark@gmail.com>
 <20170130164921.20744-5-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1818631264=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170130164921.20744-5-robdclark@gmail.com>
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

--===============1818631264==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark@gmail.com> writes:

> Suggested by Rob Herring.  We still support the old names for
> compatibility with downstream android dt files.
>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Clark <robdclark@gmail.com>

Huh, I don't think I would have cleaned up DT bindings in exchange for
adding driver code like this.  But the code seems correct, so other than
one optional suggestion:

Reviewed-by: Eric Anholt <eric@anholt.net>

> +struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> +{
> +	struct clk *clk;
> +	char name2[32];
> +
> +	clk = devm_clk_get(&pdev->dev, name);
> +	if (!IS_ERR(clk) || PTR_ERR(clk) == -EPROBE_DEFER)
> +		return clk;
> +
> +	snprintf(name2, sizeof(name2), "%s_clk", name);
> +
> +	clk = devm_clk_get(&pdev->dev, name2);
> +	if (!IS_ERR(clk) || PTR_ERR(clk) == -EPROBE_DEFER)
> +		dev_warn(&pdev->dev, "Using legacy clk name binding.  Use "
> +				"\"%s\" instead of \"%s\"\n", name, name2);

Drop the second "|| PTR_ERR(clk)" case, so that you only get one warning
printed at boot if deferring happens?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliPgrIACgkQtdYpNtH8
nuh6AxAAjJIhJjbX0N4JtKCFmPORKMGhCTJkLk+9E4tsyaGVCWmzZDGQHb4n45+8
HaCtGW8hpsni8O34UeioLHUNeWqK1tlip7n3CBwQpq2uzPM2lrMnvbj7oSVYNYbd
QHWuhEi7UCAw3DHBDk0085gIdnvTrvUUUthI65SHqUXmWPnXbyRad4D10NY1n5Nk
ECLjqyWnSHa8oz9fXlT/Kb9y6kd7LxET7GfK0ICNSGKrRaxFuDcLXONnKBy8+FKv
/12mJTz4xMaAn6u/CdXBgFI2tBC4kRW+RlWF08VZM8+I9a66Zr7eHyVDjZIHj91R
oCujkgh8CL2Mjusk9Ba16MK/mNz0rqyttCOva061VOpuPfWMAzLp+0ChoJPFfm4J
7G1SJM5sRnc9aqefk6l80nVfdnWaFgeT0szu++qft3fR7VGdoPHNA2NH2loFbVfx
IOY0P2p634+GiaLHYSUbM+VKu9Srfwa/ikPmry6e41VHfTbjxQgPJphewPUECN89
q6pFXr9Y4b018mlsM6Bv1hmn6K26fyZkCQvMjHIf6JOHpkcyI+U1Mqwjt5Rpw9AH
8itByDD2ysTZi99RnhYD//swP+x2LRolj6ZMvwpZ3OsbCdpLc6XroDkyNPcZBnHS
25st6+6KVq8HmtOltgrVEdzYSvOvrY8QU+jc0r++K/RTpJrTHN8=
=PB/z
-----END PGP SIGNATURE-----
--=-=-=--

--===============1818631264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1818631264==--
