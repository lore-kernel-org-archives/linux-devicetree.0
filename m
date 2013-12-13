From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 03/15] usb: phy-mxs: Add auto clock and power setting
Date: Thu, 12 Dec 2013 22:23:38 -0600
Message-ID: <20131213042338.GD867@saruman.home>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-4-git-send-email-peter.chen@freescale.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0651139066232089677=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386897825-6130-4-git-send-email-peter.chen@freescale.com>
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

--===============0651139066232089677==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline

--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 09:23:33AM +0800, Peter Chen wrote:
> With the auto setting, the PHY's clock and power can be
> recovered correctly from low power mode, it is ganranteed by IC logic.

s/ganranteed/guaranteed

Also, I think you need to be slightly more verbose here. Maybe explain a
bit what is the "auto setting". From what I can see from the code, it's
a way to let HW manage clock gating.

Another question, does this feature work in all SoCs where this IP is
available ?

cheers

--=20
balbi

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqovKAAoJEIaOsuA1yqREc1QQAJqPpq/BjPQa7XZjwk9cLq9T
G/7du3x95KVft1269YOdTtFmj81t9glY0lxpLNzTsR1IgF2eK1ipfFrLy8ryC6XD
t6ANSHf3oel1S/fRBzf4WDGIuJ0MFOch9p1I++bQE0OfLwez/mCjVNgA6CCqNqBM
yek4chhcV4Whc06KhXqgwGrlQYKS+rUQk4Kg3XK3jLlktGrKYbG6IaMjDeT/jGUg
96mrhktdi7NOA/PmHOU7sohkDGpA+xhX5T1gP5kujl+io0VG+gmHpaE5w/G/kZCj
9lVOcn69ccy6c8tA4MebldxcE6jRWjTM9Ew32/QyD9BeMB/VZgZ5NVbSTwe5iaUf
Sl32pw53cjwRAubIj89aqdzSrXCqPNz8x5jB8uFDlK/NcBekRIvBwXx+IHIG2mEk
B8GaIRqHRCgUEHxXl3xexXXjbagdULtLp0Z25Ua1VJSuvScTmbk4BcO/Yg+MRgEv
5I155H2bggQCBH5/sbVDColcsZnjE8GmkvdQGlyD0h8K9F57koScekmWJGn1eSu7
RDnA7RydQKGFZV2csYrP+hfpeIUC25JMvLs1b8qIwWq4m1h7aa5E8fNb051C3rGj
Pa3FKD5GfbxmuzQSvgC9cdbFbV1B5Dyu0LdF2PjWZjquvC4eypp+hIMJN73LQnHY
qtia1xYxAGZIYsGNtz5Y
=jn9M
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--


--===============0651139066232089677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0651139066232089677==--
