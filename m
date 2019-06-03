From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
Date: Mon, 3 Jun 2019 02:33:15 +0000
Message-ID: <AM5PR0402MB2865D0F0E2B4F65C86D051F8F1140@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com>
 <87ineb9b5v.fsf@linux.intel.com>
 <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com>
 <87shdfet90.fsf@linux.intel.com>
 <AM5PR0402MB28654EBE2D431CC2F8061CF8F11E0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <87k1eaanjw.fsf@linux.intel.com>
 <AM5PR0402MB2865F3735D808E1BC9F67968F1180@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM5PR0402MB2865F3735D808E1BC9F67968F1180@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Thursday, May 30, 2019 17:09, Ran Wang wrote:
>=20
> <snip>
> > >> >> >  /* Global Debug Queue/FIFO Space Available Register */
> > >> >> >  #define DWC3_GDBGFIFOSPACE_NUM(n)	((n) & 0x1f)
> > >> >> >  #define DWC3_GDBGFIFOSPACE_TYPE(n)	(((n) << 5) & 0x1e0)
> > >> >> > @@ -859,6 +867,7 @@ struct dwc3_scratchpad_array {
> > >> >> >   * 	3	- Reserved
> > >> >> >   * @imod_interval: set the interrupt moderation interval in 25=
0ns
> > >> >> >   *                 increments or 0 to disable.
> > >> >> > + * @dma_coherent: set if enable dma-coherent.
> > >> >>
> > >> >> you're not enabling dma coherency, you're enabling cache snooping=
.
> > >> >> And this property should describe that. Also, keep in mind that
> > >> >> different devices may want different cache types for each of
> > >> >> those fields, so your property would have to be a lot more
> > >> >> complex. Something
> > like:
> > >> >>
> > >> >> 	snps,cache-type =3D <foobar "cacheable">, <baz "cacheable">, ...
> > >> >>
> > >> >> Then driver would have to parse this properly to setup GSBUSCFG0.
> > >
> > > According to the DesignWare Cores SuperSpeed USB 3.0 Controller
> > > Databook (v2.60a), it has described Type Bit Assignments for all
> > > supported
> > master bus type:
> > > AHB, AXI3, AXI4 and Native. I found the bit definition are different
> > > among
> > them.
> > > So, for the example you gave above, feel a little bit confused.
> > > Did you mean:
> > >     snps,cache-type =3D <DATA_RD  "write allocate">, <DESC_RD
> > > "cacheable">, <DATA_WR  "bufferable">, <DESC_WR  "read allocate">
> >
> > yeah, something like that.
>=20
> I think DATA_RD  should be a macro, right? So, where I can put its define=
?
> Create a dwc3.h in include/dt-bindings/usb/ ?

Could you please give me some advice here? I'd like to prepare next version=
 patch after
getting this settled.

> Another question about this remain open is: DWC3 data book's Table 6-5 Ca=
che
> Type Bit Assignments show that bits definition will differ per MBUS_TYPEs=
 as
> below:
> ----------------------------------------------------------------
>  MBUS_TYPE| bit[3]       |bit[2]       |bit[1]     |bit[0]
>  ----------------------------------------------------------------
>  AHB      |Cacheable     |Bufferable   |Privilegge |Data
>  AXI3     |Write Allocate|Read Allocate|Cacheable  |Bufferable
>  AXI4     |Allocate Other|Allocate     |Modifiable |Bufferable
>  AXI4     |Other Allocate|Allocate     |Modifiable |Bufferable
>  Native   |Same as AXI   |Same as AXI  |Same as AXI|Same as AXI
>  ----------------------------------------------------------------
>  Note: The AHB, AXI3, AXI4, and PCIe busses use different names for certa=
in
>  signals, which have the same meaning:
>    Bufferable =3D Posted
>    Cacheable =3D Modifiable =3D Snoop (negation of No Snoop)
>=20
> For Layerscape SoCs, MBUS_TYPE is AXI3. So I am not sure how to use
> snps,cache-type =3D <DATA_RD  "write allocate">, to cover all MBUS_TYPE?
> (you can notice that AHB and AXI3's cacheable are on different bit) Or I =
just need
> to handle AXI3 case?

Also on this open. Thank you in advance.

Regards,
Ran
