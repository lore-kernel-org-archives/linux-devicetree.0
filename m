From: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Subject: RE: [PATCH v2 2/5] usb: DT binding documentation for qoriq usb 2.0
 controller
Date: Fri, 15 Jul 2016 08:13:40 +0000
Message-ID: <HE1PR0401MB233112279210B1940889DF55E3330@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <1468038656-10345-1-git-send-email-rajesh.bhagat@nxp.com>
 <1468038656-10345-3-git-send-email-rajesh.bhagat@nxp.com>
 <20160711064845.GH31647@shlinux2>
 <HE1PR0401MB23319FBFD0D42D997A05AB34E3300@HE1PR0401MB2331.eurprd04.prod.outlook.com>
 <20160715071516.GG817@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160715071516.GG817@shlinux2>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Peter Chen [mailto:hzpeterchen@gmail.com]
> Sent: Friday, July 15, 2016 12:45 PM
> To: Rajesh Bhagat <rajesh.bhagat@nxp.com>
> Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Peter Chen <peter.chen@nxp.com>;
> gregkh@linuxfoundation.org; kishon@ti.com; robh+dt@kernel.org;
> shawnguo@kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v2 2/5] usb: DT binding documentation for qoriq usb 2.0
> controller
> 
> On Tue, Jul 12, 2016 at 03:59:14AM +0000, Rajesh Bhagat wrote:
> >
> >
> > > -----Original Message-----
> > > From: Peter Chen [mailto:hzpeterchen@gmail.com]
> > > Sent: Monday, July 11, 2016 12:19 PM
> > > To: Rajesh Bhagat <rajesh.bhagat@nxp.com>
> > > Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > devicetree@vger.kernel.org; Peter Chen <peter.chen@nxp.com>;
> > > gregkh@linuxfoundation.org; kishon@ti.com; robh+dt@kernel.org;
> > > shawnguo@kernel.org; linux-arm-kernel@lists.infradead.org
> > > Subject: Re: [PATCH v2 2/5] usb: DT binding documentation for qoriq
> > > usb 2.0 controller
> > >
> > > On Sat, Jul 09, 2016 at 10:00:53AM +0530, Rajesh Bhagat wrote:
> > > > Describes the qoriq usb 2.0 controller driver binding, currently
> > > > used for LS1021A and LS1012A platform.
> > > >
> > > > Signed-off-by: Rajesh Bhagat <rajesh.bhagat@nxp.com>
> > > > ---
> > > > Changes in v2:
> > > >  - Adds DT binding documentation for qoriq usb 2.0 controller
> > > >  - Changed the compatible string to fsl,ci-qoriq-usb2
> > > >
> > > >  .../devicetree/bindings/usb/ci-hdrc-qoriq.txt      | 34
> > > ++++++++++++++++++++++
> > > >  1 file changed, 34 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt
> > > > b/Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt
> > > > new file mode 100644
> > > > index 0000000..8ad7306
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-qoriq.txt
> > > > @@ -0,0 +1,34 @@
> > > > +* Freescale QorIQ SoC USB 2.0 Controllers
> > > > +
> > > > +Required properties:
> > > > +- compatible: Should be "fsl,ci-qoriq-usb2"
> > > > +  Wherever applicable, the IP version of the USB controller
> > > > +should
> > > > +  also be mentioned (for eg. fsl,ci-qoriq-usb2-vX.Y).
> > > > +  where, X.Y is IP version of USB controller.
> >
> > Hello Peter,
> >
> > >
> > > Why you need to add IP version at compatible string?
> > > Does it can't be read out from ID register of Identification Registers.
> > >
> >
> > I agree. Will drop this controller version thing in DTS in v3.
> >
> > > > +- reg: Should contain registers location and length
> > > > +- interrupts: Should contain controller interrupt
> > > > +- phy-names: from the *Generic PHY* bindings
> > > > +- phys: from the *Generic PHY* bindings
> > > > +- clocks: clock provider specifier
> > > > +- clock-names: shall be "usb2-clock"
> > > > +Refer to clk/clock-bindings.txt for generic clock consumer
> > > > +properties
> > > > +
> > > > +Recommended properties:
> > > > +- dr_mode: One of "host" or "peripheral".
> > >
> > > Do you support dual-role?
> > >
> >
> > Yes. We do support  both host/peripheral mode.
> >
> 

Hello Peter, 

> I mean dual-role switch. If you support that, the dr_mode should be "otg".
> 

For now, we don't support otg mode. 

Best Regards,
Rajesh Bhagat 

> --
> 
> Best Regards,
> Peter Chen
