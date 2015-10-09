From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCH 1/3] doc: dt: fpga: Added Documentation for Xilinx Zynq
 FPGA manager.
Date: Fri, 9 Oct 2015 11:04:23 -0500
Message-ID: <20151009160423.GL10631@jcartwri.amer.corp.natinst.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
 <1444344307-22509-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y96v7rNg6HAoELs5"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444344307-22509-2-git-send-email-moritz.fischer@ettus.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: michal.simek@xilinx.com, soren.brinkmann@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, atull@opensource.altera.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
List-Id: devicetree@vger.kernel.org


--y96v7rNg6HAoELs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2015 at 12:45:05AM +0200, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../bindings/fpga/xilinx-zynq-fpga-mgr.txt         | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-zynq-fp=
ga-mgr.txt
>=20
> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.=
txt b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
> new file mode 100644
> index 0000000..82ffda8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
> @@ -0,0 +1,26 @@
> +Xilinx Zynq FPGA Manager
> +
> +Required properties:
> +- compatible:		should contain "xlnx,zynq-devcfg-1.0"
> +- reg:			base address and size for memory mapped io
> +- interrupt parent:	interrupt source phandle

I think you mean 'interrupt-parent', with the hyphen.

Actually, this isn't really a 'required' property of this node, as it
could be specified in a parent node.

  Josh

--y96v7rNg6HAoELs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWF+WEAAoJEKp7ZBKwQFArKuAIAJeM0WXBLGoNHdE4Zez6hBMi
KtYrf3KknYwcL/UVcEGWEKAEJ0KmsJvJQP3JpXil2vYL+i37NDqJOhH1LrwrlT9H
sv4yBD8cZQE4SP2cNU22pa4UwsmCS+F1N6BbrIAi9IZVmwMc3Udbp1AdFU5yIbLt
N+Zj707BFNKR3FxHIpYrsssBwbkezcG6Qz5uem9exE6ILWmBIWHju1lslUpNyR6v
8YExYKqBim1o5fxhTEvpAPCk1YrcFTyzHbiCfsziRVopbB9cVEmYQy3nAjD6ZTyD
oaIsaiRMNDG2M/XlhKBb2qKSJqsAqUvQ8VjKNr3WrI7l1fIDDAPu1E/OSXqrGik=
=m7Gr
-----END PGP SIGNATURE-----

--y96v7rNg6HAoELs5--
