From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: devio: update max count of DPs per interval for
 ISOC
Date: Sat, 29 Dec 2018 10:48:40 +0800
Message-ID: <1546051720.32173.139.camel@mhfsdcap03>
References: <1545992864-9530-1-git-send-email-chunfeng.yun@mediatek.com>
         <20181228105148.GA22073@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181228105148.GA22073@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,
On Fri, 2018-12-28 at 11:51 +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 28, 2018 at 06:27:44PM +0800, Chunfeng Yun wrote:
> > The host shall be able to accept and send up to 96 DPs for
> > devices operating at Gen 2 speed.
> 
> Why?  What is this keeping from working properly today?

The failure happened when I tried to send up to 96DPs per an interval
for SSP ISOC transations by libusb, this is used to verify SSP ISOC
function of USB3 GEN2 controller. Maybe for normal scenarios they
needn't transfer greater than 48 DPs in an ISOC interval.
(refer usb3.1r1.0 section 8.12.6 Isochronous Transactions)
> 
> I need a much better changelog text here in order to be able to accept
> this patch.
I'll make the change in next version
> 
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/core/devio.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> > index a75bc0b8a50f..82c16210e34c 100644
> > --- a/drivers/usb/core/devio.c
> > +++ b/drivers/usb/core/devio.c
> > @@ -1564,12 +1564,10 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
> >  		}
> >  		for (totlen = u = 0; u < number_of_packets; u++) {
> >  			/*
> > -			 * arbitrary limit need for USB 3.0
> > -			 * bMaxBurst (0~15 allowed, 1~16 packets)
> > -			 * bmAttributes (bit 1:0, mult 0~2, 1~3 packets)
> > -			 * sizemax: 1024 * 16 * 3 = 49152
> > +			 * arbitrary limit need for USB 3.1 Gen2
> > +			 * sizemax: 96 DPs at SSP, 96 * 1024 = 98304
> >  			 */
> > -			if (isopkt[u].length > 49152) {
> > +			if (isopkt[u].length > 98304) {
> 
> Are we going to have to keep bumping this up as speeds get faster and
> faster?
Or remove the check of data length? I'm not sure which way is better

> 
> thanks,
> 
> greg k-h
