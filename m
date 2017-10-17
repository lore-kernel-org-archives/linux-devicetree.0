From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/9] drm/panel: simple: add support for EDT ET0350 3.5"
 QVGA panel
Date: Tue, 17 Oct 2017 14:50:38 -0500
Message-ID: <20171017195038.glirxs3sixpcj7uj@rob-hp-laptop>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-6-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507721021-28174-6-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 11, 2017 at 01:23:37PM +0200, Lothar Waﬂmann wrote:
> Signed-off-by: Lothar Waﬂmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  .../bindings/display/panel/edt,et0350g0dh6.txt        |  7 +++++++

Please split bindings to separate patch.

>  drivers/gpu/drm/panel/panel-simple.c                  | 19 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt b/Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt
> new file mode 100644
> index 0000000..5546221
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/edt,et0350g0dh6.txt
> @@ -0,0 +1,7 @@
> +Emerging Display Technology Corp. 3.5" QVGA (320x240) TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "edt,et0350g0dh6"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.

No reset lines, power supplies, etc.? Yes, simple-panel.txt defines 
properties, but you still need to specify which ones you use. Otherwise, 
I don't know if this panel has a single supply or you just forgot to 
define the supplies.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
