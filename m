MIME-Version: 1.0
Date: Tue, 8 Jan 2019 08:05:52 -0600
References: <1545896066-897-1-git-send-email-min.guo@mediatek.com>
	<1545896066-897-2-git-send-email-min.guo@mediatek.com>
	<20190103221414.GA14639@bogus>
	<1546570807.585.31.camel@mhfsdcap03>
	<CAL_JsqK5x8=b6gXfBStZwHbq4zvuCuHCLAwsSqFEMJtSffC3BQ@mail.gmail.com>
	<1546846292.4433.24.camel@mhfsdcap03>
In-Reply-To: <1546846292.4433.24.camel@mhfsdcap03>
Message-ID: <CAL_JsqLwmstR-EduJt5ZejOC8w=nUmgCeDZoZoVjXoVvtn7kYg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: musb: Add support for MediaTek musb controller
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Min Guo <min.guo@mediatek.com>
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 7, 2019 at 1:31 AM Min Guo <min.guo@mediatek.com> wrote:
>
> On Fri, 2019-01-04 at 10:10 -0600, Rob Herring wrote:
> > On Thu, Jan 3, 2019 at 9:00 PM Min Guo <min.guo@mediatek.com> wrote:
> > >
> > > On Thu, 2019-01-03 at 16:14 -0600, Rob Herring wrote:
> > > > On Thu, Dec 27, 2018 at 03:34:23PM +0800, min.guo@mediatek.com wrote:
> > > > > From: Min Guo <min.guo@mediatek.com>
> > > > >
> > > > > This adds support for MediaTek musb controller in
> > > > > host, peripheral and otg mode
> >
> > [...]
> >
> > > > > + - interrupts      : interrupt used by musb controller
> > > > > + - interrupt-names : must be "mc"
> > > >
> > > > -names is pointless when there is only one.
> > > The MUSB core driver has two interrupts, one is for MAC, another for DMA,
> > > but on MTK platform, there is only a MAC interrupt, here following the binding
> > > of MUSB core driver.
> >
> > You should probably be listing the same interrupt number twice if 2
> > interrupts are combined.
>
> If only one interrupt is regisetred in driver, dose still need list the
> same interrupt number twice in dtsi?

Well, you said the MUSB core has 2 interrupts. The DT should reflect the h/w which isn't necessarily what a driver currently supports.

> > > > > +Optional properties:
> > > > > + - extcon : external connector for VBUS and IDPIN changes detection,
> > > > > +   needed when supports dual-role mode.
> > > >
> > > > Don't use extcon for new bindings. The usb-connector binding should be
> > > > used instead.
> > > This is used to detect the changes of the IDPIN and VBUS, the change
> > > events are provided by other drivers, such as extcon-usb-gpio.c, and
> > > then switch MUSB controller to host or device mode, but the
> > > usb-connector can't detect these changes.
> >
> > To repeat, do not use extcon binding for new bindings. It is poorly
> > designed as it reflects extcon driver needs, not a description of the
> > hardware. If you have ID on GPIO, then that belongs in a usb-connector
> > node because that GPIO goes to the connector. For Vbus, you should
> > have a vbus-supply in the connector and use a gpio-regulator if it is
> > GPIO controlled.
>
> Sorry, I didn't find a common driver describing the usb-connector. Is
> there any driver that I can refer to, specially the way to switch MUSB
> controller between host and device mode?


>
> > > > > + - vbus-supply : reference to the VBUS regulator, needed when supports
> > > > > +   dual-role mode.
> > > >
> > > > The controller is powered from Vbus? Probably not. This belongs in the
> > > > connector or maybe the phy (if the phy is powered from Vbus).
> > > The Vbus is used to provide 5V voltage to the connected device when the
> > > controller works as host mode.
> >
> > I know what Vbus is. Unless Vbus is providing power to the host
> > controller, putting the Vbus supply in the controller node is not a
> > accurate representation of the hardware.
>
> I will put vbus-supply in usb-connector after implement it.
>
> > Rob
>
>
