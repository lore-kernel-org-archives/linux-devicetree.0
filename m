From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: gpio: dwapb: Synopsys Designware GPIO
Date: Thu, 31 Oct 2013 16:55:24 +0000
Message-ID: <20131031165524.GB4572@page>
References: <52718C28.5030803@gmail.com>
 <20131031082226.GZ28790@pengutronix.de>
 <CADhT+wcCzMM1MbP3UuQbdc8JmpdO+AhM421R5AiC6vxyn-osvQ@mail.gmail.com>
 <CANk1AXRH8zDZFFWGn=NYrkhHrygeoeLQ9QNd6o7Wm6XHmT95pQ@mail.gmail.com>
 <20131031155803.GB28790@pengutronix.de>
 <20131031160723.GA4572@page>
 <20131031161739.GC28790@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131031161739.GC28790-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 31, 2013 at 05:17:39PM +0100, Steffen Trumtrar wrote:
> On Thu, Oct 31, 2013 at 04:07:23PM +0000, Jamie Iles wrote:
> > The reason for having it split into banks is that for hardware that 
> > has a mixture of bank sizes (odd hardware admittedly, but that 
> > includes hardware that I was writing the driver for), we had a setup 
> > like 16 pins on bank A, 16 on B, 1 on C and 16 on D where each bank 
> > could have a maximum of 32, so converting from a data sheet to GPIO 
> > number is not obvious.  Grant Likely suggested representing the 
> > banks as different devices, so that's how I created the binding.
> > 
> 
> I have no problem with the binding, if it is worth it. Do you mean you had
> hardware where the gpio lines where not connected? Or maybe you had an older
> version of the IP core?

Not even unconnected, the IP was configured to have banks of varying 
width!  Perhaps it was something to do with the physical pads that they 
were connected to having different I/O standards or something.

> In the Socfpga case there is gpio_config_reg2, which specifies the width
> for every of the 4 ports. So I thought I use those values to describe my
> hardware. The Socfpga however only uses the first bank of its three GPIO cores,
> so I wouldn't be able to test if the code works for more than just that.

I think that if there was a guarantee that all banks apart from the last 
were configured to equal width then representing the controller as a 
single device would be right, but given that it isn't always the case 
then seperate devices for each bank is probably the most sensible.

That said I'd personally be happy either way to see the patches merged!

Jamie
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
