From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/9] arm64: mm: install SError abort handler
Date: Fri, 24 Mar 2017 15:16:54 +0000
Message-ID: <20170324151654.GD29588@leverpostej>
References: <20170324144632.5896-1-opendmb@gmail.com>
 <20170324144632.5896-4-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170324144632.5896-4-opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, vladimir.murzin-5wv7dgnIgG8@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, cmetcalf-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sandeepa.s.prabhu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shijie.huang-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 07:46:26AM -0700, Doug Berger wrote:
> This commit adds support for minimal handling of SError aborts and
> allows them to be hooked by a driver or other part of the kernel to
> install a custom SError abort handler.  The hook function returns
> the previously registered handler so that handlers may be chained if
> desired.
> 
> The handler should return the value 0 if the error has been handled,
> otherwise the handler should either call the next handler in the
> chain or return a non-zero value.

... so the order these get calls is completely dependent on probe
order...

> Since the Instruction Specific Syndrome value for SError aborts is
> implementation specific the registerred handlers must implement
> their own parsing of the syndrome.

... and drivers have to be intimately familiar with the CPU, in order to
be able to parse its IMPLEMENTATION DEFINED ESR_ELx.ISS value.

Even then, there's no guarantee there's anything useful there, since it
is IMPLEMENTATION DEFINED and could simply be RES0 or UNKNOWN in all
cases.

I do not think it is a good idea to allow arbitrary drivers to hook
this fault in this manner.

> +	.align	6
> +el0_error:
> +	kernel_entry 0
> +el0_error_naked:
> +	mrs	x25, esr_el1			// read the syndrome register
> +	lsr	x24, x25, #ESR_ELx_EC_SHIFT	// exception class
> +	cmp	x24, #ESR_ELx_EC_SERROR		// SError exception in EL0
> +	b.ne	el0_error_inv
> +el0_serr:
> +	mrs	x26, far_el1
> +	// enable interrupts before calling the main handler
> +	enable_dbg_and_irq

... why?

We don't do this for inv_entry today.

> +	ct_user_exit
> +	bic	x0, x26, #(0xff << 56)
> +	mov	x1, x25
> +	mov	x2, sp
> +	bl	do_serr_abort
> +	b	ret_to_user
> +el0_error_inv:
> +	enable_dbg
> +	mov	x0, sp
> +	mov	x1, #BAD_ERROR
> +	mov	x2, x25
> +	b	bad_mode
> +ENDPROC(el0_error)

Clearly you expect these to be delivered at arbitrary times during
execution. What if a KVM guest is executing at the time the SError is
delivered?

To be quite frank, I don't believe that we can reliably and safely
handle this misfeature in the kernel, and this infrastructure only
provides the illusion that we can.

I do not think it makes sense to do this.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
