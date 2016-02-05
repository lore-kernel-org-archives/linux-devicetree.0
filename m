From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCH v16 1/6] fpga: add bindings document for fpga region
Date: Fri, 5 Feb 2016 16:44:46 -0600
Message-ID: <20160205224446.GG9579@jcartwri.amer.corp.natinst.com>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com>
 <1454707803-27947-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yZnyZsPjQYjG7xG7"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1454707803-27947-2-git-send-email-atull@opensource.altera.com>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Moritz Fischer <moritz.fischer@ettus.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org


--yZnyZsPjQYjG7xG7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alan-

First off, thanks for all of your (and others') work on this.

On Fri, Feb 05, 2016 at 03:29:58PM -0600, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
>=20
> New bindings document for FPGA Region to support programming
> FPGA's under Device Tree control
>=20
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
[..]
> ---
>  .../devicetree/bindings/fpga/fpga-region.txt       |  348 ++++++++++++++=
++++++
>  1 file changed, 348 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/fpga-region.txt
>=20
> diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Doc=
umentation/devicetree/bindings/fpga/fpga-region.txt
> new file mode 100644
> index 0000000..ccd7127
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
[..]
> +FPGA Manager & FPGA Manager Framework
> + * An FPGA Manager is a hardware block that programs an FPGA under the c=
ontrol
> +   of a host processor.
> + * The FPGA Manager Framework provides drivers and functions to program =
an
> +   FPGA.
> +
> +FPGA Bridge Framework
> + * Provides drivers and functions to control bridges that enable/disable
> +   data to the FPGA.
> + * FPGA Bridges should be disabled while the FPGA is being programmed to
> +   prevent spurious data on the bus.
> + * FPGA Bridges may not be needed in implementations where the FPGA Mana=
ger
> +   handles this.

It still seems strange for me architecturally for the FPGA Bridge to be
a first-class top-level concept in your architecture, as they are a
reflection of the SoC FPGA manager design.  That is, I would expect the
bridges not to be associated with the FPGA Region, but with the FPGA
manager.

Although, I will concede that you you've made it possible to not use
FPGA Bridges (like on Zynq where they aren't necessary), so maybe it
doesn't matter, just smells strangely.

> +Freeze Blocks
> + * Freeze Blocks function as FPGA Bridges within the FPGA fabric.  In th=
e case
> +   of PR, the buses from the processor are split within the FPGA.  Each =
PR
> +   region gets its own split of the buses, protected by an independently
> +   controlled Freeze Block.  Several busses may be connected to a single
> +   PR region; a Freeze Block controls the traffic of all these busses
> +   together.
> +
> +
[..]
> +Device Tree Examples
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The intention of this section is to give some simple examples, focusing =
on
> +the placement of the elements detailed above, especially:
> + * FPGA Manager
> + * FPGA Bridges
> + * FPGA Region
> + * ranges
> + * target-path or target
> +
> +For the purposes of this section, I'm dividing the Device Tree into two =
parts,
> +each with its own requirements.  The two parts are:
> + * The live DT prior to the overlay being added
> + * The DT overlay
> +
> +The live Device Tree must contain an FPGA Region, an FPGA Manager, and a=
ny FPGA
> +Bridges.  The FPGA Region's "fpga-mgr" property specifies the manager by=
 phandle
> +to handle programming the FPGA.  If the FPGA Region is the child of anot=
her FPGA
> +Region, the parent's FPGA Manager is used.  If FPGA Bridges need to be i=
nvolved,
> +they are specified in the FPGA Region by the "fpga-bridges" property.  D=
uring
> +FPGA programming, the FPGA Region will disable the bridges that are in i=
ts
> +"fpga-bridges" list and will re-enable them after FPGA programming has
> +succeeded.
> +
> +The Device Tree Overlay will contain:
> + * "target-path" or "target"
> +   The insertion point where the the contents of the overlay will go int=
o the
> +   live tree.  target-path is a full path, while target is a phandle.
> + * "ranges"
> + * "firmware-name"
> +   Specifies the name of the FPGA image file on the firmware search
> +   path.  The search path is described in the firmware class documentati=
on.
> + * "partial-reconfig"
> +   This binding is a boolean and should be present if partial reconfigur=
ation
> +   is to be done.

Another architectural smell: there are categorically two different types
of properties here.  The first kind is those properties which describe
_what_ IP exists within the FPGA image (all of the nodes under the regions,=
 etc).
The second kind of properties are those which describe _how_ the image
should be written (partial-reconfig, firmware-name).

It seems weird, but maybe it doesn't matter much.

Thanks,
  Josh

--yZnyZsPjQYjG7xG7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWtSXbAAoJEKp7ZBKwQFArSTgIAJlrfDQ1JdsEXn6P9hxTsKII
0LFJv5XGwp+A1HbtVFAEPJswNZ8zbLvxn643u1TXGw2Hv6LiGq6VEkuf/wH4dNiC
KCC3I9wZVoOos4dC3VENlWYM6mSjaDNo8hP3Hj6dHImDXH4rA0AwpqKxMIKRozEl
MoRExVM1C8vtVXtZcCy8fNTGzSg7eVlbPChwbSkHiHzSOuhtX9ZmFoQ5ljB636Vy
w8wgtE1CZ8QiVYhBB/2tLvE4Z66d+wBCgBG8Pvgor0KjW0JKkwWicczoBSa57w80
crusu5XZUk4VT/OlpMM3BHby/iUkBitPiS/4er0ZkBkURFixMWJ5I+9NiY9tQcU=
=jUjn
-----END PGP SIGNATURE-----

--yZnyZsPjQYjG7xG7--
