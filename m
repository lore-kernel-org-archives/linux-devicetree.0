From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCHv2 1/3] ARM: dt: fpga: Added binding docs for Xilinx Zynq
 FPGA manager.
Date: Sun, 18 Oct 2015 19:24:10 -0700
Message-ID: <20151019022410.GG5257@xsjsorenbubuntu>
References: <1445035350-3569-1-git-send-email-moritz.fischer@ettus.com>
 <1445035350-3569-2-git-send-email-moritz.fischer@ettus.com>
 <20151018175120.GG12756@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151018175120.GG12756@jcartwri.amer.corp.natinst.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, michal.simek@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, atull@opensource.altera.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 2015-10-18 at 12:51PM -0500, Josh Cartwright wrote:
> On Fri, Oct 16, 2015 at 03:42:28PM -0700, Moritz Fischer wrote:
> > Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> > ---
> >=20
> > v2:
> >  - Clock names are now a required property
> >  - Removed interrupt-parent property
> >=20
> > ---
> >  .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt | 19 +++++++=
++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-z=
ynq-fpga-mgr.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpg=
a-mgr.txt b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr=
=2Etxt
> > new file mode 100644
> > index 0000000..7018aa8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.t=
xt
> > @@ -0,0 +1,19 @@
> > +Xilinx Zynq FPGA Manager
> > +
> > +Required properties:
> > +- compatible:		should contain "xlnx,zynq-devcfg-1.0"
> > +- reg:			base address and size for memory mapped io
> > +- interrupts:		interrupt for the FPGA manager device

If we are that picky, this is technically an interrupt specifier :)

> > +- clocks:		phandle for clocks required operation
>=20
> Technically a "clock specifier", but other than that:
>=20
> Reviewed-by: Josh Cartwright <joshc@ni.com>
Reviewed-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

	S=C3=B6ren
