From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] Documentation: add DT bindings for ARM SCPI power
 domains
Date: Tue, 7 Jun 2016 15:45:44 +0100
Message-ID: <20160607144544.GC26981@leverpostej>
References: <1465228439-13457-1-git-send-email-sudeep.holla@arm.com>
 <1465228439-13457-3-git-send-email-sudeep.holla@arm.com>
 <20160607132223.GG2633@leverpostej>
 <5756CE8D.6040704@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5756CE8D.6040704-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 02:39:25PM +0100, Sudeep Holla wrote:
> 
> 
> On 07/06/16 14:22, Mark Rutland wrote:
> >On Mon, Jun 06, 2016 at 04:53:58PM +0100, Sudeep Holla wrote:
> >>The System Control Processor (SCP) provides peripheral devices with
> >>power domains that can be enabled and disabled viathe System Control
> >>and Power Interface (SCPI) Message Protocol. Add bindings to allow
> >>probing of these device power domians.
> >>
> >>Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >>Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >>Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> >>---
> >>  Documentation/devicetree/bindings/arm/arm,scpi.txt | 34 ++++++++++++++++++++++
> >>  1 file changed, 34 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> >>index 313dabdc14f9..7141670d649b 100644
> >>--- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
> >>+++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
> >>@@ -87,10 +87,33 @@ SCPI provides an API to access the various sensors on the SoC.
> >>  			 implementation for the IDs to use. For Juno
> >>  			 R0 and Juno R1 refer to [3].
> >>
> >>+Power domain bindings for the power domains based on SCPI Message Protocol
> >>+------------------------------------------------------------
> >>+
> >>+This binding uses the generic power domain binding[4].
> >>+
> >>+PM domain providers
> >>+===================
> >>+
> >>+Required properties:
> >>+ - #power-domain-cells : Should be 1. Contains the device or the power
> >>+			 domain ID value used by SCPI commands.
> >>+ - num-domains: Total number of power domains provided by SCPI. This is
> >>+		needed as the SCPI message protocol lacks a mechanism to
> >>+		query this information runtime.
> >                                       ^
> >I guess there should be an 'at' here.
> >
> 
> Will fix.
> 
> >Are domain IDs zero-based and definitely non-sparse?
> >
> 
> Yes

Ok. So FWIW, with the fix above:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
