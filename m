From: Emil Medve <Emilian.Medve@Freescale.com>
Subject: Re: [PATCH v3 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Fri, 7 Nov 2014 01:31:24 -0600
Message-ID: <545C754C.9080700@Freescale.com>
References: <1415200734-6978-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1415200734-6978-2-git-send-email-Emilian.Medve@Freescale.com>
 <1415310579.23458.402.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1415310579.23458.402.camel@snotra.buserror.net>
Sender: linux-doc-owner@vger.kernel.org
To: Scott Wood <scottwood@Freescale.com>
Cc: galak@kernel.crashing.org, corbet@lwn.net, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, grant.likely@linaro.org, Geoff.Thorpe@Freescale.com, linuxppc-dev@ozlabs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Scott,


On 11/06/2014 03:49 PM, Scott Wood wrote:
> On Wed, 2014-11-05 at 09:18 -0600, Emil Medve wrote:
>> +Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
>> +to the respective BMan instance
>> +
>> +- fsl,bman
>> +	Usage:		Required
>> +	Value type:	<prop-encoded-array>
>> +	Description:	List of phandle and DCP index pairs, to the BMan instance
>> +			to which this device is connected via the DCP
> 
> Does software need the DCP index (though for QMan there do seem to be a
> few registers associated with each DCP)?  Where can I find that info in
> the manual?

The DCP index helps describe the topology of the devices connected to
the B/QMan. One might be tempted to use some address to reference said
DCP, unfortunately the pertinent registers/bits for said DCP(s) are not
into a compact region. Look at the CCSR memory map for B/QMan

In the QMan case things are marginally better. For each hardware portal
there are a handful of (vaguely named *DCx*, *DCPx* or *DCP*) registers
(configuration, performance monitoring and debugging). However, still
registers and bits spread here and there

In the BMan case things are a bit worse as the registers names are less
friendly and still spread around

Do you need specific names/offsets?


Cheers,
