From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: kirkwood devicetree respin
Date: Tue, 27 Mar 2012 17:40:59 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E0304090B9812@US01WEMBX2.internal.synopsys.com>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203211009.40934.arnd@arndb.de> <20120321114546.GC3092@arwen.pp.htv.fi>
 <201203211317.38339.arnd@arndb.de> <20120321132230.GL3092@arwen.pp.htv.fi>
 <A2CA0424C0A6F04399FB9E1CD98E0304090B77CA@US01WEMBX2.internal.synopsys.com>
 <20120322081315.GG31160@arwen.pp.htv.fi>
 <A2CA0424C0A6F04399FB9E1CD98E0304090B7F02@US01WEMBX2.internal.synopsys.com>
 <20120327090518.GL7379@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120327090518.GL7379-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> Sent: Tuesday, March 27, 2012 2:05 AM
> 
> Hi,
> 
> On Thu, Mar 22, 2012 at 06:28:26PM +0000, Paul Zimmerman wrote:
> > > > > context, toggle clocks, set pads in safe mode (when needed) and so on.
> > > > >
> > > > > But fair enough, both ways would work fine.
> > > >
> > > > I would also recommend your/Alan's approach to this over Felipe's way.
> > > > We have a DWC3 platform with an (admittedly oddball) PM implementation
> > > > that requires the bus driver to have some knowledge of the base driver's
> > > > internal state, and needs the two drivers to be able to communicate with
> > > > each other. With the base driver being a separate platform device, this
> > > > is nearly impossible to achieve in a clean way. If the DWC3 driver was
> > > > designed the way you and Alan are recommending, it would be easy.
> > > >
> > > > I'm trying to convince Felipe to change the DWC3 driver design to
> > > > accommodate this, but I hold out little hope for that :)
> > >
> > > yeah, I'm not thinking on taking that patch, sorry. Didn't you say SNPS
> > > had agreed on rebuilding the FPGA system so that it's a more standard
> > > PCIe implementation ?
> > >
> > > I still owe you another possible implementation for the whole PM thing,
> > > sorry about the delay.
> >
> > Dropped the other folks from CC since they probably aren't interested.
> >
> > The FPGA rework is very low priority, those guys have more important
> > stuff to work on at the moment. Plus management doesn't understand
> > why the current design won't work, since the Synopsys driver supports
> > it OK.
> >
> > So I'm not sure when the FPGA rework will happen.
> 
> Ok, so let's work with what we have now. I'll try to shuffle your
> patches around to the way I think they could/should be done, but I'll
> need your help testing since I don't have any hibernation-enabled
> version of the IP at hand. Hope it's ok with you ;-)

Sure. I'd like to make some progress on this.

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
