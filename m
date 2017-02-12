From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH RESEND 1/1] media: platform: Renesas IMR driver
Date: Sun, 12 Feb 2017 17:51:03 +0200
Message-ID: <1770632.4GFlW6r2cg@avalon>
References: <20170211200207.273799464@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170211200207.273799464-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

(CC'ing the dri-evel mailing list)

Thank you for the patch.

On Saturday 11 Feb 2017 23:02:01 Sergei Shtylyov wrote:
> From: Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> The image renderer light extended 4 (IMR-LX4) or the distortion correction
> engine is a drawing processor with a simple  instruction system capable of
> referencing data on an external memory as 2D texture data and performing
> texture mapping and drawing with respect to any shape that is split into
> triangular objects.
> 
> This V4L2 memory-to-memory device driver only supports image renderer found
> in the R-Car gen3 SoCs; the R-Car gen2 support  can be added later...

Let's start with the main question : given that this is a rendering engine, it 
looks like it should use the DRM subsystem.

> [Sergei: merged 2 original patches, added the patch description, removed
> unrelated parts,  added the binding document, ported the driver to the
> modern kernel, renamed the UAPI header file and the guard  macros to match
> the driver name, extended the copyrights, fixed up Kconfig prompt/depends/
> help, made use of the BIT()/GENMASK() macros, sorted #include's, removed
> leading  dots and fixed grammar in the comments, fixed up indentation to
> use tabs where possible, renamed IMR_DLSR to IMR_DLPR to match the manual,
> separated the register offset/bit #define's, removed *inline* from .c file,
> fixed lines over 80 columns, removed useless parens, operators, casts,
> braces, variables, #include's, (commented out) statements, and even
> function, inserted empty line after desclaration, removed extra empty
> lines, reordered some local variable desclarations, removed calls to
> 4l2_err() on kmalloc() failure, fixed the error returned by imr_default(),
> avoided code duplication in the IRQ handler, used '__packed' for the UAPI
> structures, enclosed the macro parameters in parens, exchanged the values
> of IMR_MAP_AUTO[SD]G macros.]
> 
> Signed-off-by: Konstantin Kozhevnikov
> <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> Signed-off-by: Sergei Shtylyov
> <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
> This patch is against the 'media_tree.git' repo's 'master' branch.
> 
>  Documentation/devicetree/bindings/media/rcar_imr.txt |   23
>  drivers/media/platform/Kconfig                       |   13
>  drivers/media/platform/Makefile                      |    1
>  drivers/media/platform/rcar_imr.c                    | 1923 +++++++++++++++
>  include/uapi/linux/rcar_imr.h                        |   94
>  5 files changed, 2054 insertions(+)

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
