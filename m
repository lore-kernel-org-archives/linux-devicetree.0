From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/6] arm: dts: marvell: Add missing #phy-cells to
 usb-nop-xceiv
Date: Sat, 2 Dec 2017 16:49:13 -0800
Message-ID: <20171203004913.6oqng6uqpbspfvzm@localhost>
References: <20171109222614.5719-1-robh@kernel.org>
 <20171109222614.5719-3-robh@kernel.org>
 <20171121205622.GE30040@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171121205622.GE30040-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 21, 2017 at 09:56:22PM +0100, Andrew Lunn wrote:
> On Thu, Nov 09, 2017 at 04:26:11PM -0600, Rob Herring wrote:
> > "usb-nop-xceiv" is using the phy binding, but is missing #phy-cells
> > property. This is probably because the binding was the precursor to the phy
> > binding.
> > 
> > Fixes the following warning in Marvell dts files:
> > 
> > Warning (phys_property): Missing property '#phy-cells' in node ...
> > 
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

I didn't see this come in before -rc1 and in current fixes, so given the acks
I've applied it directly now.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
