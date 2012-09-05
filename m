From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH V3 1/2] drm/exynos: add platform_device_id table and
 driver data for exynos5 drm fimd
Date: Wed, 05 Sep 2012 09:24:22 +0000 (GMT)
Message-ID: <30084300.216361346837061532.JavaMail.weblogic@epml22>
Reply-To: l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
MIME-version: 1.0
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
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, In-Ki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tomasz,
Please find the inline comments.
Will post the next version today.

Thanks.
Leela Krishna Amudala.
------- Original Message -------
Sender : Tomasz Figa<t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> Junior Software Engineer/SPRC-Linux Platform (SSD)/Samsung Electronics
Date : Sep 05, 2012 13:22 (GMT+05:30)
Title : Re: [PATCH V3 1/2] drm/exynos: add platform_device_id table and driver data for exynos5 drm fimd

Hi Leela,

See my comments inline.

On Thursday 16 of August 2012 12:08:08 Leela Krishna Amudala wrote:
> +enum fimd_version_type {
> + VERSION_8, /* FIMD_VERSION8 */
> +};
> +
> +struct drm_fimd_driver_data {
> + enum fimd_version_type fimd_ver;
> +};
> +
> +struct drm_fimd_driver_data exynos5_drm_fimd_driver_data = {
> + .fimd_ver = VERSION_8,
> +};

I think that the approach with timing_base, as suggested by Joonyoung Shim, 
would be much cleaner.

Leela: Okay, will go with timing_base approach only

> +static struct platform_device_id exynos_drm_fimd_driver_ids[] = {
> + {
> + .name = "exynos4-fb",
> + }, {
> + .name = "exynos5-drm-fimd",
> + .driver_data = (unsigned long)&exynos5_drm_fimd_driver_data,
> + },
> + {},
> +};
> +MODULE_DEVICE_TABLE(platform, exynos_drm_fimd_driver_ids);

If I see correctly, this will crash on a null pointer dereference on 
Exynos4 without DT, because of NULL driver_data.

Leela: yes, you are right, will take care of this

P.S. I think you should CC linux-arm-kernel and linux-samsung-soc lists 
when submitting patches related to ARM and Samsung SoCs.

Leela: Okay, will do it next time.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
