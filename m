From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V3 0/2] video: drm: Add Device tree support to DRM-FIMD
Date: Mon, 27 Aug 2012 15:20:23 +0530
Message-ID: <CAL1wa8foQxaMmrxgGkWqNjd9BJu3N_BbBZ3fWw3HjrRP=BE8Rg@mail.gmail.com>
References: <1345111689-14601-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345111689-14601-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Mr. Inki Dae,
Can you please review this patch set once.

Best Wishes,
Leela Krishna Amudala.

On Thu, Aug 16, 2012 at 3:38 PM, Leela Krishna Amudala
<l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
> This patch set adds device tree support for DRM-FIMD for Samsung's
> Exynos5250.
> It includes parsing platform data from dts file. Also, adds the driver
> data
> for exynos5 device.
>
> This patchset is based and tested on top of v3.6-rc1
> Also depends on below patchset
> http://lists.freedesktop.org/archives/dri-devel/2012-August/026076.html
>
> Changes since V2:
>         - Added driver data to exynos5-drm-fimd as per Marek Szyprowski
> suggestion
>
> Changes since V1:
>         - Corrected typo errors and changed compatibility string
>
> Leela Krishna Amudala (2):
>   drm/exynos: add platform_device_id table and driver data for exynos5
>     drm fimd
>   video: drm: exynos: Add device tree support
>
>  Documentation/devicetree/bindings/fb/drm-fimd.txt |   80 +++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c          |  151
> ++++++++++++++++++++-
>  2 files changed, 224 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
