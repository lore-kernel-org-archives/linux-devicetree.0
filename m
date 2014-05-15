From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] drm/panel: Add support for EDT ETM0700G0DH6 and
 ET070080DH6 panels
Date: Thu, 15 May 2014 23:41:49 +0200
Message-ID: <20140515214147.GD7136@mithrandir>
References: <1400149547-1541-1-git-send-email-p.zabel@pengutronix.de>
 <20140515105427.GK6434@ulmo> <5374E31F.80504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1877517662=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5374E31F.80504@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org


--===============1877517662==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline


--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 09:54:07AM -0600, Stephen Warren wrote:
> On 05/15/2014 04:54 AM, Thierry Reding wrote:
> > On Thu, May 15, 2014 at 12:25:47PM +0200, Philipp Zabel wrote:
> >> The EDT ETM0700G0DH6 and ET070080DH6 are 7" 800x480 panels,
> >> which can be supported by the simple panel driver.
> >>
> >> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> >> ---
> >> Changes since v2:
> >>  - Added device tree binding documentation. Do we really want to add o=
ne little
> >>    file for each panel?
> >=20
> > I guess we could move all of the compatible values into simple-panel.txt
> > but I don't see a need for that yet.
>=20
> If they aren't added there, then I believe checkpatch will complain
> about patches that start to use the new compatible values, since they
> won't be documented.

Added where? simple-panel.txt or in separate files per compatible?

Thierry

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdTSbAAoJEN0jrNd/PrOhZR8P/R3Jos+IhWTUpUVEoCiNi3/U
vQluv2perj8yXA7iq6BNwjnun1jc75/GFRJeVHseQCIRPfX0D2Qtwdc5IxvRbQ+N
h+fWbGzrLDaRDxRInqmjKM8c9dQHc5NWUgO9te4uWWFzZ6vHQMKk1CtpSAcKPRTt
hYqgxcBkWSFPV5C6NCiXGwQ//e6mDgWwwLOc150GZosG/o0u04rxLjETqO+kClPf
+caE/N3U1ZbW7iFtyGKTheaKP1xoasqG8G9LeLoTEM0hzi9WrAV6wek/fCfVDoDP
qJoABdSa5sQyOUjgxM7DUzvaCUpxYv90iyZs9jjXZ4QoQp0emk72yGHeCVD8ao8g
QbUUrrYjm4Vfk717gOOxsGx8fXBBnaawmf2gIyTUzsCyZdh6p7ZtRQt5SdCB8omP
SCOYuxU1VtqFBG/i7TsAOiSgcGP+KzTODxfWJA4g6PiQCsZkr/7WROfT6ylYXDlK
eWl+aCPd13ssvlHe/W/kSvGQDfvm/MHtQkXOlu2dqnKjJDaJwuqyRYnYp2WnZWOE
zvsTN6+5Cjy3vM3I68m2fwFPRDG1ry+AGlJzt6CHzDswx+QoY+g2WgoxBT+PbbZe
2C+1p2dS7nYvTOUEGx5MQGkJhb7g+lppkSHHQ/81mnHyQ8vvIi99duysDXZX+UqN
aZhzZc8mT6qUB8WU+lfi
=OYa6
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--

--===============1877517662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1877517662==--
