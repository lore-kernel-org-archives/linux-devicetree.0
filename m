From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Support for LG lp120up1 panel with eDP
 input
Date: Wed, 2 Mar 2016 17:12:36 +0100
Message-ID: <20160302161236.GC23204@ulmo.nvidia.com>
References: <1456138904-15258-1-git-send-email-jitao.shi@mediatek.com>
 <1456138904-15258-2-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456138904-15258-2-git-send-email-jitao.shi@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, eddie.huan
List-Id: devicetree@vger.kernel.org


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 07:01:44PM +0800, Jitao Shi wrote:
> The LG lp120up1 TFT LCD panel with eDP interface is a 12.0" 1920x1280
> panel, which can be supported by the simple panel driver
>=20
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
> Changes since v1:
>  - Add eDP panel type in comment msg
>  - Fixed comment msg with 72 characters width
> ---
>  drivers/gpu/drm/panel/panel-simple.c |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Applied, thanks.

Thierry

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW1xD0AAoJEN0jrNd/PrOh6+gP/2hHu4YCUUpShT0UON5yy/1U
vP6XJ+7Ymuy5OJqNTcyH03qSGk/nvfRoF+We4T3YWVY+Lo+jUXOnl9iBUl2MiZ5i
H0xGGmrARLujrPMhi50p1GnEFTmxaOa2V6pGEp6B5tC7k3sskgDnKvlhg490r8kX
y+LwztbtNT206jkQw/YqQz5R0BCi2iUoDbvO8U/TuhtTSAKSPsrrm7xLeHKDjxjA
uSfa1be60LJQrGIGgbChpf/Jp97huCL4XlfFCILdIoqlrb+iRWGlWlIJXAXkZCB0
kFGA3hvFjuUt9iW4tPlF1VEsueMnuaIplWVFP9YCyyOkZVVuf9o+pLm4uXfp7GoD
jAYybCA1lj5JdEBF/pmMkWWKLG798kio4GcbeQWt8xiYd0RoL68/Gj1EC70GX4Fh
udMlJ8J3s4XTYpWT51p4X75VVSD8srQfapo3mikAg0M+VdhLYBeLpLmE+VLZLhJa
pMTKnj9cw2nWxxtUUBAmO14/Xdihqygvv4W7oeni0WL0w/PoiHrWhFXma8SL58zd
mDcf3AjrXjQTMN35FyOjDGLuoXJFGWIltbNsYNWCus0R11w2H6lNfmHcYqMqbZjs
KtN2KFImMq5ixurGtNg3IYXDy5aS8goQzbH/IJn2uLs+/HwWDEDmUzPCwvCtoQ9v
t7Eo3g+zJZa9zFRXnHV+
=fAm3
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
