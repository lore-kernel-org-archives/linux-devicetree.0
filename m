From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v3 08/31] fs_enet: cleanup clock API use
Date: Mon, 22 Jul 2013 14:28:36 +0200
Message-ID: <51ED2574.9020105@pengutronix.de>
References: <1374166855-7280-1-git-send-email-gsi@denx.de>
 <1374495298-22019-1-git-send-email-gsi@denx.de>
 <1374495298-22019-9-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3319390119970734287=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1374495298-22019-9-git-send-email-gsi@denx.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Gerhard Sittig <gsi@denx.de>
Cc: Mike Turquette <mturquette@linaro.org>, Detlev Zundel <dzu@denx.de>, Wolfram Sang <wsa@the-dreams.de>, David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3319390119970734287==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2VRGGGALKWWVRSRWLRCSB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2VRGGGALKWWVRSRWLRCSB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/22/2013 02:14 PM, Gerhard Sittig wrote:
> make the Freescale ethernet driver get, prepare and enable the FEC cloc=
k
> during probe(); disable, unprepare and put the clock upon remove(); hol=
d
> a reference to the clock over the period of use; use devm_{get,put}_clk=
()

There's no need for devm_clk_put(), devm will take care of this.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2VRGGGALKWWVRSRWLRCSB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlHtJXoACgkQjTAFq1RaXHN1PACePqdj/CxFKu+bqSy6adn7oXmW
om0An0nK+7eDaIBkSQtkgN9tpyRVmX1P
=XQKt
-----END PGP SIGNATURE-----

------enig2VRGGGALKWWVRSRWLRCSB--

--===============3319390119970734287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/linuxppc-dev
--===============3319390119970734287==--
