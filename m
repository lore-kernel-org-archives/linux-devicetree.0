From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] of: MSI: Simplify irqdomain lookup
Date: Tue, 26 Jan 2016 08:49:31 -0600
Message-ID: <CAL_JsqJpcU4j2BibE8=vV2AM4peEqoFyTF4OXWRNs9xHL+XYHA@mail.gmail.com>
References: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com> <1453816347-32720-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453816347-32720-3-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 26, 2016 at 7:52 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> So far, when trying to associate a device with its MSI domain,
> we first lookup the domain using a MSI token, and if this
> doesn't return anything useful, we pick up any domain matching
> the same node.
>
> This logic is broken for two reasons:
> 1) Only the generic MSI code (PCI or platform) sets this token
>    to PCI/MSI or platform MSI. So we're guaranteed that if there
>    is something to be found, we will find it with the first call.
> 2) If we have a convoluted situation where:
>    - a single node implements both wired and MSI interrupts
>    - MSI support for that HW hasn't been compiled in
>    we'll end up using the wired domain for MSIs anyway, and things
>    break badly.
>
> So let's just remove __of_get_msi_domain, and replace it by a direct
> call to irq_find_matching_host, because that's what we really want.
>
> Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> ---
>  drivers/of/irq.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
