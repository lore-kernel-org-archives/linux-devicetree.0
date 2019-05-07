From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ls1028a: Add USB dt nodes
Date: Tue, 7 May 2019 11:40:02 -0500
Message-ID: <CAL_Jsq+tmUCjZw7ybhKTGg0NNfc+JsOQ30vArfHzdw14XoWm5A@mail.gmail.com>
References: <20190426055558.44544-1-ran.wang_1@nxp.com> <20190501235410.GA25492@bogus>
 <AM5PR0402MB286539A070BDEEDFC3304F0EF1310@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM5PR0402MB286539A070BDEEDFC3304F0EF1310@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2019 at 3:48 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Hi Rob,
>
> On Thursday, May 02, 2019 07:54 Rob Herring wrote:
> >
> > On Fri, Apr 26, 2019 at 05:54:26AM +0000, Ran Wang wrote:
> > > This patch adds USB dt nodes for LS1028A.
> > >
> > > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > > ---
> > > Changes in v2:
> > >   - Rename node from usb3@... to usb@... to meet DTSpec
> > >
> > >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   20
> > ++++++++++++++++++++
> > >  1 files changed, 20 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > index 8dd3501..188cfb8 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > @@ -144,6 +144,26 @@
> > >                     clocks = <&sysclk>;
> > >             };
> > >
> > > +           usb0:usb@3100000 {
> >                      ^ space needed
>
> Yes, will update this in next version.
>
> > > +                   compatible= "snps,dwc3";
> >
> > Needs an SoC specific compatible.
>
> Do you mean change compatible to "snps,dwc3", "fsl,ls1028a-dwc3" ?

Well, that's the wrong order, but yes.

> As I know, so far there is no SoC specific programming for this IP, so do
> you think it's still necessary to add it?

Yes. All the bugs and quirks are discovered already?

Rob
