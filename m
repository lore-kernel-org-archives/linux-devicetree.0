From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] USB: Add DT probing support to ehci-spear and ohci-spear
Date: Fri, 13 Apr 2012 11:26:55 -0700
Message-ID: <20120413182655.GA5444@kroah.com>
References: <1332431402-20606-1-git-send-email-sr@denx.de>
 <4F87A48E.3090300@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F87A48E.3090300-qxv4g6HH51o@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 13, 2012 at 09:29:10AM +0530, Viresh Kumar wrote:
> On 3/22/2012 9:20 PM, Stefan Roese wrote:
> > This patch adds support to configure the SPEAr EHCI & OHCI driver via
> > device-tree instead of platform_data.
> > 
> > Signed-off-by: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
> > Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/spear-usb.txt          |   39 ++++++++++++++++++++
> >  drivers/usb/host/ehci-spear.c                      |   32 +++++++++++++---
> >  drivers/usb/host/ohci-spear.c                      |   32 +++++++++++++---
> >  3 files changed, 91 insertions(+), 12 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/spear-usb.txt
> 
> Hi Greg,
> 
> Have you applied this patch?

No, should I?

If so, please resend it, as it's not in any of my inboxes...

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
