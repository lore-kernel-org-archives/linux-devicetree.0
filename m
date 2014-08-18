From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: Specifying the console device using an alias
Date: Mon, 18 Aug 2014 21:19:09 +0200
Message-ID: <20140818191909.GA5352@pengutronix.de>
References: <CAPnjgZ2A=DkGSnFLy1En8bH0pZAUAEWCWz_jQ941g3QQEUN9NQ@mail.gmail.com>
 <CAPnjgZ1S-HVZJ7kzt=YKT+jjZEtLdmZSnr6kmNVf+paGKdrgoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ1S-HVZJ7kzt=YKT+jjZEtLdmZSnr6kmNVf+paGKdrgoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Simon,

On Thu, Aug 14, 2014 at 10:02:10PM -0600, Simon Glass wrote:
> (correct list)
> 
> On 14 August 2014 21:42, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > Hi,
> >
> > In U-Boot we currently specify the console device (typically serial)
> > using something like:
> >
> > aliases {
> >    console = "/serial@1234";
> > }
> >
> > But the question has come up as to whether this should be done another
> > way. I see the "linux.stdout" property in the /chosen node.
> >
> > I am concerned that making use of the /chosen node in U-Boot might
> > confuse a lot of people, since this node is normally used to provide
> > selections for the OS to use when booting. If we did use /chosen, then
> > linux,stdout seems plain wrong but perhaps u-boot,stdout could be used
> > instead.

See ePAPR. There's a stdout-path property specified, without linux,
prefix.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
