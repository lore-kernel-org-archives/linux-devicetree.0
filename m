From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v3 20/24] media: imx: Add Camera Interface subdev driver
Date: Thu, 2 Feb 2017 22:35:28 +0000
Message-ID: <20170202223528.GX27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-21-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1483755102-24785-21-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@m>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 06:11:38PM -0800, Steve Longerbeam wrote:
> +struct camif_priv {
> +	struct device         *dev;
> +	struct video_device    vfd;

You can't do this.

> +static struct video_device camif_videodev = {
> +	.fops		= &camif_fops,
> +	.ioctl_ops	= &camif_ioctl_ops,
> +	.minor		= -1,
> +	.release	= video_device_release,
> +	.vfl_dir	= VFL_DIR_RX,
> +	.tvnorms	= V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
> +};

> +static int camif_probe(struct platform_device *pdev)
> +{
> +	struct imx_media_internal_sd_platformdata *pdata;
> +	struct camif_priv *priv;
> +	struct video_device *vfd;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;

You kmalloc this structure, so this structure has the lifetime of
the driver being bound to the platform device.

> +	vfd = &priv->vfd;
> +	*vfd = camif_videodev;

However, "*vfd" contains a struct device, and you _correctly_ set the
release function for "*vfd" to video_device_release via camif_videodev.

However, if you try to rmmod imx-media, then you end up with a kernel
warning that you're freeing memory containing a held lock, and later
chaos ensues because kmalloc has been corrupted.

The root cause of this is embedding the device structure within the
video_device into the driver's private data.  *Any* structure what so
ever that contains a kref is reference counted, and that includes
struct device, and therefore also includes struct video_device.  What
that means is that its lifetime is _not_ under _your_ control, and
you may not free it except through its release function (which is
video_device_release().)  However, that also tries to kfree (with an
offset of 4) your private data, which results in the warning and the
corrupted kmalloc free lists.

The solution is simple, make "vfd" a pointer in your private data
structure and kmalloc() it separately, letting video_device_release()
kfree() that data when it needs to.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
