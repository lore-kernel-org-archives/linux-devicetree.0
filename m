From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] dt-binding: usb: add usb-role-switch property
Date: Tue, 7 May 2019 10:26:34 +0800
Message-ID: <1557195994.10179.263.camel@mhfsdcap03>
References: <5756e05930f5e6a3940ad9d019399c8e63d24f18.1556454324.git.chunfeng.yun@mediatek.com>
         <20190502194905.GA22144@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502194905.GA22144@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Yu Chen <chenyu56@huawei.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Min Guo <min.guo@mediatek.com>, Felipe Balbi <felipe.balbi@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2019-05-02 at 14:49 -0500, Rob Herring wrote:
> On Sun, Apr 28, 2019 at 08:27:46PM +0800, Chunfeng Yun wrote:
> > Add a property usb-role-switch to tell Dual-Role controller driver
> > that use USB Role Switch framework to handle the role switch between
> > host mode and device mode, it's useful when the driver has already
> > supported other ways, such as extcon framework etc.
> > 
> > Cc: Biju Das <biju.das@bp.renesas.com>
> > Cc: Yu Chen <chenyu56@huawei.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v1:
> > the property is discussed in:
> > [v2,2/7] dt-bindings: usb: renesas_usb3: add usb-role-switch property
> > https://patchwork.kernel.org/patch/10852497/
> > 
> > Mediatek and Hisilicon also try to use it:
> > [v4,3/6] dt-bindings: usb: mtu3: add properties about USB Role Switch
> > https://patchwork.kernel.org/patch/10918385/
> > [v4,6/6] usb: mtu3: register a USB Role Switch for dual role mode
> > https://patchwork.kernel.org/patch/10918367/
> > 
> > [v6,10/13] usb: dwc3: Registering a role switch in the DRD code
> > https://patchwork.kernel.org/patch/10909981/
> > ---
> >  Documentation/devicetree/bindings/usb/generic.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > index 0a74ab8dfdc2..c73950b72513 100644
> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > @@ -30,6 +30,9 @@ Optional properties:
> >  			optional for OTG device.
> >   - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
> >  			optional for OTG device.
> > + - usb-role-switch: tells Dual-Role USB controller driver that we want to use
> > +			USB Role Switch framework to handle the role switch
> > +			between host mode and device mode.
> 
> Please describe this in terms of h/w functionality, not drivers and 
> Linux things.
Sorry for the late reply, v2 is posted

> 
> Rob
