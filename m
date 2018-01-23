From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drivers: firmware: xilinx: Add debugfs interface
Date: Tue, 23 Jan 2018 09:41:03 +0100
Message-ID: <20180123084103.GC21463@kroah.com>
References: <1516220434-22204-1-git-send-email-jollys@xilinx.com>
 <1516220434-22204-5-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516220434-22204-5-git-send-email-jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jolly Shah <jolly.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rajanv-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Jolly Shah <jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 12:20:34PM -0800, Jolly Shah wrote:
> +/* Setup debugfs fops */
> +static const struct file_operations fops_zynqmp_pm_dbgfs = {
> +       .owner  =       THIS_MODULE,
> +       .write  =       zynqmp_pm_debugfs_api_write,
> +       .read   =       zynqmp_pm_debugfs_api_version_read,
> +};
> +
> +/**
> + * zynqmp_pm_api_debugfs_init - Initialize debugfs interface
> + *
> + * Return:      Returns 0 on success
> + *             Corresponding error code otherwise
> + */
> +int zynqmp_pm_api_debugfs_init(void)
> +{
> +       int err;
> +
> +       /* Initialize debugfs interface */
> +       zynqmp_pm_debugfs_dir = debugfs_create_dir(DRIVER_NAME, NULL);
> +       if (!zynqmp_pm_debugfs_dir) {
> +               pr_err("debugfs_create_dir failed\n");
> +               return -ENODEV;
> +       }

No, you should NEVER care if a debugfs call returned an error or not, no
need to check it at all.  Your code path should not change based on the
return value as no code should depened on the functionality of debugfs.

Any error returned by a debugfs call can be passed right back into it
with no problems, so again, no need to check this.

> +
> +       zynqmp_pm_debugfs_power =
> +               debugfs_create_file("pm", 0220,
> +                                   zynqmp_pm_debugfs_dir, NULL,
> +                                   &fops_zynqmp_pm_dbgfs);
> +       if (!zynqmp_pm_debugfs_power) {
> +               pr_err("debugfs_create_file power failed\n");
> +               err = -ENODEV;
> +               goto err_dbgfs;
> +       }
> +
> +       zynqmp_pm_debugfs_api_version =
> +               debugfs_create_file("api_version", 0444,
> +                                   zynqmp_pm_debugfs_dir, NULL,
> +                                   &fops_zynqmp_pm_dbgfs);
> +       if (!zynqmp_pm_debugfs_api_version) {
> +               pr_err("debugfs_create_file api_version failed\n");
> +               err = -ENODEV;
> +               goto err_dbgfs;
> +       }

Why do you save these dentries at all anyway?  You never do anything
with them, just create the files and away you go, no need to worry about
anything.

Remember, debugfs was created to be very simple to use, don't make it
more complex than it has to be please.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
