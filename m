From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] x86: bzImage: Allow the appending of a device tree binary
Date: Fri, 21 Oct 2016 18:38:56 +0100
Message-ID: <20161021173855.GE17287@leverpostej>
References: <1476512960-22406-1-git-send-email-franck.jullien@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476512960-22406-1-git-send-email-franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 15, 2016 at 08:29:20AM +0200, Franck Jullien wrote:
> This patch provides the ability to boot using a device tree that is appended
> to the raw binary bzImage (e.g. cat bzImage <filename>.dtb > bzImage_w_dtb).
> 
> Based on Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> work on x86
> builtin dtb support.
> 
> Signed-off-by: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I understand that the rationale for this is to describe devices
instantiated dynamically on an FPGA (or to provide a base for overlays
to be applied when they are later instantiated).

I don't think that this, as it stands, is a good idea.

For one thing, this provides us with no notion of topology (i.e. where
the FPGA device falls in the interconnect hierarchy), as there's no
"nexus" defined where the DT bridges onto the existing ACPI topology.

Worse, even if that were present, we have no way of mapping things like
interrupts across the ACPI/DT boundary, and more complex things like
IOMMU mastering (where ACPI and DT differ quite substantially).

Generally, I do not think that mixing ACPI and DT is a good idea, as
there are a number of conceptual differences, and there is no trivial
mapping between them generally.

If you need to work atop of ACPI, I think that you need extensions to
ACPI, rather than attempting to graft DT atop.

> +config X86_APPENDED_DTB
> +	bool "Use appended device tree blob to bzImage"
> +	depends on OF
> +	select OF_EARLY_FLATTREE
> +	help
> +	  With this option, the boot code will look for a device tree binary
> +	  (DTB) appended to bzImage
> +	  (e.g. cat bzImage <filename>.dtb > bzImage_w_dtb).
> +
> +	  This is meant as a backward compatibility convenience for those
> +	  systems with a bootloader that can't be upgraded to accommodate
> +	  the documented boot protocol using a device tree.
> +
> +	  Beware that there is very little in terms of protection against
> +	  this option being confused by leftover garbage in memory that might
> +	  look like a DTB header after a reboot if no actual DTB is appended
> +	  to bzImage.  Do not leave this option active in a production kernel
> +	  if you don't intend to always append a DTB.

I would advise that you reword this, as the existing wording is clearly
not applicable.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
