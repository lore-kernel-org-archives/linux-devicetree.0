From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Fri, 7 Nov 2014 01:34:25 -0600
Message-ID: <1415345665.23458.428.camel@snotra.buserror.net>
References: <1415200734-6978-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1415200734-6978-2-git-send-email-Emilian.Medve@Freescale.com>
	 <1415310579.23458.402.camel@snotra.buserror.net>
	 <545C754C.9080700@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545C754C.9080700-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Geoff.Thorpe-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-11-07 at 01:31 -0600, Emil Medve wrote:
> Hello Scott,
> 
> 
> On 11/06/2014 03:49 PM, Scott Wood wrote:
> > On Wed, 2014-11-05 at 09:18 -0600, Emil Medve wrote:
> >> +Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
> >> +to the respective BMan instance
> >> +
> >> +- fsl,bman
> >> +	Usage:		Required
> >> +	Value type:	<prop-encoded-array>
> >> +	Description:	List of phandle and DCP index pairs, to the BMan instance
> >> +			to which this device is connected via the DCP
> > 
> > Does software need the DCP index (though for QMan there do seem to be a
> > few registers associated with each DCP)?  Where can I find that info in
> > the manual?
> 
> The DCP index helps describe the topology of the devices connected to
> the B/QMan. One might be tempted to use some address to reference said
> DCP, unfortunately the pertinent registers/bits for said DCP(s) are not
> into a compact region. Look at the CCSR memory map for B/QMan
> 
> In the QMan case things are marginally better. For each hardware portal
> there are a handful of (vaguely named *DCx*, *DCPx* or *DCP*) registers
> (configuration, performance monitoring and debugging). However, still
> registers and bits spread here and there
> 
> In the BMan case things are a bit worse as the registers names are less
> friendly and still spread around
> 
> Do you need specific names/offsets?

My question about the manual wasn't rhetorical -- I tried to find this
information and couldn't.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
