From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RFC v9 11/20] drm/bridge: Add Synopsys DesignWare MIPI
 DSI host controller driver
Date: Thu, 9 Apr 2015 10:43:54 +0200
Message-ID: <20150409084353.GD12103@ulmo>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
 <1423720903-24806-12-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0002573395=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1423720903-24806-12-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liu Ying <Ying.Liu@freescale.com>
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kernel@pengutronix.de, andy.yan@rock-chips.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0002573395==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2015 at 02:01:34PM +0800, Liu Ying wrote:
[...]
> diff --git a/drivers/gpu/drm/bridge/dw_mipi_dsi.c b/drivers/gpu/drm/bridge/dw_mipi_dsi.c
[...]
> +struct dw_mipi_dsi {
> +	struct mipi_dsi_host dsi_host;
> +	struct drm_connector connector;
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	struct device *dev;
> +
> +	void __iomem *base;
> +
> +	struct clk *pllref_clk;
> +	struct clk *cfg_clk;
> +	struct clk *pclk;
> +
> +	unsigned int lane_mbps; /* per lane */
> +	u32 channel;
> +	u32 lanes;
> +	u32 format;
> +	struct drm_display_mode *mode;
> +
> +	const struct dw_mipi_dsi_plat_data *pdata;
> +
> +	bool enabled;
> +};

While reviewing this I kept thinking whether this is really the right
architectural design. This driver is a MIPI DSI host, a connector and
a bridge, all in one. But it seems to me like it should really be an
encoder/connector and a MIPI DSI host. Why the need for a bridge? The
bridge abstraction targets blocks outside of the SoC, but it is my
understanding that these DesignWare IP blocks are designed into SoCs.

Thierry

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVJjvGAAoJEN0jrNd/PrOhXu8P/3FQzro+kD5l1BNexrccOlIu
2T+Fj0ezDjbaaJiVP+v/dZ4xzPmM3EFczq5xsL7gC1r0ehfm9yHJz1qFAh85Fp/0
7MGFdUl22/CiBbseAwm4/wlijIu1XxBxO7++ayZSxAWs1ZDz7hBvsH7OxVmlyYsk
KHV6raVPGkqWmgWqzAt9mHtCL/zi5e0uyyxC6THWn0WzYfYkvWubflmeCUqDZ4ia
XI9kJ850vlilcobtOeL0mqPeYKUvySZ8Rd141xc6HY/xpWZu7gZ2UY4xxwE+LQTB
65DQvLdyD7dKQjFuFjsCJ1sBUsFFvF9Q5MNbIZKf+dHeIMXiGODW71Sn5HQUOt0J
dJbjAMvgfyr6MFFA0wkfWCdB58MjbWs8HPTzQOSczDGnZTPQfli68ACF5F5FKxfn
Df9blYjrAvDQXZ+Uffk+auYYmjj0wfhVu+rkuv2icrH+iuj3zHRgP2d/TzH4wgfq
3d/14ApYVTcgNn+/OzN3ouAtZ9AQ6VR0SmwsP/YYMsZCYBRMtPyzmgqnBOezinox
I/HwzXOd83aFhi8e7iTMMnybYPaYukMsbu0srKuyiA1vK5vG/buCZfnVKAl8KhJn
KrVk10ffMCu7AWP4Y9KHxaTWeZ73J9ZWE87cojXlyMM2KcsKNcmFagGehLjxbCub
RLqTtgBB/X6Tl6Z013xu
=zGwb
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--

--===============0002573395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0002573395==--
