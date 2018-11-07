From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Date: Wed, 7 Nov 2018 20:23:45 +0100
Message-ID: <20181107192345.6cq6hzpqzl6j535b@ninjato>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20181107085056.GB31092@kunai>
 <7154affe-751a-7cb4-48ea-3d4d6f467ac8@gmail.com>
 <20181107130810.GA18223@kunai>
 <f7d99456-f68f-7880-f22e-8bd47a546e82@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3101710068854247482=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f7d99456-f68f-7880-f22e-8bd47a546e82@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============3101710068854247482==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pl5mm5sxrcz3eoqt"
Content-Disposition: inline


--pl5mm5sxrcz3eoqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We discussed this on IRC already, which is why I need to look into that.
> The HS200 works well on the M3N though.

Can you push the branch you used somewhere? I retested the branch from
Dunbar with my M3N and it works fine with my tests.


--pl5mm5sxrcz3eoqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvjO70ACgkQFA3kzBSg
Kbb7XQ/+OhNZhaUstxUORWmcbw6coeRKx66ddc013CX7x3GMd5OUo/dJwrzNI5GF
1J21yLBURVtTymZ4LY0fH23YgPm/FpJNLCuCurcvcKDPBy8gZpLC0es43ACB99ej
4CStOQOK2DJGDf4S92gbi6xBh6c+IeEQrhgEJnojagnAoI9PYekOnls/NAbjM+lj
+TokHrYHiDEeEGPiyGxoMQ0tX8+HLTaKlHq1IqpN4PaipsvK+JYJKd0i1nA84hGO
MTvD/IbW9nhsr3Z+52pOROuiIwOZdFdncdIp7nt1JM0GdIuhLe7VzYTrWnQRD4as
WO3zN1lmtYlHinEnVgD4whb5fCLEln9J3fGzHgTJHecEZH9eJJYznCHQreijAs+t
L+xdgCMPRImx91VW/cjI7lPgEjGI8svQSRtMEEZGWoe0lqpGEk0+vN78cQAu20Ut
czWFyAkGMIeqtPlRxnT9b51Cjl6RPl0kLmKsMhpnkB+/624kL7Y6yfeiwE45cRnI
D7mIDz/afcuYuFdXC15fKpHjSlxnhpVFiSmIr1pkhwu/+/mS8g+7sT2dUPm1/l0e
Rvj1rGFARNwQUm1bsr6skOx+4dY7zE56fEtwbkRa+VIPLWDVhOj7oYP1azDeJjDs
l4on8FQje0hX8hR3ZLei3mECl/oO9SpVSdy3aHxgYCsifRIYErg=
=z10R
-----END PGP SIGNATURE-----

--pl5mm5sxrcz3eoqt--


--===============3101710068854247482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3101710068854247482==--
