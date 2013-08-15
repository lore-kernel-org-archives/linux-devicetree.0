From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: Add PTN3460 bridge driver
Date: Thu, 15 Aug 2013 17:28:13 +0200
Message-ID: <20130815152812.GF16951@ulmo>
References: <1376513258-25703-1-git-send-email-seanpaul@chromium.org>
 <1376513258-25703-3-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1376513258-25703-3-git-send-email-seanpaul@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie, marcheu@chromium.org
List-Id: devicetree@vger.kernel.org


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2013 at 04:47:38PM -0400, Sean Paul wrote:
[...]
> +int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> +		struct i2c_client *client, struct device_node *node)
[...]
> +	ptn_bridge->gpio_pd_n = of_get_named_gpio(node, "powerdown-gpio", 0);

of_get_named_gpio() can return -EPROBE_DEFER and I wonder how you handle
that in the driver that uses ptn3460_init(). Since you pass in an
initialized drm_device, you'd need to undo all of that in case of
-EPROBE_DEFER. Well I guess you'd have to do that in case of any error,
but it makes things difficult to handle for drivers.

For instance on Tegra we pretty much delay DRM initialization until all
required subdevices (there are quite a few) have been probed, so if we
wanted to use this function we'd have to call it after all drivers have
been probed because only then do we have access to a struct drm_device.
That will cause other problems, however, because at that point we can't
defer probing anymore.

Thierry

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDPOMAAoJEN0jrNd/PrOhXUMP/3IzKh8DuCAwoh050xlMBcfi
fbRc3SUUuUYwp0prFvBuuafqIXaRUAL8L+q01ZA+86nLM1CzZJISVKVVaN57WDpA
sCuk1Cwu+sYPFLws6geIgcFlFk18X9+hflpIPLVTM3uTk8pDV32lxdE5Uj3IB7SG
f1ndAoa1e5BfbHS9/3TQxQ6ndlNyPJ03KAgnEeo+kS+fjyLN+71MaA8jT5kTYWxf
7Wf6cq8pC2tMNWG5b0zZrXd6zQIgaTswUdBCCPepIm66G7kiniLa5u6eD0h0H4eT
c800der6BqERvnDHz/rrappZvwB61M0bhWiIDEb2L9CWmw2GSL1jGa70vjK2qDnC
aWi61VNfvyHwWeazihuVg8NV5K80XlA2FfSmqHxufaddGF3ae137Smz1XnS8OsZT
nsEhJZO7hFkFk/vsQOIqVI/psjLkxmLMVUvVaP/mubNv8DAYjgzuWmHcmC5i12eC
u5rlI+u+QEgvOqIwTOg4PvPnfZ23lLLJu6mA7sB3DchHuEhpJSkWp3FHZvgrGEHJ
AiRKl4b5MrQS1tV4TVM/I26XjM/wlnCDAIT+cz7AUqGoPaJL8xiSur2iCCnyNK76
b71to/K0TPkEdBQFx2Z3J70sJZ5URjV4DXi2+atjA2My9LygwIIXg8rEc5NaX25y
M4+rMle8qkaZhlaTArwA
=tjPY
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
