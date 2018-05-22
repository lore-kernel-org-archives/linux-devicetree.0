From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/9] ARM: dts: lager: Drop MTD partitioning from DT
Date: Tue, 22 May 2018 14:34:26 +0200
Message-ID: <20180522123426.babh2lm6icyvlqdo@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-2-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3686999633061731982=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180522120257.13232-2-marek.vasut+renesas@gmail.com>
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


--===============3686999633061731982==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sbxzebvbhenfqsrv"
Content-Disposition: inline


--sbxzebvbhenfqsrv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:50PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>=20
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>=20
>   mtdparts=3Dspi0.0:256k@0(loader),4096k(user),-(flash)
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--sbxzebvbhenfqsrv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDlIACgkQFA3kzBSg
KbaCFw/8CsNTiCCFxPjhzvE5lo57dB39+ewANwc6tO4S1xxB4nc48JqbLCPxF/KP
HtKO/BrMum+JD/sxvl0eWGBJYrgovvi9RLgG1ORIcWxYQcm1K0OALkE/NnaTIZpu
9HZxk+8kUk7lO6vy2UVT5qwXkUTlcNNmBa0fyN4oPwWd3vkWsjQd99f4cR6fQfSI
oXejgFJcfN48W8BqDeJtWtCB8njDLmgrvWeXieWkHZw+YzpbQDoLtesirx5dPQ7n
SVvxbOyKWAU5srXrNgGPbqgvPZXf+/nSZ5pa4W26slh0EJOFuEea3CIhNYdACpGB
sbzL/7ll6LfFN+0K/xIkZqbzd9PVc8NCqc2pGFnevg8zrAl40SkFzf7RirorvE7b
exwRY/ycU1paD/XRcTqb8d4Ij4pAZpB66FOTkHDhExkSA5+WH38gKEO/kHS67hyp
FofXvVW5yt5NBCTB9n1gp8phqYK7+3j78n7P5+unaqquPB7GeVv07KXDdrlTOiXN
JHQ/nNB6Re0o1WfSz2Kbzmj5nEmpLrQ8TGgMw79K6T1GUO0efoczzOB7+v8Uf2Kq
LCW+vp/UKHLfggXgWzyGeTq7lqid69zDQwbVKWgYLEB3nGqGElQCyGhblkCH51BA
lv7Okc0g0qxhvXs0j/+QM0hpuh/iLwlxeqbJbG/Mg0NRTLv1/mo=
=tjxv
-----END PGP SIGNATURE-----

--sbxzebvbhenfqsrv--


--===============3686999633061731982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3686999633061731982==--
