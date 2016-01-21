From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Thu, 21 Jan 2016 11:15:24 +0800
Message-ID: <20160121031524.GA29893@shlinux2>
References: <4405270.vcz87Q878u@wuerfel>
 <2538302.jXP5WXojXY@wuerfel>
 <20160120125026.GA16519@shlinux2>
 <5639398.uJHXq6DsMC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5639398.uJHXq6DsMC@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 20, 2016 at 03:19:36PM +0100, Arnd Bergmann wrote:
> On Wednesday 20 January 2016 20:50:26 Peter Chen wrote:
> > On Wed, Jan 20, 2016 at 10:07:13AM +0100, Arnd Bergmann wrote:
> > > On Wednesday 20 January 2016 11:48:39 Peter Chen wrote:
> > > > > 
> > > > > > Alternatively, you could use one of the high bits of the 'reg' value
> > > > > > to indicate which root hub is used. I'm sure that would work as
> > > > > > well, but be less obvious.
> > > > > 
> > > > > It's probably best to stick with the same numbering that the hardware 
> > > > > uses.
> > > > 
> > > > Seems we are talking about root hub, not the device in the
> > > > root hub. So for multiple ports controller, we have to own node for 
> > > > root hub. Assume your example, there is a genesys HUB at physical
> > > > port 1, I suggest a dts node description like below, please correct
> > > > me if anything wrong.
> > > > 
> > > > &usb1 {
> > > >         roothub_1: nxp@1 {
> > > >                 compatible = "usb15a2,007d";
> > > >                 reg = <0x01>;
> > > > 
> > > >                 hub: genesys@1 {
> > > >                         compatible = "usb05e3,0608";
> > > >                         reg = <0x01>;
> > > >                 };
> > > >         };
> > > > 
> > > >         roothub_2: nxp@2 {
> > > >                 compatible = "usb15a2,007d";
> > > >                 reg = <0x02>;
> > > >         };
> > > > 
> > > >         ...
> > > > 
> > > >         roothub_7: nxp@7 {
> > > >                 compatible = "usb15a2,007d";
> > > >                 reg = <0x07>;
> > > > 
> > > >                 hub: genesys@1 {
> > > >                         compatible = "usb05e3,0608";
> > > >                         reg = <0x01>;
> > > >                 };
> > > >         };
> > > > 
> > > >         ...
> > > > 
> > > >         roothub_9: nxp@9 {
> > > >                 compatible = "usb15a2,007d";
> > > >                 reg = <0x09>;
> > > >         };
> > > > };
> > > 
> > > This looks wrong to me: if I understand it right, you are now modeling
> > > each port of the root hub as a separate hub, so you end up with
> > > a total of 11 hub nodes when there should only be one or two.
> > > 
> > 
> > How about below from both driver and device tree view:
> > 
> > 1. From the USB driver view
> > 
> > 			USB Controller
> > 				|
> > 				|
> > 	   ---------------------|----------------
> > 		|				|	
> > 	    root hub(HS)		root hub(SS, optional)
> > 		|				|
> > 	---------------------		-------------------------	
> > 	|	|	... |		|	  |         |
> >       port 1	port 2	   port 6	port 1	port 2	  port 3
> > 	|				|
> >      genesys hub (if HS)	      genesys hub (if SS)	
> > 
> > 2. dts node:
> > 
> > &usb1 {
> >         port_1: nxp@1 {
> >                 compatible = "usb15a2,007d";
> >                 reg = <0x01>;
> > 
> >                 hub: genesys@1 {
> >                         compatible = "usb05e3,0608";
> >                         reg = <0x01>;
> >                 };
> >         };
> > 
> >         port_2: nxp@2 {
> >                 compatible = "usb15a2,007d";
> >                 reg = <0x02>;
> >         };
> > 
> >         ...
> > 
> >         port_7: nxp@7 {
> >                 compatible = "usb15a2,007d";
> >                 reg = <0x07>;
> > 
> >                 hub: genesys@1 {
> >                         compatible = "usb05e3,0608";
> >                         reg = <0x01>;
> >                 };
> >         };
> > 
> >         ...
> > 
> >         port_9: nxp@9 {
> >                 compatible = "usb15a2,007d";
> >                 reg = <0x09>;
> >         };
> > };
> > 
> > - If the above are ok, is it ok we add two nodes for the same device
> > in case the speed negotiation is different at some situations?
> > - Usually, it should be ok we only add nodes at device tree which
> > the hard wired device on it, like port_1 and port 7 at above, right?
> 
> This looks identical to the version before, what is the difference?
> 

Just adding from device driver view and change the name from "roohub" to
"port".

It is the port number (1-9), but not the root hub number.

At the most of embedded platforms, we have only one port per controller.
For example, at the non-hub boards, if there are two Standard-A ports,
there are from two different USB controllers.
But for Alan's case, it has six ports, and all from the one USB controller,
port 1 to port 6 are from the HS root hub, port 7 to port 9 are from the SS
root hub.

For the single port controller platform, the dts will be like below, port_1 is
under the HS root hub, port_2 is under the SS root hub.

&usb1 {
        port_1: nxp@1 {
                compatible = "usb15a2,007d";
                reg = <0x01>;

                hub: genesys@1 {
                        compatible = "usb05e3,0608";
                        reg = <0x01>;
                };
        };

        port_2: nxp@2 {
                compatible = "usb15a2,007d";
                reg = <0x02>;

                hub: genesys@1 {
                        compatible = "usb05e3,0608";
                        reg = <0x01>;
                };
        };
};


-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
