From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 01/12] usb: otg: add notify_connect_change callback
Date: Mon, 21 May 2012 06:03:10 -0700
Message-ID: <20120521130310.GA18926@kroah.com>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-2-git-send-email-richard.zhao@freescale.com>
 <20120521092635.GL8633@arwen.pp.htv.fi>
 <20120521093614.GL30755@b20223-02.ap.freescale.net>
 <20120521093840.GM8633@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120521093840.GM8633-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2012 at 12:38:41PM +0300, Felipe Balbi wrote:
> On Mon, May 21, 2012 at 05:36:16PM +0800, Richard Zhao wrote:
> > On Mon, May 21, 2012 at 12:26:36PM +0300, Felipe Balbi wrote:
> > > On Mon, May 21, 2012 at 05:23:46PM +0800, Richard Zhao wrote:
> > > > This let usb phy driver has a chance to change hw settings when connect
> > > > status change.
> > > > 
> > > > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > > >  include/linux/usb/otg.h |   13 +++++++++++++
> > > >  1 files changed, 13 insertions(+), 0 deletions(-)
> > > > 
> > > > diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> > > > index 38ab3f4..385641d 100644
> > > > --- a/include/linux/usb/otg.h
> > > > +++ b/include/linux/usb/otg.h
> > > > @@ -117,6 +117,10 @@ struct usb_phy {
> > > >  	int	(*set_suspend)(struct usb_phy *x,
> > > >  				int suspend);
> > > >  
> > > > +	/* notify phy connect status change */
> > > > +	int	(*notify_connect_change)(struct usb_phy *x,
> > > > +					 int port,
> > > > +					 int connected);
> > > >  };
> > > >  
> > > >  
> > > > @@ -252,6 +256,15 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
> > > >  }
> > > >  
> > > >  static inline int
> > > > +usb_phy_notify_connect_change(struct usb_phy *x, int port, int connected)
> > > > +{
> > > > +	if (x->notify_connect_change != NULL)
> > > 
> > > you don't need this != NULL. See that no other wrapper has it. Keep
> > > consistency.
> > notify_connect_change callback is not a must. I just let the phy driver
> > have a chance to do whatever it needs to do.
> 
> what I meant was:
> 
> -	if (x->notify_connect_change != NULL)
> +	if (x->notify_connect_change)
> 
> > > Also, this is the kind of stuff that I have been queueing for Greg so I
> > > should be in Cc.
> > Ah, I'm really sorry. I just find out I used the result of get_maintainer
> > for v1 patchset.
> 
> hmm... ok, looks like I should patch MAINTAINERS file for that :-p
> 
> Greg, is it ok ?

Yes, please send me a patch for MAINTAINERS for this.

greg k-h
