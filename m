From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v9 REBASE 6/9] USB: notify phy when root hub port connect
 change
Date: Wed, 11 Jul 2012 10:53:16 +0800
Message-ID: <20120711025315.GA30055@b20223-02.ap.freescale.net>
References: <20120710031426.GG26888@b20223-02.ap.freescale.net>
 <Pine.LNX.4.44L0.1207101024110.1308-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1207101024110.1308-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2012 at 11:07:14AM -0400, Alan Stern wrote:
> On Tue, 10 Jul 2012, Richard Zhao wrote:
> 
> > On Sat, Jul 07, 2012 at 10:56:45PM +0800, Richard Zhao wrote:
> > > Phy may need to change settings when port connect change.
> > > 
> > > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  drivers/usb/core/hub.c |    8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > index 4cc8dc9..2ba9d84 100644
> > > --- a/drivers/usb/core/hub.c
> > > +++ b/drivers/usb/core/hub.c
> > > @@ -20,6 +20,7 @@
> > >  #include <linux/usb.h>
> > >  #include <linux/usbdevice_fs.h>
> > >  #include <linux/usb/hcd.h>
> > > +#include <linux/usb/otg.h>
> > >  #include <linux/usb/quirks.h>
> > >  #include <linux/kthread.h>
> > >  #include <linux/mutex.h>
> > > @@ -4037,6 +4038,13 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
> > >  		}
> > >  	}
> > >  
> > > +	if (unlikely(hcd->phy && !hdev->parent)) {
> > > +		if (portstatus & USB_PORT_STAT_CONNECTION)
> > > +			usb_phy_notify_connect(hcd->phy, port1);
> > > +		else
> > > +			usb_phy_notify_disconnect(hcd->phy, port1);
> > There's another issue. When hcd is removed, notify disconnect is not
> > called. Is it ok, if I remove the above two line and add below patch:
> 
> You should keep those two lines, since it's possible for a disconnect
> to occur without usb_disconnect() being called.  This happens when a
> device fails to enumerate.
> 
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -1924,6 +1924,11 @@ void usb_disconnect(struct usb_device **pdev)
> >  	 */
> >  	device_del(&udev->dev);
> >  
> > +	if (udev->parent && !udev->parent->parent) {
> > +		struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> > +		usb_phy_notify_disconnect(hcd->phy, udev->portnum);
> > +	}
> 
> You might not want to add this.  usb_disconnect() can get called in 
> situations where the device remains physically connected (if the 
> firmware changes during a reset, for example).
> 
> If you want to notify the phy when the root hub is removed, there are 
> better places to do it.  One possibility is in hub_quiesce(), another 
> is in usb_remove_hcd().
Thanks. I'll need more testing, and won't add it in this patch.

Richard
> 
> Alan Stern
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
