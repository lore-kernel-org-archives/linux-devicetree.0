From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] drm/exynos: Add device tree based discovery support for
 Exynos G2D
Date: Sat, 29 Dec 2012 22:27:40 -0800
Message-ID: <CAOesGMgDgdVpNsRpOqM76-ZjhfV61x0d4AUdkS9B5CfvB=6vWg@mail.gmail.com>
References: <1356667208-22372-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1356667208-22372-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Dec 27, 2012 at 8:00 PM, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds device tree match table for Exynos G2D controller.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 6ffa076..aa3d2e4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -19,6 +19,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dma-attrs.h>
> +#include <linux/of.h>
>
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
> @@ -1240,6 +1241,14 @@ static int g2d_resume(struct device *dev)
>
>  static SIMPLE_DEV_PM_OPS(g2d_pm_ops, g2d_suspend, g2d_resume);
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id exynos_g2d_match[] = {
> +       { .compatible = "samsung,exynos-g2d-41" },

What does -41 signify here?

> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_g2d_match);
> +#endif
> +
>  struct platform_driver g2d_driver = {
>         .probe          = g2d_probe,
>         .remove         = __devexit_p(g2d_remove),
> @@ -1247,5 +1256,6 @@ struct platform_driver g2d_driver = {
>                 .name   = "s5p-g2d",
>                 .owner  = THIS_MODULE,
>                 .pm     = &g2d_pm_ops,
> +               .of_match_table = of_match_ptr(exynos_g2d_match),

Please provide bindings update, and cc devicetree-discuss for these
kind of patches.


-Olof
