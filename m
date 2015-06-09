From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 01/22] usb: add OTG version number in
 usb_otg_descriptor
Date: Tue, 9 Jun 2015 21:51:32 +0800
Message-ID: <20150609135130.GA20453@shlinux1.ap.freescale.net>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
 <1433775737-9816-2-git-send-email-jun.li@freescale.com>
 <20150609155644.4d102709@rockdesk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150609155644.4d102709@rockdesk>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 09, 2015 at 03:56:44PM +0300, Roger Quadros wrote:
> 
> 
> On Mon, 8 Jun 2015 23:01:56 +0800
> Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > From: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > OTG 2.0 introduces bcdOTG to identify the OTG and EH supplement release
> > number with which the OTG device is compliant, so adds it for
> > usb_otg_descriptor.
> > 
> > Signed-off-by: Macpaul Lin <macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  include/uapi/linux/usb/ch9.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> > index aa33fd1..ce405fb 100644
> > --- a/include/uapi/linux/usb/ch9.h
> > +++ b/include/uapi/linux/usb/ch9.h
> > @@ -665,13 +665,17 @@ struct usb_qualifier_descriptor {
> >  
> >  
> >  /*-------------------------------------------------------------------------*/
> > +struct bcdOTG {
> > +	__le16 bcdOTG;
> > +};
> >  
> > -/* USB_DT_OTG (from OTG 1.0a supplement) */
> > +/* USB_DT_OTG */
> >  struct usb_otg_descriptor {
> >  	__u8  bLength;
> >  	__u8  bDescriptorType;
> >  
> >  	__u8  bmAttributes;	/* support for HNP, SRP, etc */
> > +	struct bcdOTG otg_rev[0];
> 
> why not just __le16 bcdOTG here ?

usb_otg_descriptor of OTG 1.0 and 2.0 have different size, if directly add
__le16 bcdOTG here, then it cannot used for OTG 1.0.
I use a zero length array as Peter suggested here for bcdOTG, then the size
of usb_otg_descriptor is still 3(not 5), which is compliant with OTG 1.x, if OTG
2.0 or later, we can use member of otg_rev to add bcdOTG, then the size
of usb_otg_descriptor + bcdOTG will be 5, in one word, I want to use existing
usb_otg_descriptor struct to cover both OTG 1.x and 2.0

Li Jun
> 
> >  } __attribute__ ((packed));
> >  
> >  /* from usb_otg_descriptor.bmAttributes */
> 
> cheers,
> -roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
