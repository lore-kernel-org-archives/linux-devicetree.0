From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 04/15] usb: doc: phy-mxs: update binding for adding
 anatop phandle
Date: Thu, 12 Dec 2013 22:25:04 -0600
Message-ID: <20131213042504.GE867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-5-git-send-email-peter.chen@freescale.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8721898982499115255=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386897825-6130-5-git-send-email-peter.chen@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <peter.chen@freescale.com>
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rob.herring@calxeda.com, balbi@ti.com, kernel@pengutronix.de, grant.likely@linaro.org, shawn.guo@linaro.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============8721898982499115255==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Content-Disposition: inline

--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 09:23:34AM +0800, Peter Chen wrote:
> Add anatop phandle which is used to access anatop registers to
> control PHY's power and other USB operations.

no related to this patch, but this feels like OMAP's System Control
Module (a rather simplistic IP which control power for a few other IPs).

We're starting to see a pattern here, eventually we will need a more
generic approach to such types of modules. For now, don't worry :-)

--=20
balbi

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqowgAAoJEIaOsuA1yqREI48P/3050nyjQvJslYgQipAdsqXz
/pPMz99ebIDMDfAyFvx4hcjRbsj3mCgKDPJiSgEznWthqHnobMKbObdn3OO3BDl/
NF0k5WU3aNdpKKFoeFA3vwbqutAzzwzuuOe90jhlGnRgIfqOMca07avZO6teZkbM
lijpi+Of+iHihjFJy4J/q2IIK8I5k+YEh78rBck9vAVZ3rBLb21/5x3nsSUmI5cd
GpiFtTexsDVImALAcsbCr0Rl3k2tC4XKulBcJceG92IlcfdE9c9mPLTFvqt6oPg9
VQy0vJIvFaasl4lNH2Vx5IZf/zldV1ihmPRIOisCW0yeUbn7g4OljMsG9w1hajnF
C/it9qf728kn/GoBOJ/dwiXNIb48n9vrDv/ZlWAXXJvQcrtfc8arCZo38IAuWpZK
gffTfevWgxj0rAthmfevyM0JXkEOqlZx6AeCMfIJT2PwY1GfXSUvTBAcacTA9Bh+
vRdcsuyIg5FtGbMUr62NnnO/o7b8ZjCnkDjPtrzLpKVk7O9JP0Xv2YBy5hNmAgjp
BvUm2zskV91DafzO0TYig2nzaBoJtTBmuM7fyB2A/71k9n8G+Mt9pxHMBeCfCPrn
6UnFWm45u565xRJ74zWXm6wMEWRLlIao9zcwLSgukegLoKfoe63+NNMkpnJhqig0
65+QrUNoqBlK0zer96S6
=wBvf
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--


--===============8721898982499115255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8721898982499115255==--
