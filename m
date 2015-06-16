From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCHv4 1/2] dts: Adding docs for Xilinx LogiCORE IP mailbox
 driver.
Date: Tue, 16 Jun 2015 13:45:22 -0500
Message-ID: <20150616184522.GU633@jcartwri.amer.corp.natinst.com>
References: <1433175507-3833-1-git-send-email-moritz.fischer@ettus.com>
 <1433175507-3833-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjpMrWxdCilgNbo1"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433175507-3833-2-git-send-email-moritz.fischer@ettus.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, arnd@arndb.de, joe@perches.com, jingoohan1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--kjpMrWxdCilgNbo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2015 at 09:18:26AM -0700, Moritz Fischer wrote:
> Changes from v3:
> - Changed reg size to 0x100
>=20
> Changes from v2:
> - Addressed Michal's stylistic comments
> - Fixed typo in compatible string
>=20
> Changes from v1:
> - Added common clock framework support
>=20
> Changes from v0:
> - Fixed example bindings
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  .../bindings/mailbox/xilinx-mailbox.txt         | 44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt=
 b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> new file mode 100644
> index 0000000..f9ec46d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> @@ -0,0 +1,44 @@
> +Xilinx Mailbox Driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Required properties:
> +- compatible       : "xlnx,mailbox-2.1".
> +- reg              :  physical base address of the mailbox and length of
> +                      memory mapped region.
> +- #mbox-cells      :  common mailbox binding property to identify the nu=
mber
> +                      of cells required for the mailbox specifier, shoul=
d be 1

It seems strange to me to require #mbox-cells =3D <1>, when this hardware
only supports a single channel.  Why not #mbox-cells =3D <0>; ?

  Josh

--kjpMrWxdCilgNbo1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVgG7CAAoJEKp7ZBKwQFAr/MgH/1iYEHdVAN6IFr9IQYVywOXH
JDI89vLBAEKfEZNby4k1JjBKevTj3r2pfDsTklulXBRL1jyT4vH1sN1/LmLL8RXZ
avT9VYrEZOOcnUWQDFaOplsQJwNZdrjelLi4FY20MeMAWE6DNcU6hHuo7RisNUf6
N3TtRCnKRBLKDOgXFB1NDGdOiaCP+nOWu6PelxEqovVRPlczPUmIVf+4eIvU3+co
hmrbzyCJlsBOCVuTAFo/0/ceCaVOINbn+Wgn/zKuzmI1ek76YSKv2UPAtlXqnBd2
jfZVJEaPso0ulOXML/+PFDP0L9ujGW4GPTp4+AitUS8MC7pw21BCtewaBvJcVUY=
=JUxc
-----END PGP SIGNATURE-----

--kjpMrWxdCilgNbo1--
