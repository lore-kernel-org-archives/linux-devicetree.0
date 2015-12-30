From: Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Subject: Re: [RFC 1/1] powerpc: legacy serial port use device tree cell-index
 property
Date: Wed, 30 Dec 2015 08:37:02 -0800
Message-ID: <20151230163702.GY14046@cumulusnetworks.com>
References: <1448477209-22340-2-git-send-email-curt@cumulusnetworks.com>
 <1450755731.18314.76.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450755731.18314.76.camel-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon Dec 21 21:42, Scott Wood wrote:
> On Wed, 2015-11-25 at 10:46 -0800, Curt Brune wrote:
> > Currently for PowerPC systems using device tree, the legacy serial
> > ports are allocated in the order by which they are found in the device
> > tree structure.
> > 
> > This can cause problems in cases where the device tree nodes are
> > sysnthesized by an external program (kexec for example), which may not
> > preserve the original order of the device tree nodes.  This in turn
> > can result in the serial console changing from ttyS0 to ttyS1
> > unexpectedly.
> > 
> > This patch uses the 'cell-index' property (if present) to map UART
> > device tree nodes to legacy serial port number.  The cell-index
> > property is widely used in all the Freescale .dts files for PowerPC.
> > 
> > Signed-off-by: Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
> > ---
> >  arch/powerpc/kernel/legacy_serial.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/legacy_serial.c
> > b/arch/powerpc/kernel/legacy_serial.c
> > index 7b750c4..b717133 100644
> > --- a/arch/powerpc/kernel/legacy_serial.c
> > +++ b/arch/powerpc/kernel/legacy_serial.c
> > @@ -164,6 +164,8 @@ static int __init add_legacy_soc_port(struct device_node
> > *np,
> >  	u64 addr;
> >  	const __be32 *addrp;
> >  	struct device_node *tsi = of_get_parent(np);
> > +	int index = -1, len;
> > +	u32 *indexp;
> >  
> >  	/* We only support ports that have a clock frequency properly
> >  	 * encoded in the device-tree.
> > @@ -188,14 +190,19 @@ static int __init add_legacy_soc_port(struct
> > device_node *np,
> >  	if (addr == OF_BAD_ADDR)
> >  		return -1;
> >  
> > +	/* Check if the ports have an ordering, defined by 'cell-index' */
> > +	if (((indexp = (u32*)of_get_property(np, "cell-index", &len)) !=
> > NULL) &&
> > +	    (len == sizeof(u32)))
> > +		index = *indexp;
> 
> const u32 *
> 
> Or better, use of_read_number() or similar.
> 
> -Scott
> 

Ack.  Thanks for the pointer.

-Curt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
