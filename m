From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 5/9] ARM: dts: porter: Drop MTD partitioning from DT
Date: Tue, 22 May 2018 14:34:38 +0200
Message-ID: <20180522123438.gkfd55suu4g2p6nr@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-5-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6514803347781837358=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180522120257.13232-5-marek.vasut+renesas@gmail.com>
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============6514803347781837358==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ug5wdebxo5aqk226"
Content-Disposition: inline


--ug5wdebxo5aqk226
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:53PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>=20
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>=20
>   mtdparts=3Dspi0.0:256k@0(loader_prg),4096k(user_prg),-(flash_fs)
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ug5wdebxo5aqk226
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDl4ACgkQFA3kzBSg
KbYH7w//RFyVVNKLUbQYlY2I+gZwlS+yKVfhq7CwKZFllOJAtoQwEyEhVTmcsmRP
U2FRjua7gp9LMJVpZZlP7fx2J5/F5Z/SERjkhLfffDH3YEqXAhigfvt5sEb67p7X
4y4C6SuoYpQ81LkNkLsi1DqoqH3fR8SOdtrYpHVfH+61BpHmlUL7ECzAT6KAg7VT
6D1TGny5/1bKYKDKegL3Ig1Db1yrgyez0AvmRZrcHByEUWbEYm9P3JkMFxgJGrkg
p28LJZJxEt1vqY1xKAznFCGKJUtqUGQjy2NdT+2g1HS5ac0a+t0Jyv9yU0vsd8wg
nBpVkDY7gfAtL/TwWkbwzhF5ESutWfcqW7GqnujEHpLgafc3fQufwSoSyliGKxHA
lwBEDo9ykvIJ5pYGNmamyhLydXrRMCVO2HaVUbTh3HSpZkOhgzEz5nKrfewPq1Pz
uUPlpevcZgP5ezfWzmhQZ2G+94EtpmnMf2oO7xNLQBiAo+pWMZ4BvbgVve+uVegK
Nsx6+/PH9hE6X8hoTbaUu54lO1uWz9HpssnuE2cpHU+/FRYxzr9RmYoKmqsw87Ls
hNXNJhCGbQipuBv378K6zhYP+abSN/0BFg8Eep7IIBH6bSPpGxUxBYBPd4K6+T2Z
/6X+2/VWYMAtoxmhMhr3ItKSsq+AO9dJ1C5c6LR+R5xJbZ4djoQ=
=g6tG
-----END PGP SIGNATURE-----

--ug5wdebxo5aqk226--


--===============6514803347781837358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6514803347781837358==--
