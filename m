From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 2/4] devicetree: bindings: Document Krait CPU/L1 EDAC
Date: Wed, 15 Jan 2014 08:56:23 -0800
Message-ID: <20140115165623.GJ14405@codeaurora.org>
References: <1389735034-21430-1-git-send-email-sboyd@codeaurora.org>
 <1389735034-21430-3-git-send-email-sboyd@codeaurora.org>
 <20140115102701.GA27314@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140115102701.GA27314-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/15, Lorenzo Pieralisi wrote:
> On Tue, Jan 14, 2014 at 09:30:32PM +0000, Stephen Boyd wrote:
> > The Krait CPU/L1 error reporting device is made up a per-CPU
> > interrupt. While we're here, document the next-level-cache
> > property that's used by the Krait EDAC driver.
> > 
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.txt | 52 ++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> > index 91304353eea4..c332b5168456 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.txt
> > +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> > @@ -191,6 +191,16 @@ nodes to be present and contain the properties described below.
> >  			  property identifying a 64-bit zero-initialised
> >  			  memory location.
> >  
> > +	- interrupts
> > +		Usage: required for cpus with compatible string "qcom,krait".
> > +		Value type: <prop-encoded-array>
> > +		Definition: L1/CPU error interrupt
> 
> I reckon you want this property to belong in the cpus node (example below),
> not in cpu nodes, right ?

Yes.

> 
> Are you relying on a platform device to be created for /cpus node in
> order for this series to work ? I guess that's why you want the
> interrupts property to be defined in /cpus so that it becomes a platform
> device resource (and you also add a compatible property in /cpus that is
> missing in these bindings).

Ah yes. I'll move this to the /cpus section.

> 
> > +
> > +	- next-level-cache
> > +		Usage: optional
> > +		Value type: <phandle>
> > +		Definition: phandle pointing to the next level cache
> > +
> >  Example 1 (dual-cluster big.LITTLE system 32-bit):
> >  
> >  	cpus {
> > @@ -382,3 +392,45 @@ cpus {
> >  		cpu-release-addr = <0 0x20000000>;
> >  	};
> >  };
> > +
> > +
> > +Example 5 (Krait 32-bit system):
> > +
> > +cpus {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	interrupts = <1 9 0xf04>;
> 
> In patch 4 you also add a compatible property here, and that's not documented,
> and honestly I do not think that's acceptable either. I guess you want a
> compatible property here to match the platform driver, right ?

Ah sorry, I forgot to put the compatible property here like in
the dts change. I'll do that in the next revision. Yes we need a
compatible property here to match the platform driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
