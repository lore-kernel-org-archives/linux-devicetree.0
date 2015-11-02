From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 1/6] arm/arm64: add smccc
Date: Mon, 2 Nov 2015 14:03:13 +0000
Message-ID: <20151102140313.GG2684@leverpostej>
References: <1446106888-8983-1-git-send-email-jens.wiklander@linaro.org>
 <1446106888-8983-2-git-send-email-jens.wiklander@linaro.org>
 <20151102115119.GB29657@arm.com>
 <20151102135633.GA17559@ermac>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151102135633.GA17559@ermac>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > +/*
> > > + * void smccc_smc(unsigned long a0, unsigned long a1, unsigned long a2,
> > > + *		  unsigned long a3, unsigned long a4, unsigned long a5,
> > > + *		  unsigned long a6, unsigned long a7, struct smccc_res *res)
> > > + */
> > > +ENTRY(smccc_smc)
> > > +	smc	#0
> > > +	ldr	x4, [sp]
> > > +	stp	x0, x1, [x4, #SMC_RES_X0_OFFS]
> > > +	stp	x2, x3, [x4, #SMC_RES_X2_OFFS]
> > > +	ret
> > > +ENDPROC(smccc_smc)

> > > +/*
> > > + * void smccc_hvc(unsigned long a0, unsigned long a1, unsigned long a2,
> > > + *		  unsigned long a3, unsigned long a4, unsigned long a5,
> > > + *		  unsigned long a6, unsigned long a7, struct smccc_res *res)
> > > + */
> > > +ENTRY(smccc_hvc)
> > > +	hvc	#0
> > > +	ldr	x4, [sp]
> > > +	stp	x0, x1, [x4, #SMC_RES_X0_OFFS]
> > > +	stp	x2, x3, [x4, #SMC_RES_X2_OFFS]
> > > +	ret
> > > +ENDPROC(smccc_hvc)

> > > +/**
> > > + * struct smccc_res - Result from SMC/HVC call
> > > + * @a0-a3 result values from registers 0 to 3
> > > + */
> > > +struct smccc_res {
> > > +	unsigned long a0;
> > > +	unsigned long a1;
> > > +	unsigned long a2;
> > > +	unsigned long a3;
> > > +};
> > 
> > Are there any endianness considerations for this structure?
> 
> No, I can't find anything in the ARM SMC Calling Convention document
> indicating that.

The calling conventions have no bearing on the structure, which is our
invention.

We stash register values (which don't have endianness) returned by the
firmeware into the structure in the sequences above (which appear
endian-clean to me).

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
