From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 1/2] drm/exynos: add platform_device_id table and driver
	data for exynos5 drm fimd
Date: Wed, 05 Sep 2012 09:52:54 +0200
Message-ID: <1560378.upcWAQYQSz@amdc1227>
References: <1345111689-14601-1-git-send-email-l.krishna@samsung.com>
	<1345111689-14601-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-reply-to: <1345111689-14601-2-git-send-email-l.krishna@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Leela,

See my comments inline.

On Thursday 16 of August 2012 12:08:08 Leela Krishna Amudala wrote:
> +enum fimd_version_type {
> +	VERSION_8, /* FIMD_VERSION8 */
> +};
> +
> +struct drm_fimd_driver_data {
> +	enum fimd_version_type fimd_ver;
> +};
> +
> +struct drm_fimd_driver_data exynos5_drm_fimd_driver_data = {
> +	.fimd_ver = VERSION_8,
> +};

I think that the approach with timing_base, as suggested by Joonyoung Shim, 
would be much cleaner.

> +static struct platform_device_id exynos_drm_fimd_driver_ids[] = {
> +	{
> +		.name		= "exynos4-fb",
> +	}, {
> +		.name		= "exynos5-drm-fimd",
> +		.driver_data	= (unsigned long)&exynos5_drm_fimd_driver_data,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(platform, exynos_drm_fimd_driver_ids);

If I see correctly, this will crash on a null pointer dereference on 
Exynos4 without DT, because of NULL driver_data.

P.S. I think you should CC linux-arm-kernel and linux-samsung-soc lists 
when submitting patches related to ARM and Samsung SoCs.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
