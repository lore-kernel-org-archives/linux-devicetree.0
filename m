From: Paul Burton <paul.burton@imgtec.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: Document img,boston-clock binding
Date: Thu, 22 Jun 2017 14:36:24 -0700
Message-ID: <13746237.zQXctdWVES@np-p-burton>
References: <20170617205249.1391-1-paul.burton@imgtec.com> <20170617205249.1391-2-paul.burton@imgtec.com> <20170622205655.2sp2v3hva3jtsuay@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6873910.WAOfOn81ZG";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170622205655.2sp2v3hva3jtsuay@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--nextPart6873910.WAOfOn81ZG
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Rob,

On Thursday, 22 June 2017 13:56:55 PDT Rob Herring wrote:
> On Sat, Jun 17, 2017 at 01:52:46PM -0700, Paul Burton wrote:
> > Add device tree binding documentation for the clocks provided by the
> > MIPS Boston development board from Imagination Technologies, and a
> > header file describing the available clocks for use by device trees &
> > driver.
> > 
> > Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-mips@linux-mips.org
> > 
> > ---
> > 
> > Changes in v5: None
> 
> I reviewed v4. Please add acks/reviewed-by when posting new versions.

Apologies, this one slipped by unnoticed.

Thanks,
    Paul

> 
> > Changes in v4:
> > - Move img,boston-clock node under platform register syscon node.
> > - Add MAINTAINERS entry.
> > 
> > Changes in v3: None
> > 
> > Changes in v2:
> > - Add BOSTON_CLK_INPUT to expose the input clock.
> > 
> >  .../devicetree/bindings/clock/img,boston-clock.txt | 31
> >  ++++++++++++++++++++++ MAINTAINERS                                      
> >   |  7 +++++
> >  include/dt-bindings/clock/boston-clock.h           | 14 ++++++++++
> >  3 files changed, 52 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/clock/img,boston-clock.txt create mode
> >  100644 include/dt-bindings/clock/boston-clock.h


--nextPart6873910.WAOfOn81ZG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEELIGR03D5+Fg+69wPgiDZ+mk8HGUFAllMOFgACgkQgiDZ+mk8
HGVzEw//Yorvn4hI/K3R7irnxQ7EzT2cMjBI/+Gx1feWA12CfYongJuZJlRC+8bd
uFM8Bx4WF54mx1FUgv5xr+1/lYDXn6YgwFLaaLvUQr4v450/Lg1ZeB9mG0CH2B7f
OJdwqAi7anZbElaH8hohZ1uCKyYUKgKO5EYKqtosBkwbx7OzW3qbqY7ow9+hVoSm
maTD8GQyrGyXwj/pKo0JXzDdTb9xgvp0JTy5O4Vinp7GrTo+IDRhnR2pjMtCxpj2
hfeOjQ6Kb6aFNFQQqNoVb+GaHEaaM6+9NNjpTF8+bxdyEGldWwKxIW8ITD+mJ6Nh
PTS90uGDNHioLhdSr5iISy6KYvEMu7WopxJlZV5hEIN5IR01ZOCGobrXtv4I1WLK
ZdU682vcRFl/MVMFT93qEcyo66WopmZ5KQ2nbuqTfbsixSdsI/qjyFqImsJswn5v
/o9JWfAeN56WaWW+wCV4O0ou87wevO4uVTKe6/7oNS/xfRi06uUdGyYtgneNspwQ
vPDMYxfs6HodpVrAP7Di3bSMe6b6uXzoVMI/77j80dIcN1XoHn9TLKPr32wKd3Gp
faZf6fEPtxIGfP8Y50ILZ7lyQ0x6kzyn4E+Q4CHteevGQltxzWe7r4RO+qQDVARc
9Wg/HiFYfbCb2DxoFV/HJPeFET/LtZY1rUfeSYWfLTCF3P9ok9g=
=B9d8
-----END PGP SIGNATURE-----

--nextPart6873910.WAOfOn81ZG--
