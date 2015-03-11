From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC 15/18] omap3isp: Add support for the Device Tree
Date: Thu, 12 Mar 2015 01:48:02 +0200
Message-ID: <1977501.nIrQKlrSI0@avalon>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi> <1425764475-27691-16-git-send-email-sakari.ailus@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425764475-27691-16-git-send-email-sakari.ailus-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Saturday 07 March 2015 23:41:12 Sakari Ailus wrote:
> Add the ISP device to omap3 DT include file and add support to the driver to
> use it.
> 
> Also obtain information on the external entities and the ISP configuration
> related to them through the Device Tree in addition to the platform data.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
> ---
>  drivers/media/platform/omap3isp/isp.c       |  206 ++++++++++++++++++++++--
>  drivers/media/platform/omap3isp/isp.h       |   11 ++
>  drivers/media/platform/omap3isp/ispcsiphy.c |    7 +
>  3 files changed, 213 insertions(+), 11 deletions(-)

[snip]

> @@ -2358,14 +2541,6 @@ static int isp_probe(struct platform_device *pdev)
>  	isp->mmio_hist_base_phys =
>  		mem->start + isp_res_maps[m].offset[OMAP3_ISP_IOMEM_HIST];
> 
> -	isp->syscon = syscon_regmap_lookup_by_pdevname("syscon.0");
> -	isp->syscon_offset = isp_res_maps[m].syscon_offset;

You're removing syscon_offset initialization here but not adding it anywhere 
else. This patch doesn't match the commit in your rm696-053-upstream branch, 
could you send the right version ? I'll then review it.

> -	isp->phy_type = isp_res_maps[m].phy_type;
> -	if (IS_ERR(isp->syscon)) {
> -		ret = PTR_ERR(isp->syscon);
> -		goto error_isp;
> -	}
> -
>  	/* IOMMU */
>  	ret = isp_attach_iommu(isp);
>  	if (ret < 0) {

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
