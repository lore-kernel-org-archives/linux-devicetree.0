From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] MTD: Add device-tree support to fsmc_nand
Date: Mon, 19 Mar 2012 19:03:04 +0200
Message-ID: <1332176584.11468.4.camel@sauron.fi.intel.com>
References: <1331889571-3372-1-git-send-email-sr@denx.de>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8972502758606068591=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1331889571-3372-1-git-send-email-sr@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Stefan Roese <sr@denx.de>
Cc: Viresh Kumar <viresh.kumar@st.com>, spear-devel@list.st.com, linux-mtd@lists.infradead.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org


--===============8972502758606068591==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-W+0wGxT/dZQ9sDcX76gz"


--=-W+0wGxT/dZQ9sDcX76gz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-16 at 10:19 +0100, Stefan Roese wrote:
> This patch adds support to configure the FSMC NAND driver (used amongst
> others on SPEAr platforms) via device-tree instead of platform_data.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-W+0wGxT/dZQ9sDcX76gz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPZ2bIAAoJECmIfjd9wqK0694QAIHlo/oULY37l2TC9V/EFq21
mXYtPX06Q3dfMv35/O1bLqkHLbYlm4kRMWQ3mL+0PPHHuLxy8xTh9LPbs6qQ84Rl
9WOlpQb2tr+oNRBsHMKSqe9rLdHjh1WdJpy6TLv1Ri+XzB+vgDw7I1vI87H8DNoe
McmNX8RBvomWHaSYpe5VpLX2yMAVGrgEwaUxpyovUS8yYqJO2ZzMdFwLn+qrLKDQ
8Jf4FfFQMvavYgTfn8Z6PKofdEK2+tJWR+Ra4P6nby0UFT640IirvCFgebU7QFR7
eL7PulzqzqXwWWvPxuZskbM++yYGnZykoWJyMqMAFoZ4hSIHgi6i0srZ1iw4NfNk
Tqb866wXD0TBrcxWM7LzxHIX2rTPL0J2E7EBINcs6hhPFVzc2zuGHkTbfNxbCvGK
VGsgPC36Jtuqz0qBLpNcyI3RxkAj3Po3WFB08N5m//6x4rFSflP6bIVFVntDV3mR
hPU+vp45XRzZUzZRnf3P61GigbKtPU7PfEyBjQLAkWuJZBgfb9Ot7gZE1EcIE+2d
qQVcy2gFq+i41Litj2WHyunxLAtnegnEITBc1y5font2z9JU+HoWB4VZc23RxOY1
C+eFk+GjZd+hi6sn9+Cpz+s1V6NqgMQ0BSNUC28xwHJx5OMr2+rpQu7YjH8l/4Uq
zfn+zlfAdthv8ZOFMDax
=vtDE
-----END PGP SIGNATURE-----

--=-W+0wGxT/dZQ9sDcX76gz--



--===============8972502758606068591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8972502758606068591==--
