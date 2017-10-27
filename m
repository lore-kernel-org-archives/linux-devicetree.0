From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] display: panel: Add Tianma tm070rvhg71 display support
 (800x480)
Date: Thu, 26 Oct 2017 22:13:36 -0500
Message-ID: <20171027031336.psu7hn27w2xajyux@rob-hp-laptop>
References: <1508537403-878-1-git-send-email-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508537403-878-1-git-send-email-lukma-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 21, 2017 at 12:10:03AM +0200, Lukasz Majewski wrote:
> Signed-off-by: Lukasz Majewski <lukma-ynQEQJNshbs@public.gmane.org>
> ---
>  .../bindings/display/panel/tianma,tm070rvhg71.txt  |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> new file mode 100644
> index 0000000..b84217f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/tianma,tm070rvhg71.txt
> @@ -0,0 +1,7 @@
> +Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "tianma,tm070rvhg71
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.

No supplies? Still need to list power-supply here if so, so it is clear 
that this display has a single supply (or you need to list multiple ones 
if not).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
