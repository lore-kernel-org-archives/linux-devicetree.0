From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2] watchdog: xilinx: Add clock support
Date: Thu, 4 Aug 2016 12:29:19 -0500
Message-ID: <20160804172918.GA22921@rob-hp-laptop>
References: <1470198518-22286-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470198518-22286-1-git-send-email-shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2016 at 09:58:38AM +0530, Shubhrajyoti Datta wrote:
> Add support for the clock. Currently we enable
> at probe and relinquish at remove.
> 
> Acked-by: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> fix spaces and error path.
> 
>  .../devicetree/bindings/watchdog/of-xilinx-wdt.txt |  3 +++
>  drivers/watchdog/of_xilinx_wdt.c                   | 23 ++++++++++++++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt b/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
> index 6d63782..b0a9fa3 100644
> --- a/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
> @@ -5,6 +5,8 @@ Required properties:
>  - compatible		: Should be "xlnx,xps-timebase-wdt-1.00.a" or
>  			  "xlnx,xps-timebase-wdt-1.01.a".
>  - reg			: Physical base address and size
> +- clocks		: Input clock specifier. Refer to common clock
> +			  bindings.

You can't add new required properties. Doing so breaks compatibility 
with old DTs.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
