From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 01/13] dt-bindings: Add Renesas R-Car FCP DT bindings
Date: Mon, 25 Apr 2016 09:32:04 +0200
Message-ID: <CAMuHMdVaoD7gU0_WvSN0mFSCRyeWntZ1PHtkZ5ccFzCS-H-HUg@mail.gmail.com>
References: <1461455400-28767-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1461455400-28767-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461455400-28767-2-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Sun, Apr 24, 2016 at 1:49 AM, Laurent Pinchart
<laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> The FCP is a companion module of video processing modules in the Renesas
> R-Car Gen3 SoCs. It provides data compression and decompression, data
> caching, and conversion of AXI transaction in order to reduce the memory

transactions

> bandwidth.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> ---
>  .../devicetree/bindings/media/renesas,fcp.txt      | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> new file mode 100644
> index 000000000000..46beec97d625
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> @@ -0,0 +1,31 @@
> +Renesas R-Car Frame Compression Processor (FCP)
> +-----------------------------------------------
> +
> +The FCP is a companion module of video processing modules in the Renesas R-Car
> +Gen3 SoCs. It provides data compression and decompression, data caching, and
> +conversion of AXI transaction in order to reduce the memory bandwidth.

transactions

> +There are three types of FCP whose configuration and behaviour highly depend
> +on the module they are paired with.
>
+ - compatible: Must be one or more of the following
+
+   - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
+   - "renesas,fcpv" for generic compatible 'FCP for VSP'

As you list only one compatible value, I guess the type is determined
automatically at run-time?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
