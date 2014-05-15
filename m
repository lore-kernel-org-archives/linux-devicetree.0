From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] drm/panel: Add support for EDT ETM0700G0DH6 and
 ET070080DH6 panels
Date: Thu, 15 May 2014 12:54:28 +0200
Message-ID: <20140515105427.GK6434@ulmo>
References: <1400149547-1541-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0868306856=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400149547-1541-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, kernel@pengutronix.de, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org


--===============0868306856==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YQEH9CATo+4lan7A"
Content-Disposition: inline


--YQEH9CATo+4lan7A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 12:25:47PM +0200, Philipp Zabel wrote:
> The EDT ETM0700G0DH6 and ET070080DH6 are 7" 800x480 panels,
> which can be supported by the simple panel driver.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v2:
>  - Added device tree binding documentation. Do we really want to add one =
little
>    file for each panel?

I guess we could move all of the compatible values into simple-panel.txt
but I don't see a need for that yet.

> ---
>  .../devicetree/bindings/panel/edt,et070080dh6.txt  | 10 ++++++++
>  .../devicetree/bindings/panel/edt,etm0700g0dh6.txt | 10 ++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++=
++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/edt,et070080d=
h6.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/edt,etm0700g0=
dh6.txt

Applied, thanks.

Thierry

--YQEH9CATo+4lan7A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdJzjAAoJEN0jrNd/PrOhWX4P/Rlr05lHD93bmNuMMMJLLuDJ
LastHxcdgvxEn+AXz4LJcwwgt4c9avpl23iBO5B86oh0sgIU2H7go8InJJ19VGVI
fAp6s8Hmjd82TH3KcylSswGXOyylz6DKwtswgk/BzOQcKSnA8AgADAf1WTM69TZs
UI3aJTzJrTi7ViYJSw0kxBczp7FBX5waR4BrZ5qMs2hOyW/FYZll56rUeLgbK14x
mN9dnuMZgpv4V6fhEujppu0rvHJidF1dF12pJNN3Oh4nDIpbPdGGCN6+TAd1Dk88
6rfGAAlL/7XejBZJKoP0uP/MdCw8oI50uJNRKBgjiYwBeTvlVXQV3yPVTbuDA5J8
oPwp6MQWrS93wIV2Yhbd6kNUi9apsAgEBJK77UXyLd8FnZYXvqXI/RWe6OjE7GEp
1yWCuTMFZCcL/1+pjb2xZBnijbKeFoqu5bYYzYvXqrHx2TX8sbUvDC6PClcexA/O
0t6pKScAzQGrL55ic4n3B87yhTVRI7gOdBZvCKf4kekGiw1nnGCjonaU8mw7xge7
SCPKiMltIcniLofxYEw959hsSpXziOK+A9L7GdcfwaEIUM+ci53cE6SWERC81t2A
Gg2jf0V2/mQY3me06PZzkqIZUhfg8OGrsuQTvLSy/qKf7XAoL8jLw2KH4Xu+1m+m
QL58BsuKId132OcAZiBf
=t8Eu
-----END PGP SIGNATURE-----

--YQEH9CATo+4lan7A--

--===============0868306856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0868306856==--
