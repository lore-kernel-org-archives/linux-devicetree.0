From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 5/6] Documentation: dt-bindings: Add binding info for
 X-Gene QMTM UIO driver
Date: Fri, 31 Oct 2014 10:09:25 +0000
Message-ID: <20141031100925.GA798@leverpostej>
References: <1413871011-4101-1-git-send-email-ankit.jindal@linaro.org>
 <1413871011-4101-6-git-send-email-ankit.jindal@linaro.org>
 <20141021091412.GB15293@leverpostej>
 <CAPTm99X9k+cfELMLL8_PmYN6RNn7CL7KugnV5JKcW6Jqhs8idg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPTm99X9k+cfELMLL8_PmYN6RNn7CL7KugnV5JKcW6Jqhs8idg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >> +Required properties:
> >> +- compatible: Should be "apm,xgene-qmtm"
> >> +- reg: Address and length of the register set for the device. It contains the
> >> +  information of registers in the same order as described by reg-names.
> >> +- reg-names: Should contain the register set names
> >> +  - "csr": QMTM control and status register address space.
> >> +  - "fabric": QMTM memory mapped access to queue states.
> >> +- qpool: Points to the phandle of the node defining memory location for
> >> +      creating QMTM queues. This could point either to the reserved-memory
> >> +      node (as-per reserved memory bindings) or to the node of on-chip
> >> +      SRAM etc. It is expected that size and location of qpool memory will
> >> +      be configurable via bootloader.
> >
> > Is that on-chip SRAM part of the QMTM, or is that a shared part of the
> > SoC?
> Its not part of QMTM.
> 
> >
> > It feels odd to have a phandle that can go to completely different
> > classes of node, especially as you will need to use a different API to
> > acquire the memory region within Linux.
> It is expected that phandle will point to a node whose first reg
> property will be only for qpool memory.

Even if that's true you will need to use completely different APIs for
accessing that memory (so that the kernel can account the use of
reserved-memory correctly), so this might not be the best design. It
might be better to have qpool-sram and qpool-memory properties that
point at an sram node or a reserved-memory node respectively.

> >
> >> +- clocks: Reference to the clock entry.
> >
> > Just the one clock? Does the clock input to the QMTM have a name?
> Just one input clock. There is no specific name of it.

Ok.

> 
> >
> >> +- num-queues: Number of queues under this QMTM device.
> >> +- devid: QMTM identification number for the system having multiple QMTM devices.
> >> +      This is used to form a unique id (a tuple of queue number and
> >> +      device id) for the queues belonging to this device.
> >
> > Is this just an arbitrary unique ID, or is this a non-probeable property
> > of the HW? If the former, isn't the base address sufficient as a unique
> > identifier?
> Its a non-probeable property of the HW.

Ok. That sounds fine then.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
