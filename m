From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for Winstar WF35LTIACD
Date: Sun, 12 Mar 2017 09:17:58 -0500
Message-ID: <20170312141758.rbwixoq2hykdo34f@rob-hp-laptop>
References: <20170303152156.31370-1-richard.genoud@gmail.com>
 <20170303152156.31370-2-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170303152156.31370-2-richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 03, 2017 at 04:21:56PM +0100, Richard Genoud wrote:
> This adds support for the Winstar Display Co. WF35LTIACD 3.5" QVGA TFT
> LCD panel, which can be supported by the simple panel driver.
> 
> Signed-off-by: Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/display/panel/winstar,wf35ltiacd      |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
> new file mode 100644
> index 000000000000..68408adf239f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/winstar,wf35ltiacd
> @@ -0,0 +1,7 @@
> +Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "winstar,wf35ltiacd"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.

Please specify the power supply(ies). I know a lot of bindings haven't, 
but many panels have more than 1 supply and just relying on simple panel 
doesn't distinguish whether the panel has 1 supply or you didn't check 
and it has more than 1.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
