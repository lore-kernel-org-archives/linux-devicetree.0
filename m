From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: re-use kernel's kbasename()
Date: Wed, 31 Oct 2012 16:42:32 +0100
Message-ID: <CACxGe6uCGk5Ue2QZobwNQJ_eGdmit=Dy1dO+5AB4uHaOex7zHw@mail.gmail.com>
References: <1351690226-28152-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351690226-28152-1-git-send-email-andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
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
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 31, 2012 at 2:30 PM, Andy Shevchenko
<andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Please merge through the same tree that adds the new kbasename function.

g.

> ---
>  drivers/of/fdt.c |   10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 91a375f..0ca0f9e 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -486,14 +486,8 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
>                 depth++;
>                 pathp = (char *)p;
>                 p = ALIGN(p + strlen(pathp) + 1, 4);
> -               if ((*pathp) == '/') {
> -                       char *lp, *np;
> -                       for (lp = NULL, np = pathp; *np; np++)
> -                               if ((*np) == '/')
> -                                       lp = np+1;
> -                       if (lp != NULL)
> -                               pathp = lp;
> -               }
> +               if (*pathp == '/')
> +                       pathp = kbasename(pathp);
>                 rc = it(p, pathp, depth, data);
>                 if (rc != 0)
>                         break;
> --
> 1.7.10.4
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
