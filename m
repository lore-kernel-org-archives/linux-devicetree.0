From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] usb: dwc3: Add node to update cache type setting
Date: Thu, 25 Jul 2019 15:55:51 -0600
Message-ID: <CAL_JsqKd=+0kXyUJkTZezMfcv-SQznzefi_0J0VjdsXcP8qZ5w@mail.gmail.com>
References: <20190712064206.48249-1-ran.wang_1@nxp.com> <20190724204222.GA1234@bogus>
 <DB8PR04MB6826B4479A5A67A66025E89CF1C10@DB8PR04MB6826.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB8PR04MB6826B4479A5A67A66025E89CF1C10@DB8PR04MB6826.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 8:29 PM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Hi Rob,
>
> On Thursday, July 25, 2019 04:42 Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Jul 12, 2019 at 02:42:05PM +0800, Ran Wang wrote:
> > > Some Layerscape paltforms (such as LS1088A, LS2088A, etc) encounter
> > > USB detect failues when adding dma-coherent to DWC3 node. This is
> > > because the HW default cache type configuration of those SoC are not
> > > right, need to be updated in DTS.
> > >
> > > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > > ---
> > > Change in v2:
> > >     - New file.
> > >
> > >  Documentation/devicetree/bindings/usb/dwc3.txt | 43
> > > ++++++++++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > index 8e5265e..7bc1cef 100644
> > > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > @@ -110,6 +110,43 @@ Optional properties:
> > >   - in addition all properties from usb-xhci.txt from the current directory are
> > >     supported as well
> > >
> > > +* Cache type nodes (optional)
> > > +
> > > +The Cache type node is used to tell how to configure cache type on 4
> > > +different transfer types: Data Read, Desc Read, Data Write and Desc
> > > +write. For each treasfer type, controller has a 4-bit register field
> > > +to enable different cache type. Quoted from DWC3 data book Table 6-5
> > Cache Type Bit Assignments:
> > > +----------------------------------------------------------------
> > > +MBUS_TYPE| bit[3]       |bit[2]       |bit[1]     |bit[0]
> > > +----------------------------------------------------------------
> > > +AHB      |Cacheable     |Bufferable   |Privilegge |Data
> > > +AXI3     |Write Allocate|Read Allocate|Cacheable  |Bufferable
> > > +AXI4     |Allocate Other|Allocate     |Modifiable |Bufferable
> > > +AXI4     |Other Allocate|Allocate     |Modifiable |Bufferable
> > > +Native   |Same as AXI   |Same as AXI  |Same as AXI|Same as AXI
> > > +----------------------------------------------------------------
> > > +Note: The AHB, AXI3, AXI4, and PCIe busses use different names for
> > > +certain signals, which have the same meaning:
> > > +  Bufferable = Posted
> > > +  Cacheable = Modifiable = Snoop (negation of No Snoop)
> >
> > This should all be implied from the SoC specific compatible strings.
>
> Did you mean I could implement a soc driver which can be matched by compatible of 'fsl,ls1088a-dwc3' which will pass known bus type to DWC3 driver? If yes, how to pass?

Yes. The DT match table can have data associated with that compatible
string. Beyond that, I'm not really familiar with the DWC3 driver.

Rob
