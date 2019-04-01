From: Alan Tull <atull@kernel.org>
Subject: Re: [PATCH v5 6/6] dt-bindings: fpga: Add bindings for ZynqMP fpga
 driver
Date: Mon, 1 Apr 2019 15:50:08 -0500
Message-ID: <CANk1AXTcwb1oJL5Uq-H-Q41-n8SXtamObSedMHSa_smZ8Xr1fw@mail.gmail.com>
References: <20190326143129.2608-1-nava.manne@xilinx.com>
 <20190326143129.2608-7-nava.manne@xilinx.com>
 <20190328170028.GA10815@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190328170028.GA10815@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Nava kishore Manne <nava.manne@xilinx.com>, linux-fpga@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel <linux-kernel@vger.kernel.org>, Jolly Shah <jollys@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, kishore m <chinnikishore369@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 12:00 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 26 Mar 2019 20:01:29 +0530, Nava kishore Manne wrote:
> > Add documentation to describe Xilinx ZynqMP fpga driver
> > bindings.
> >
> > Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> > ---
> > Changes for v5:
> >               -Moved pcap node as a child to firwmare
> >                node as suggested by Rob.
> > Changes for v4:
> >               -Modified binding description as suggested by Moritz Fischer.
> > Changes for v3:
> >               -Removed PCAP as a child node to the FW and Created
> >                an independent node since PCAP driver is a consumer
> >                not a provider.
> >
> >  .../bindings/fpga/xlnx,zynqmp-pcap-fpga.txt   | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Alan Tull <atull@kernel.org>
