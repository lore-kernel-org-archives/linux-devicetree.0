From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: add Starry KR122EA0SRA panel binding
Date: Fri, 10 Jun 2016 18:26:03 +0100
Message-ID: <CACvgo50-R_7wqy0jw+MoWQn_axVJbni7wMF7BXuFX99H7pD1iQ@mail.gmail.com>
References: <1465578127-30330-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465578127-30330-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Douglas,

On 10 June 2016 at 18:02, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> The Starry KR122EA0SRA is a 12.2", 1920x1200 TFT-LCD panel connected
> using eDP interfaces.
>
> Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Proper title (sorry!)
>
>  .../devicetree/bindings/display/panel/starry,kr122ea0sra.txt       | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
> new file mode 100644
> index 000000000000..1e87fe6078af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
> @@ -0,0 +1,7 @@
> +Starry 12.2" (1920x1200 pixels) TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "starry,kr122ea0sra"
> +
I think you want to add 'starry' to the vendors list first [1]. Latest
linus-next does not seem to have such an entry.

Regards,
Emil
[1] Documentation/devicetree/bindings/vendor-prefixes.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
