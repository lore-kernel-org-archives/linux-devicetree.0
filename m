From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH V3 2/2] video: drm: exynos: Add device tree support
Date: Mon, 27 Aug 2012 10:04:51 +0200
Message-ID: <20120827080451.GA26594@pengutronix.de>
References: <1345111689-14601-1-git-send-email-l.krishna@samsung.com>
 <1345111689-14601-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1345111689-14601-3-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 16, 2012 at 03:38:09PM +0530, Leela Krishna Amudala wrote:
> Add device tree based discovery support for DRM-FIMD driver.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/fb/drm-fimd.txt |   80 +++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c          |   95 ++++++++++++++++++++-
>  2 files changed, 173 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
> 
> diff --git a/Documentation/devicetree/bindings/fb/drm-fimd.txt b/Documentation/devicetree/bindings/fb/drm-fimd.txt
> new file mode 100644
> index 0000000..8ad8814
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fb/drm-fimd.txt
> @@ -0,0 +1,80 @@
> +* Samsung Display Controller using DRM frame work
> +
> +The display controller is used to transfer image data from memory to an
> +external LCD driver interface. It supports various color formats such as
> +rgb and yuv.
> +
> +Required properties:
> + - compatible: Should be "samsung,exynos5-drm" for fimd using DRM frame work.
> + - reg: physical base address of the controller and length of memory
> +   mapped region.
> + - interrupts: Three interrupts should be specified. The interrupts should be
> +   specified in the following order.
> +   - VSYNC interrupt
> +   - FIFO level interrupt
> +   - FIMD System Interrupt
> +
> + - samsung,fimd-display: This property should specify the phandle of the
> +   display device node which holds the video interface timing with the
> +   below mentioned properties.
> +
> +   - lcd-htiming: Specifies the horizontal timing for the overlay. The
> +     horizontal timing includes four parameters in the following order.
> +
> +     - horizontal back porch (in number of lcd clocks)
> +     - horizontal front porch (in number of lcd clocks)
> +     - hsync pulse width (in number of lcd clocks)
> +     - Display panels X resolution.
> +
> +   - lcd-vtiming: Specifies the vertical timing for the overlay. The
> +     vertical timing includes four parameters in the following order.
> +
> +     - vertical back porch (in number of lcd lines)
> +     - vertical front porch (in number of lcd lines)
> +     - vsync pulse width (in number of lcd clocks)
> +     - Display panels Y resolution.

I started an approach to add a common description for displays:

https://patchwork.kernel.org/patch/1154751/https://patchwork.kernel.org/patch/1154751/

There are still comments to this approach, but I think rather than
inventing SoC specific bindings we should use a common binding.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
