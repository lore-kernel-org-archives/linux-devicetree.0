From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V4 3/4] irqchip: mips-gic: Add device-tree support
Date: Thu, 6 Nov 2014 23:17:42 -0500
Message-ID: <20141107041742.GH3698@titan.lakedaemon.net>
References: <1414624790-15690-1-git-send-email-abrestic@chromium.org>
 <1414624790-15690-4-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1414624790-15690-4-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andrew,

On Wed, Oct 29, 2014 at 04:19:49PM -0700, Andrew Bresticker wrote:
> Add device-tree support for the MIPS GIC.  Update the GIC irqdomain's
> xlate() callback to handle the three-cell specifier described in the
> MIPS GIC binding document.
> 
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> Changes from v3:
>  - use reserved-cpu-vectors property
>  - read GIC base from CM if no reg property present
> Changes from v2:
>  - rebased on GIC irqchip cleanups
>  - updated for change in bindings
>  - only parse first CPU vector
>  - allow platforms to use EIC mode
> Changes from v1:
>  - updated for change in bindings
>  - set base address and enable bit in GCR_GIC_BASE
> ---
>  drivers/irqchip/irq-mips-gic.c | 92 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 87 insertions(+), 5 deletions(-)

I assume this is going though the mips tree...

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
