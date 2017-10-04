From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH] nvmem: imx-ocotp: read uniq CPU ID and export as system
 serial number
Date: Wed, 4 Oct 2017 21:41:25 +0200
Message-ID: <20171004194125.GB2715@gmail.com>
References: <20171004151616.2622-1-marcus.folkesson@gmail.com>
 <20171004154428.GK23092@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171004154428.GK23092@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Wed, Oct 04, 2017 at 04:44:29PM +0100, Mark Rutland wrote:
> On Wed, Oct 04, 2017 at 05:16:16PM +0200, Marcus Folkesson wrote:
> > The uniq ID is usually exported as ATAG_SERIAL but in case of
> > devicetrees, this information is not passed.
> > 
> > The uniq ID is stored in OCOTP memory (bank 0, Word 1,2) on imx CPUs.
> > Read the ID and set as system serial number.
> > 
> > This function is activated by setting `read-system-serial`
> > dt property for the imx-ocotp node.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> > 
> > Comment:
> > I'm not sure if this functionality really should be in a device driver.
> > Maybe it should be in arch/arm/mach-imx/. However, it's not
> > completely wrong so I give it a shot.
> > 
> >  .../devicetree/bindings/nvmem/imx-ocotp.txt        |  1 +
> >  drivers/nvmem/imx-ocotp.c                          | 38 ++++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > index 70d791b03ea1..bf0cc9e5e50f 100644
> > --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> > @@ -16,6 +16,7 @@ Required properties:
> >  
> >  Optional properties:
> >  - read-only: disable write access
> > +- read-system-serial: read uniq ID and export as system serial number. Available in /proc/cpuinfo
> 
> As described, this is a pure SW option (
> 
> /proc/cpuinfo is a not a HW detail, and whether or not to export this
> information there is a policy. So as described, this shouldn't be in the
> DT.

Ok, I agree with that.
> 
> Are you just trying to describe whether hte information is available in
> the OCOTP memory?

No, the information is available for all concerned iMX CPUs what I can
tell. My intention was to flag if the driver should make use of it, but
the DT seems to be the wrong way to go.

> 
> e.g. maybe this should be something like:
> 
> - has-unique-id: OCOTP bank0, Words 1 & 2 contain a unique ID
>   identifying the system.
> 
> Thanks,
> Mark.

I will come up with an v2 where this is not configurable.

Thanks,
Marcus Folkesson
