From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/5] arm/arm64: add smccc ARCH32
Date: Fri, 21 Aug 2015 13:43:32 +0200
Message-ID: <20150821114331.GA11701@ermac>
References: <1439973629-19505-1-git-send-email-jens.wiklander@linaro.org>
 <1439973629-19505-2-git-send-email-jens.wiklander@linaro.org>
 <20150819165009.GC10297@arm.com>
 <20150820113729.GA25962@ermac>
 <20150821092430.GC30930@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150821092430.GC30930-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org" <javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org>, "emmanuel.michel-qxv4g6HH51o@public.gmane.org" <emmanuel.michel-qxv4g6HH51o@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "jean-michel.delorme-qxv4g6HH51o@public.gmane.org" <jean-michel.delorme-qxv4g6HH51o@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 21, 2015 at 10:24:30AM +0100, Will Deacon wrote:
> On Thu, Aug 20, 2015 at 12:37:29PM +0100, Jens Wiklander wrote:
> > On Wed, Aug 19, 2015 at 05:50:09PM +0100, Will Deacon wrote:
> > > On Wed, Aug 19, 2015 at 09:40:25AM +0100, Jens Wiklander wrote:
> > > > Adds helpers to do SMC based on ARM SMC Calling Convention.
> > > > CONFIG_HAVE_SMCCC is enabled for architectures that may support
> > > > the SMC instruction. It's the responsibility of the caller to
> > > > know if the SMC instruction is supported by the platform.
> > > 
> > > [...]
> > > > diff --git a/arch/arm64/kernel/smccc-call.S b/arch/arm64/kernel/smccc-call.S
> > > > new file mode 100644
> > > > index 0000000..3ce7fe8
> > > > --- /dev/null
> > > > +++ b/arch/arm64/kernel/smccc-call.S
> > > > @@ -0,0 +1,34 @@
> > > > +/*
> > > > + * Copyright (c) 2015, Linaro Limited
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or modify
> > > > + * it under the terms of the GNU General Public License Version 2 as
> > > > + * published by the Free Software Foundation.
> > > > + *
> > > > + * This program is distributed in the hope that it will be useful,
> > > > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > > > + * GNU General Public License for more details.
> > > > + *
> > > > + */
> > > > +#include <linux/linkage.h>
> > > > +
> > > > +#define SMC_PARAM_W0_OFFS      0
> > > > +#define SMC_PARAM_W2_OFFS      8
> > > > +#define SMC_PARAM_W4_OFFS      16
> > > > +#define SMC_PARAM_W6_OFFS      24
> > > > +
> > > > +/* void smccc_call32(struct smccc_param32 *param) */
> > > > +ENTRY(smccc_call32)
> > > > +       stp     x28, x30, [sp, #-16]!
> > > 
> > > Why are you saving lr?
> > 
> > Agree, no point in saving lr, but I still need to decrease sp with 16 to
> > maintain correct alignment. I'll do it with an str instruction instead.
> 
> That or pad out with xzr
> 
> > > 
> > > > +       mov     x28, x0
> > > > +       ldp     w0, w1, [x28, #SMC_PARAM_W0_OFFS]
> > > > +       ldp     w2, w3, [x28, #SMC_PARAM_W2_OFFS]
> > > > +       ldp     w4, w5, [x28, #SMC_PARAM_W4_OFFS]
> > > > +       ldp     w6, w7, [x28, #SMC_PARAM_W6_OFFS]
> > > > +       smc     #0
> > > > +       stp     w0, w1, [x28, #SMC_PARAM_W0_OFFS]
> > > > +       stp     w2, w3, [x28, #SMC_PARAM_W2_OFFS]
> > > > +       ldp     x28, x30, [sp], #16
> > > > +       ret
> > > > +ENDPROC(smccc_call32)
> > > 
> > > Could we deal with this like we do for PSCI instead? (see
> > > __invoke_psci_fn_smc). We could also then rename psci-call.S to fw-call.S
> > > and stick this in there too.
> > 
> > I assume you're referring to when to use "hvc" and "smc".
> 
> No, I mean use a C prototype to avoid marshalling the parameters in assembly
> like this. As Rutland pointed out, the return value is a bit messy, but
> the arguments align nicely with the PCS afaict.

If possible I'd like the function to have the same prototype for both
arm and arm64. For arm it's not possible to supply more than 4
parameters. To fully support SMC Calling Convention we need to be able
to pass 8 parameters and have 4 return values. The OP-TEE driver in this
patch set depends on this. I don't see how we can avoid the marshalling
here.

We could have two versions of the SMCCC functions, one simplified which
only uses registers and one complete like this one with marshalling.

Thanks,
Jens
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
