From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 3/3] usb: renesas_usbhs: Use devm_usb_get_phy_by_phandle()
Date: Thu, 30 Jun 2016 08:44:17 +0000
Message-ID: <HK2PR06MB09134C4686D8BECF2D18E874D8240@HK2PR06MB0913.apcprd06.prod.outlook.com>
References: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1467029359-6812-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20160628205710.GU3737@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160628205710.GU3737@rob-hp-laptop>
Content-Language: ja-JP
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> From: Rob Herring
> Sent: Wednesday, June 29, 2016 5:57 AM
> 
> On Mon, Jun 27, 2016 at 09:09:19PM +0900, Yoshihiro Shimoda wrote:
> > This patch uses devm_usb_get_phy_by_phandle() instead of usb_get_phy()
> > for device tree environment. This change is not compabile with the
> > previous code, but it is no problem because nobody calls usb_bind_phy()
> > for this driver now.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 3 ++-
> >  drivers/usb/renesas_usbhs/mod_gadget.c                  | 7 ++++++-
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> > index b604056..a419aea 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> > @@ -24,8 +24,9 @@ Optional properties:
> >    - renesas,buswait: Integer to use BUSWAIT register
> >    - renesas,enable-gpio: A gpio specifier to check GPIO determining if USB
> >  			 function should be enabled
> > -  - phys: phandle + phy specifier pair
> > +  - phys: phandle of *Generic PHY* + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - usb-phy: phandle of usb phy
> 
> No. The binding should not change based on which kernel subsystem
> handles this. The USB-PHY code should learn to parse 'phys' if you want
> to use that subsystem.

Thank you for the review.

The "phys" is for Generic PHY even if this patch is applied.
So, I think that I should make a patch to revise the explanation at first?

I would to write overview of renesas_usbhs driver and a question below:

< phys >
 - This is a generic phy property.
 - The renesas_usbhs driver will use it to turn on/off the PHY 
 - Almost all platforms use this generic phy instance.

< usb-phy >
 - This is a USB-PHY property.
 - The renesas_usbhs driver will use it to call an OTG related function.
   (otg_set_peripheral)
 - The renesas_usbhs driver will NOT use it to turn the power on/off.
 - Some platforms don't use this USB-PHY instance.
  - In other words, some platforms use both a generic phy and USB-PHY.
   - Is it not suitable from the device tree point of view?

Best regards,
Yoshihiro Shimoda


> >    - dmas: Must contain a list of references to DMA specifiers.
> >    - dma-names : named "ch%d", where %d is the channel number ranging from zero
> >                  to the number of channels (DnFIFOs) minus one.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
