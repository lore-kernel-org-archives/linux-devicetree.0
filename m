From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: Drop obsolete 'interrupts' vs 'interrupts-extended'
 text
Date: Tue, 18 Nov 2014 12:05:14 -0600
Message-ID: <CAL_JsqK3DU8D9jyCvUMkpXEUTPNb2HMH2uuj3EgSNbYWa6ECPA@mail.gmail.com>
References: <20141101233531.4958.96713.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141101233531.4958.96713.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 1, 2014 at 6:35 PM, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property
> first") updated the description to say that:
>
>   - Both 'interrupts' and 'interrupts-extended' may be present
>   - Software should prefer 'interrupts-extended'
>   - Software that doesn't comprehend 'interrupts-extended' may use
>     'interrupts'
>
> But there is still a paragraph at the end that prohibits having both and
> says 'interrupts' should be preferred.
>
> Remove the contradictory text.
>
> Fixes: a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property first")
> Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> CC: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org      # v3.13+

Applied, thanks.

Rob

> ---
>  .../bindings/interrupt-controller/interrupts.txt   |    4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> index ce6a1a072028..8a3c40829899 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> @@ -30,10 +30,6 @@ should only be used when a device has multiple interrupt parents.
>    Example:
>         interrupts-extended = <&intc1 5 1>, <&intc2 1 0>;
>
> -A device node may contain either "interrupts" or "interrupts-extended", but not
> -both. If both properties are present, then the operating system should log an
> -error and use only the data in "interrupts".
> -
>  2) Interrupt controller nodes
>  -----------------------------
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
