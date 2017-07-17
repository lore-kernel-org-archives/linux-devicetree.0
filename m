From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-binding: mfd: Add Maxim/Dallas DS1374 MFD device
 binding
Date: Mon, 17 Jul 2017 13:50:51 -0500
Message-ID: <20170717185051.7yd5wdynyesc7lyy@rob-hp-laptop>
References: <1499975665-14581-1-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499975665-14581-1-git-send-email-mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 12:54:24PM -0700, Moritz Fischer wrote:
> This adds a binding for the Maxim/Dallas DS1374 MFD.
> 
> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Changes from RFC:
> - dallas,ds1374-mode -> dallas,mode
> - Clarified examples
> - dallas,remap-reset property
> 
> On second thoughts the solution for the remapping found in the
> discussion did not seem to be a good solution, since the INT
> pin indicating watchdog reset does not necessarily have to be
> connected to an interrupt line on the machine, it could equally
> well be hooked up to a PMIC reset input or similar.
> In that case using the presence of an 'interrupt' phandle is not
> a good choice.
> 
> Cheers,
> 
> Moritz
> 
> ---
>  Documentation/devicetree/bindings/mfd/ds1374.txt   | 88 ++++++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.txt        |  1 -
>  drivers/rtc/Kconfig                                |  2 +

This belongs in patch 2. With that dropped,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  3 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ds1374.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
