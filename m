From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/2 v6] of: add display helper
Date: Mon, 15 Oct 2012 16:24:43 +0530
Message-ID: <CAL1wa8fP8LBCUBVJS1=dy3cyFe+bY-Gu2+wtJyuCrgbP93m3Wg@mail.gmail.com>
References: <1349373560-11128-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1349373560-11128-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Steffen,

To which version of the kernel we can expect this patch set to be merged into?
Because I'm waiting for this from long time to add DT support for my
display controller :)

Best Wishes,
Leela Krishna Amudala.

On Thu, Oct 4, 2012 at 11:29 PM, Steffen Trumtrar
<s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>
> Hi!
>
> In accordance with Stepehn Warren, I downsized the binding.
> Now, just the display-timing is described, as I think, it is way easier to
> agree
> on those and have a complete binding.
>
> Regards,
> Steffen
>
> Steffen Trumtrar (2):
>   of: add helper to parse display timings
>   of: add generic videomode description
>
>  .../devicetree/bindings/video/display-timings.txt  |  222
> ++++++++++++++++++++
>  drivers/of/Kconfig                                 |   10 +
>  drivers/of/Makefile                                |    2 +
>  drivers/of/of_display_timings.c                    |  183
> ++++++++++++++++
>  drivers/of/of_videomode.c                          |  212
> +++++++++++++++++++
>  include/linux/of_display_timings.h                 |   85 ++++++++
>  include/linux/of_videomode.h                       |   41 ++++
>  7 files changed, 755 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/video/display-timings.txt
>  create mode 100644 drivers/of/of_display_timings.c
>  create mode 100644 drivers/of/of_videomode.c
>  create mode 100644 include/linux/of_display_timings.h
>  create mode 100644 include/linux/of_videomode.h
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fbdev" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
