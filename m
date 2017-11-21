From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [patches] Re: [PATCH] dt-bindings: Add a RISC-V SBI firmware node
Date: Tue, 21 Nov 2017 10:43:57 +0000
Message-ID: <20171121104357.kpp4xs7n5uqo3jau@lakrids.cambridge.arm.com>
References: <20171120202856.nptoirhm5luiamt7@latitude>
 <mhng-4a3ed3c5-a562-427c-817e-cd897789d5c0@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <mhng-4a3ed3c5-a562-427c-817e-cd897789d5c0@palmer-si-x1c4>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Cc: j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Palmer,

On Mon, Nov 20, 2017 at 01:28:01PM -0800, Palmer Dabbelt wrote:
> On Mon, 20 Nov 2017 12:28:56 PST (-0800), j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org wrote:
> > On Mon, Nov 20, 2017 at 11:50:00AM -0800, Palmer Dabbelt wrote:
> > > +RISC-V Supervisor Binary Interface (SBI)
> > > +
> > > +The RISC-V privileged ISA specification mandates the presence of a supervisor
> > > +binary interface that performs some operations which might otherwise require
> > > +particularly complicated instructions.  This interface includes
> > > +inter-processor interrupts, TLB flushes, i-cache and TLB shootdowns, a
> > > +console, and power management.
> > > +
> > > +Required properties:
> > > +- compatible: must contain one of the following
> > > + * "riscv,sbi" for the SBI defined by the privileged specification of the
> > > +   system.
> > 
> > "of the system" seems to imply that different RISC-V systems (different
> > RISC-V implementations) can have different privileged specifications.
> 
> Actually, that was intentional -- I wrote it this way because different
> RISC-V systems do have different privileged specifications.  The RISC-V
> specifications aren't frozen in time, they're just guaranteed to be
> compatible in the future. 

If that's the case, then you can define a version of the document that
is a baseline. e.g. 

 * "riscv,sbi" for an SBI implementation compatible with that defined
   in $XYZ_DOCUMENT version $N

If every new feature can be probed from that point onwards, then that's
all you'll ever need. Otherwise, if there are backwards-incompatible
changes or non-probeable features, you can add additional strings, and
there's no ambiguity.

See Documentation/devicetree/bindings/arm/psci.txt for an similar
example on ARM systems. That's explicitly versioned, though we don't
list each and every document number, and we probably should.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
