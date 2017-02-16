From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v4 20/36] media: imx: Add CSI subdev driver
Date: Thu, 16 Feb 2017 11:52:06 +0000
Message-ID: <20170216115206.GL27312@n2100.armlinux.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-21-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487211578-11360-21-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgde
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 06:19:22PM -0800, Steve Longerbeam wrote:
> +static const struct platform_device_id imx_csi_ids[] = {
> +	{ .name = "imx-ipuv3-csi" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, imx_csi_ids);
> +
> +static struct platform_driver imx_csi_driver = {
> +	.probe = imx_csi_probe,
> +	.remove = imx_csi_remove,
> +	.id_table = imx_csi_ids,
> +	.driver = {
> +		.name = "imx-ipuv3-csi",
> +	},
> +};
> +module_platform_driver(imx_csi_driver);
> +
> +MODULE_DESCRIPTION("i.MX CSI subdev driver");
> +MODULE_AUTHOR("Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:imx-ipuv3-csi");

Just a reminder that automatic module loading of this is completely
broken right now (not your problem) due to this stupid idea in the
IPUv3 code:

		if (!ret)
			ret = platform_device_add(pdev);
		if (ret) {
			platform_device_put(pdev);
			goto err_register;
		}

		/*
		 * Set of_node only after calling platform_device_add. Otherwise
		 * the platform:imx-ipuv3-crtc modalias won't be used.
		 */
		pdev->dev.of_node = of_node;

setting pdev->dev.of_node changes the modalias exported to userspace,
so udev sees a DT based modalias, which causes it to totally miss any
driver using a non-DT based modalias.

The IPUv3 code needs fixing, not only for imx-media-csi, but also for
imx-ipuv3-crtc too, because that module will also suffer the same
issue.

The only solution is... don't fsck with dev->of_node assignment.  In
this case, it's probably much better to pass it in via platform data.
If you then absolutely must have dev->of_node, doing it in the driver
means that you avoid the modalias mess before the appropriate driver
is loaded.  However, that's still not a nice solution because the
modalias file still ends up randomly changing its contents.

As I say, not _your_ problem, but it's still a problem that needs
solving, and I don't want it forgotten about.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
