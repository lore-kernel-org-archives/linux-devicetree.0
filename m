From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [v2 PATCH] dt-binding: usb: add usb-role-switch property
Date: Wed, 8 May 2019 14:26:42 +0800
Message-ID: <1557296802.10179.272.camel@mhfsdcap03>
References: <38ff51264e971d5c58940c8435b9d8d274662d50.1557195204.git.chunfeng.yun@mediatek.com>
         <20190507141305.GA19816@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507141305.GA19816@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Yu Chen <chenyu56@huawei.com>, Min Guo <min.guo@mediatek.com>, Felipe Balbi <felipe.balbi@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-05-07 at 17:13 +0300, Heikki Krogerus wrote:
> On Tue, May 07, 2019 at 10:22:58AM +0800, Chunfeng Yun wrote:
> > diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
> > index 0a74ab8dfdc2..f5a6ad053ecc 100644
> > --- a/Documentation/devicetree/bindings/usb/generic.txt
> > +++ b/Documentation/devicetree/bindings/usb/generic.txt
> > @@ -30,6 +30,11 @@ Optional properties:
> >  			optional for OTG device.
> >   - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
> >  			optional for OTG device.
> > + - usb-role-switch: tells Dual-Role USB controllers we want to handle the role
> > +			switch between host and device according to the state
> > +			detected by the USB connector, typically for Type-C,
> > +			Type-B(micro).
> > +			see connector/usb-connector.txt.
> 
> That does not look correct to me. Firstly, USB role switches are not
> always dual-role USB controllers. 
Thanks for review, I look through some drivers, you are right, some phys
also switch the roles.

> Secondly, stating what determines
> the role irrelevant IMO.
> 
> Since this is a boolean property, the description for it should simply
> explain what does it tell about the capabilities of the device that
> has it. The description should not make any assumptions about the
> users of the property, and since the property is a "generic" USB
> property, I'm not sure it should make any assumptions about the type
> of the device that has the property either. Also, I would really like
> the description to show the type of the property.
Ok I'll add it.

> 
> Why not just say something like this:
> 
> "Boolean property informing that the device is capable of assigning
> the USB data role (USB host or USB device) for a given USB connector."
will modify it.

> 
> 
> thanks,
> 
