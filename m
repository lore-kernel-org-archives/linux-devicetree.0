From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 01/12] dt-bindings: xilinx-sdfec: Add SDFEC binding
Date: Thu, 2 May 2019 15:15:33 -0500
Message-ID: <CAL_JsqLhmtqUdUd8OPdx-390imegzouAJ43JOhYr16w87afS-Q@mail.gmail.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-2-git-send-email-dragan.cvetic@xilinx.com>
 <20190501194738.GA1441@bogus> <BL0PR02MB56815DFC139D65D46D5DFF50CB340@BL0PR02MB5681.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BL0PR02MB56815DFC139D65D46D5DFF50CB340@BL0PR02MB5681.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <draganc@xilinx.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 2, 2019 at 6:04 AM Dragan Cvetic <draganc@xilinx.com> wrote:
>
> Hi Rob,
>
> Please find my inline comments below
>
> Thank you
> Dragan
>
> > -----Original Message-----
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Wednesday 1 May 2019 20:48
> > To: Dragan Cvetic <draganc@xilinx.com>
> > Cc: arnd@arndb.de; gregkh@linuxfoundation.org; Michal Simek <michals@xilinx.com>; linux-arm-kernel@lists.infradead.org;
> > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > Subject: Re: [PATCH V3 01/12] dt-bindings: xilinx-sdfec: Add SDFEC binding
> >
> > On Sat, Apr 27, 2019 at 11:04:55PM +0100, Dragan Cvetic wrote:
> > > Add the Soft Decision Forward Error Correction (SDFEC) Engine
> > > bindings which is available for the Zynq UltraScale+ RFSoC
> > > FPGA's.
> > >
> > > Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > > Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> > > ---
> > >  .../devicetree/bindings/misc/xlnx,sd-fec.txt       | 58 ++++++++++++++++++++++
> > >  1 file changed, 58 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt b/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
> > > new file mode 100644
> > > index 0000000..425b6a6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
> > > @@ -0,0 +1,58 @@
> > > +* Xilinx SDFEC(16nm) IP *
> > > +
> > > +The Soft Decision Forward Error Correction (SDFEC) Engine is a Hard IP block
> > > +which provides high-throughput LDPC and Turbo Code implementations.
> > > +The LDPC decode & encode functionality is capable of covering a range of
> > > +customer specified Quasi-cyclic (QC) codes. The Turbo decode functionality
> > > +principally covers codes used by LTE. The FEC Engine offers significant
> > > +power and area savings versus implementations done in the FPGA fabric.
> > > +
> > > +
> > > +Required properties:
> > > +- compatible: Must be "xlnx,sd-fec-1.1"
> > > +- clock-names : List of input clock names from the following:
> > > +    - "core_clk", Main processing clock for processing core (required)
> > > +    - "s_axi_aclk", AXI4-Lite memory-mapped slave interface clock (required)
> > > +    - "s_axis_din_aclk", DIN AXI4-Stream Slave interface clock (optional)
> > > +    - "s_axis_din_words-aclk", DIN_WORDS AXI4-Stream Slave interface clock (optional)
> > > +    - "s_axis_ctrl_aclk",  Control input AXI4-Stream Slave interface clock (optional)
> > > +    - "m_axis_dout_aclk", DOUT AXI4-Stream Master interface clock (optional)
> > > +    - "m_axis_dout_words_aclk", DOUT_WORDS AXI4-Stream Master interface clock (optional)
> > > +    - "m_axis_status_aclk", Status output AXI4-Stream Master interface clock (optional)
> > > +- clocks : Clock phandles (see clock_bindings.txt for details).
> > > +- reg: Should contain Xilinx SDFEC 16nm Hardened IP block registers
> > > +  location and length.
> > > +- xlnx,sdfec-code : Should contain "ldpc" or "turbo" to describe the codes
> > > +  being used.
> > > +- xlnx,sdfec-din-words : A value 0 indicates that the DIN_WORDS interface is
> > > +  driven with a fixed value and is not present on the device, a value of 1
> > > +  configures the DIN_WORDS to be block based, while a value of 2 configures the
> > > +  DIN_WORDS input to be supplied for each AXI transaction.
> > > +- xlnx,sdfec-din-width : Configures the DIN AXI stream where a value of 1
> > > +  configures a width of "1x128b", 2 a width of "2x128b" and 4 configures a width
> > > +  of "4x128b".
> >
> > Perhaps append with '-bits' and make the values 0, 128, 256, 512.
> >
>
>
> The suggested will require the extra code for converting from 128,256,512  to 1,2,4, as HW is configured with 1, 2 and 4.

A simple divide by 128.

We generally prefer DT to use real units rather than register values.

Rob
