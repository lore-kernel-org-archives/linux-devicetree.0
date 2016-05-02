From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH v4 4/4] drm: bridge: anx78xx: Add anx78xx driver
 support.
Date: Mon, 2 May 2016 16:22:15 +0200
Message-ID: <20160502142215.GA10348@ulmo.ba.sec>
References: <1462175666-8891-1-git-send-email-enric.balletbo@collabora.com>
 <1462175666-8891-5-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1511452949=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1462175666-8891-5-git-send-email-enric.balletbo@collabora.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, treding@nvidia.com, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org


--===============1511452949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 02, 2016 at 09:54:26AM +0200, Enric Balletbo i Serra wrote:
[...]
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
[...]
> +static int anx78xx_init_pdata(struct anx78xx *anx78xx)
> +{
> +	struct device *dev = &anx78xx->client->dev;
> +	struct anx78xx_platform_data *pdata = &anx78xx->pdata;
> +
> +	/* 1.0V digital core power regulator (optional) */
> +	pdata->dvdd10 = devm_regulator_get(dev, "dvdd10");
> +	if (IS_ERR(pdata->dvdd10)) {
> +		DRM_INFO("DVDD10 regulator not found\n");
> +		pdata->dvdd10 = NULL;
> +	}

I'm almost sure that this isn't what you want. What if the regulator is
hooked up but the bridge driver probes before the regulator. I think
what you really want is to simply propagate the error code via:

	return PTR_ERR(pdata->dvdd10);

My understanding is that the regulator core will give you a dummy one if
there's really nothing hooked up. I think you're also supposed to call
regulator_get_optional() (or the devm_*() equivalent) if this is truly
an optional supply. Given that it's the "core power" regulator I doubt
that it's really optional; it's more likely that you may not be able to
control it, and that it's therefore always on. In that case you're
supposed to model it in DT as a fixed regulator that's always on.

This is fairly minor and it's really the only thing I could find, so no
need to respin just for that. If you're fine with the above solution (to
propagate the error code) I can make the change manually while applying.

Thierry

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXJ2KUAAoJEN0jrNd/PrOh72kQAJb97Z297vzH9zZXBpbiPI4A
8iLNRjmS2xd44/x89jFQ4JG8M7IdVaLXnF8aGELyG80mXdxpVYQKb1jXQx9drWDL
IGokWPQjFxCJGp3AMSrWjRFDxa/L4T8VtnEwMOpe98eY/Wm4pIIp6qe5sWh0lIH+
RzHSmT9mtqlZbUXWhb5GxDv+cu75hWzO0hHIhtmiFYQZbcNB2DqtLhlfUgmnoDWi
VPMkYDl6ALSCOvqwsg+kJUM32LvGIa3C+SGz85N1qWt2zqGtnt+gmqfI1ZXOHe8g
d3pg2zAoeVh9Ls1Q6AtRkvvq1qSmUQAZsXXmg2sl1lok4WcLibmlNMdbh63iGc2L
Q9JjnTvPfIgRKv+rW+dyuQ/elIIB4+lV0ZRi44FWgKsrgbM0dhZTcyurd6nTrcLJ
88R8HekT2Casg4U0mqjl9gYhyToSM6tmq9Jm9o6JDilkRDex7RD//6obN7+Ltz+g
g+yaJHJId+s98G852XtaRCLAyWMFeOcBzQ2+clasgrFM1zwhwnXQhV+YkLmCKXBf
//cNfj2tiE8udUO4A7oWMXdkQDwAQ9ROIN54ioEAMuBCNeBAXgjun9waOShnK+t1
ueM2otqqSZ4c85YKM2kbjjNeuSJx2zlk0IX+3JmcLFa9/1kjj6E9GEpuprZBBl7P
Rol/qThOagHUfheRG72C
=bvoW
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

--===============1511452949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1511452949==--
