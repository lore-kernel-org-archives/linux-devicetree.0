From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] drivers: firmware: psci: unify enable-method binding on
 ARM {64,32}-bit systems
Date: Fri, 22 Apr 2016 16:02:23 +0100
Message-ID: <20160422150222.GO10606@leverpostej>
References: <1461335911-13233-1-git-send-email-sudeep.holla@arm.com>
 <20160422144440.GN10606@leverpostej>
 <571A3BCA.8060002@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571A3BCA.8060002-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Soby Mathew <Soby.Mathew-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 22, 2016 at 03:57:14PM +0100, Sudeep Holla wrote:
> On 22/04/16 15:44, Mark Rutland wrote:
> >On Fri, Apr 22, 2016 at 03:38:31PM +0100, Sudeep Holla wrote:
> >>Currently ARM CPUs DT bindings allows different enable-method value for
> >>PSCI based systems. On ARM 64-bit this property is required and must be
> >>"psci" while on ARM 32-bit systems this property is optional and must
> >>be "arm,psci".
> >
> >FWIW, "arm,psci" has always been the compatible string for the PSCI
> >node, and was never intended to be the enable-method. So as far as I can
> >tell, this was a mistake/bug, and not a deliberate attempt at specifying
> >32-bit differently.
> 
> I agree.
> 
> >>This is problematic if 32-bit OS is run on 64-bit system which has
> >>"psci" as enable-method rather than the expected "arm,psci".
> >>
> >>So let's unify the value into "psci" and remove support for "arm,psci"
> >>before it finds any users.
> >>
> >>Reported-by: Soby Mathew <Soby.Mathew-5wv7dgnIgG8@public.gmane.org>
> >>Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >>Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> >>Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> >
> >This was definitely a mistake, as "arm,psci" was the compatible string
> >for the psci node, and was never the enable-method. So:
> >
> >Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> 
> Thanks.
> 
> >Hopefully no-one's begun to use this.
> 
> Seems so. Even the 32-bit kernel doesn't make use of that.
> 
> The first user was for idle(see below) which was added in v4.6 just to
> keep it in sync with binding. It would be good to get it fixed before
> the final v4.6

Indeed.

Lorenzo, how should we forward this on? Do we have any other urgent
fixes for v4.6, or should we ask arm-soc to take this alone?

Thanks,
Mark.

> >>diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
> >>index 11bfee8b79a9..b5d05807e6ec 100644
> >>--- a/drivers/firmware/psci.c
> >>+++ b/drivers/firmware/psci.c
> >>@@ -360,7 +360,7 @@ static struct cpuidle_ops psci_cpuidle_ops __initdata = {
> >>  	.init = psci_dt_cpu_init_idle,
> >>  };
> >>
> >>-CPUIDLE_METHOD_OF_DECLARE(psci, "arm,psci", &psci_cpuidle_ops);
> >>+CPUIDLE_METHOD_OF_DECLARE(psci, "psci", &psci_cpuidle_ops);
> 
> -- 
> Regards,
> Sudeep
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
