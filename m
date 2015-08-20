From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/5] arm/arm64: add smccc ARCH32
Date: Thu, 20 Aug 2015 22:30:29 +0100
Message-ID: <20150820213029.GA1426@svinekod>
References: <1439973629-19505-1-git-send-email-jens.wiklander@linaro.org>
 <1439973629-19505-2-git-send-email-jens.wiklander@linaro.org>
 <20150819165009.GC10297@arm.com>
 <20150820113729.GA25962@ermac>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150820113729.GA25962@ermac>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org" <javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org>, "emmanuel.michel-qxv4g6HH51o@public.gmane.org" <emmanuel.michel-qxv4g6HH51o@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "jean-michel.delorme-qxv4g6HH51o@public.gmane.org" <jean-michel.delorme-qxv4g6HH51o@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 20, 2015 at 12:37:29PM +0100, Jens Wiklander wrote:
> On Wed, Aug 19, 2015 at 05:50:09PM +0100, Will Deacon wrote:
> > On Wed, Aug 19, 2015 at 09:40:25AM +0100, Jens Wiklander wrote:
> > > Adds helpers to do SMC based on ARM SMC Calling Convention.
> > > CONFIG_HAVE_SMCCC is enabled for architectures that may support
> > > the SMC instruction. It's the responsibility of the caller to
> > > know if the SMC instruction is supported by the platform.

[...]

> > > +       mov     x28, x0
> > > +       ldp     w0, w1, [x28, #SMC_PARAM_W0_OFFS]
> > > +       ldp     w2, w3, [x28, #SMC_PARAM_W2_OFFS]
> > > +       ldp     w4, w5, [x28, #SMC_PARAM_W4_OFFS]
> > > +       ldp     w6, w7, [x28, #SMC_PARAM_W6_OFFS]
> > > +       smc     #0
> > > +       stp     w0, w1, [x28, #SMC_PARAM_W0_OFFS]
> > > +       stp     w2, w3, [x28, #SMC_PARAM_W2_OFFS]
> > > +       ldp     x28, x30, [sp], #16
> > > +       ret
> > > +ENDPROC(smccc_call32)
> > 
> > Could we deal with this like we do for PSCI instead? (see
> > __invoke_psci_fn_smc). We could also then rename psci-call.S to fw-call.S
> > and stick this in there too.
> 
> I assume you're referring to when to use "hvc" and "smc".

I assume he's on about passing the values in registers rather than a struct.

>From the looks of the SMC Calling Convention documentation, it's valid to have
return values in registers r0-r3, which necessitates the use of a struct (at
least for the return values).

Thanks,
Mark.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
