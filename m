From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] usb: renesas_usbhs: Revise the binding document about
 the dma-names
Date: Thu, 9 Apr 2015 10:06:25 +0100
Message-ID: <20150409090625.GA18488@leverpostej>
References: <1428489744-4872-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20150408131403.GC5977@leverpostej>
 <HKNPR06MB322EC49F217406EBDD006DFD8FB0@HKNPR06MB322.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <HKNPR06MB322EC49F217406EBDD006DFD8FB0-xIjp3w5QIjwsJtb0Mgt7d79PrO6axcR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org" <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 09, 2015 at 01:17:44AM +0100, Yoshihiro Shimoda wrote:
> Hi Mark,
> 
> > 
> > On Wed, Apr 08, 2015 at 11:42:24AM +0100, Yoshihiro Shimoda wrote:
> > > Since the DT should describe the hardware (not the driver limitation),
> > > This patch revises the binding document about the dma-names to change
> > > simple numbering as "ch%d" instead of "tx<n>" and "rx<n>".
> > 
> > The naming given in this patch looks more sensible to me.
> 
> Thank you for your comment!
> 
> > > Also this patch fixes the actual code of renesas_usbhs driver to handle
> > > the new dma-names.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > > ---
> > >  This patch is based on Felipe's usb.bit / testing/next branch.
> > >  (commit id = bbc78c07a51f6fd29c227b1220a9016e585358ba)
> > 
> > I take it the existing driver and binding haven't hit mainline, and
> > therefore there are no users yet?
> 
> That's correct. At the moment, nobody uses the dma-names in the node of
> renesas_usbhs yet.

Given that:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
