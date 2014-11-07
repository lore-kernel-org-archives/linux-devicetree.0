From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Fri, 7 Nov 2014 02:19:23 -0600
Message-ID: <1415348363.23458.432.camel@snotra.buserror.net>
References: <1415200734-6978-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1415200734-6978-2-git-send-email-Emilian.Medve@Freescale.com>
	 <1415310579.23458.402.camel@snotra.buserror.net>
	 <545C754C.9080700@Freescale.com>
	 <1415345665.23458.428.camel@snotra.buserror.net>
	 <545C7F77.90200@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <545C7F77.90200@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@Freescale.com>
Cc: galak@kernel.crashing.org, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, grant.likely@linaro.org, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-11-07 at 02:14 -0600, Emil Medve wrote:
> Hello Scott,
> 
> 
> On 11/07/2014 01:34 AM, Scott Wood wrote:
> > On Fri, 2014-11-07 at 01:31 -0600, Emil Medve wrote:
> >> Hello Scott,
> >>
> >>
> >> On 11/06/2014 03:49 PM, Scott Wood wrote:
> >>> On Wed, 2014-11-05 at 09:18 -0600, Emil Medve wrote:
> >>>> +Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
> >>>> +to the respective BMan instance
> >>>> +
> >>>> +- fsl,bman
> >>>> +	Usage:		Required
> >>>> +	Value type:	<prop-encoded-array>
> >>>> +	Description:	List of phandle and DCP index pairs, to the BMan instance
> >>>> +			to which this device is connected via the DCP
> >>>
> >>> Does software need the DCP index (though for QMan there do seem to be a
> >>> few registers associated with each DCP)?  Where can I find that info in
> >>> the manual?
> >>
> >> The DCP index helps describe the topology of the devices connected to
> >> the B/QMan. One might be tempted to use some address to reference said
> >> DCP, unfortunately the pertinent registers/bits for said DCP(s) are not
> >> into a compact region. Look at the CCSR memory map for B/QMan
> >>
> >> In the QMan case things are marginally better. For each hardware portal
> >> there are a handful of (vaguely named *DCx*, *DCPx* or *DCP*) registers
> >> (configuration, performance monitoring and debugging). However, still
> >> registers and bits spread here and there
> >>
> >> In the BMan case things are a bit worse as the registers names are less
> >> friendly and still spread around
> >>
> >> Do you need specific names/offsets?
> > 
> > My question about the manual wasn't rhetorical -- I tried to find this
> > information and couldn't.
> 
> I get that. As I said, the registers/bits are spread around in the CCSR
> space of each block and not named excessively friendly. As such I hinted
> for some search patterns to make it easier to find them. In order to
> progress the review I'm willing to prepare a list. Just let me know

Could you point me to the section of the manual where this information
is -- friendly or otherwise?  I saw the QMan direct connect portal
registers.  I didn't see how to tell which <i> in DCPi_xxx goes with
which device.

-Scott


