From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: xilinx: Add the dt binding for
 Xilinx AI Engine
Date: Mon, 11 Mar 2019 16:44:39 -0500
Message-ID: <CAL_JsqJ3QXntkCEUya2pZm=esyBWosNY6SOLFWLxG1OLMbipuA@mail.gmail.com>
References: <1548119537-1788-1-git-send-email-hyun.kwon@xilinx.com>
 <20190218211739.GA19490@bogus> <20190225191003.GA27978@smtp.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190225191003.GA27978@smtp.xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hyun Kwon <hyunk@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 25, 2019 at 1:12 PM Hyun Kwon <hyun.kwon@xilinx.com> wrote:
>
> Hi Rob,
>
> Thanks for the review.
>
> On Mon, 2019-02-18 at 13:17:39 -0800, Rob Herring wrote:
> > On Mon, Jan 21, 2019 at 05:12:16PM -0800, Hyun Kwon wrote:
> > > Add the dt bindings for Xilinx AI Engine, which is a tile processor
> > > with many cores. The compatible string, 'xlnx,mathengine' is kept for
> > > backward compatibility as it's the legacy name.
> > >
> > > Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > > ---
> > >  .../devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt | 19 +++++++++++++++++++
> > >  MAINTAINERS                                           |  5 +++++
> > >  2 files changed, 24 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
> > > new file mode 100644
> > > index 0000000..fade9d0
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
> > > @@ -0,0 +1,19 @@
> > > +Xilinx AI Engine
> > > +----------------
> > > +
> > > +The Xilinx AI Engine is a tile processor with many cores (up to 400) that
> > > +can run in parallel. The data routing between cores is configured through
> > > +internal switches, and shim tiles interface with external interconnect, such
> > > +as memory or PL.
> > > +
> > > +Required properties:
> > > +
> > > +- compatible: Must be "xlnx,ai_engine", or "xlnx,mathengine" for legacy name.
> >
> > Use '-' rather than '_'. No legacy names. It didn't reviewed and we're
> > not going to be stuck with it.
>
> Sure will do.
>
> >
> > Only 1 version of the IP? The compatible should be more specific.
>
> I'll confirm on the proper ip version for the string.
>
> >
> > Are details like number of cores discoverable?
>
> No, the information will need to be added. At the moment, this information
> is not used in the driver, but it will be needed. It can be either
> properties (number of columns / number of rows / shift), or this can be
> embedded in compatible string as a device type. The latter may be less
> scalable, considering variations including emulation platforms which can
> change and so on. Could you please share input on which one would be more
> appropriate?

There's no hard rule here. If it is determined by end users
configuring soft IP, then separate properties is probably better. For
configuration fixed in an SoC design, then implied by compatible is
usually best.

Rob
