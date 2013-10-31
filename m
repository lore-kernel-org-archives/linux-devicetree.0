From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: gpio: dwapb: Synopsys Designware GPIO
Date: Thu, 31 Oct 2013 17:17:39 +0100
Message-ID: <20131031161739.GC28790@pengutronix.de>
References: <52718C28.5030803@gmail.com>
 <20131031082226.GZ28790@pengutronix.de>
 <CADhT+wcCzMM1MbP3UuQbdc8JmpdO+AhM421R5AiC6vxyn-osvQ@mail.gmail.com>
 <CANk1AXRH8zDZFFWGn=NYrkhHrygeoeLQ9QNd6o7Wm6XHmT95pQ@mail.gmail.com>
 <20131031155803.GB28790@pengutronix.de>
 <20131031160723.GA4572@page>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131031160723.GA4572@page>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jamie,

On Thu, Oct 31, 2013 at 04:07:23PM +0000, Jamie Iles wrote:
> Hi Steffen,
> 
> On Thu, Oct 31, 2013 at 04:58:03PM +0100, Steffen Trumtrar wrote:
> > Hi Alan,
> > 
> > On Thu, Oct 31, 2013 at 10:34:50AM -0500, delicious quinoa wrote:
> > > On Thu, Oct 31, 2013 at 10:18 AM, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > > Yes, we'll post a patch up on rocketboards-next and maybe we can post them
> > > > to the mailing list too?
> > > >
> > > Hi Steffen,
> > > 
> > > I've posted a branch on rocketboards.orgs' linux-socfpga-next.git.
> > > The branch name is dwapb-gpio-3.11.
> > > 
> > 
> > good. I will have a look.
> > 
> > > The top five patches are:
> > > 1. Remove the Altera gpio-dw.c driver
> > > 2 & 3.  Cherrypick Jamie's stuff from his git repo
> > > 4. Enable gpio-dwapb in our defconfig and dts
> > > 5. This is the main patch here: use irq_domain_add_linear for
> > > gpio-dwapb.c plus a few bug fixes.
> > > 
> > > If you'd rather see that last patch on the mailing list, I can post it
> > > there for review.
> > > 
> > 
> > I wonder if we want to really keep the binding as it is proposed by
> > Jamie. Do we really win anything by having to specify the banks in the
> > DT? In my version I get the number of ports, width etc. from the config registers
> > of the device. I think everything that the device knows itself and can be read
> > out at runtime shouldn't be specified in the DT.
> > And it seems that the binding was never merged, so I guess we can change it.
> 
> The reason for having it split into banks is that for hardware that has 
> a mixture of bank sizes (odd hardware admittedly, but that includes 
> hardware that I was writing the driver for), we had a setup like 16 pins 
> on bank A, 16 on B, 1 on C and 16 on D where each bank could have a 
> maximum of 32, so converting from a data sheet to GPIO number is not 
> obvious.  Grant Likely suggested representing the banks as different 
> devices, so that's how I created the binding.
> 

I have no problem with the binding, if it is worth it. Do you mean you had
hardware where the gpio lines where not connected? Or maybe you had an older
version of the IP core?
In the Socfpga case there is gpio_config_reg2, which specifies the width
for every of the 4 ports. So I thought I use those values to describe my
hardware. The Socfpga however only uses the first bank of its three GPIO cores,
so I wouldn't be able to test if the code works for more than just that.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
