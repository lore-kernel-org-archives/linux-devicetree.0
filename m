From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2 v3] drivers/core/of: Add symlink to device-tree from
 devices with an OF node
Date: Tue, 17 Feb 2015 19:07:14 -0600
Message-ID: <CAL_JsqJZg9zTjpx6pNxF8yvbTVcXX3cMP=RtEHUaf+E2X3MC_w@mail.gmail.com>
References: <1415342031.4925.27.camel@kernel.crashing.org> <1415342117.4925.29.camel@kernel.crashing.org>
 <1415596626.5769.14.camel@kernel.crashing.org> <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
 <1424219118.21410.111.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424219118.21410.111.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jeremy Kerr <jeremy.kerr-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 17, 2015 at 6:25 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> So I've been annoyed lately with having a bunch of devices such as i2c
> eeproms (for use by VPDs, server world !) and other bits and pieces that
> I want to be able to identify from userspace, and possibly provide
> additional data about from FW.
>
> Basically, it boils down to correlating the sysfs device with the OF
> tree device node, so that user space can use device-tree info such as
> additional "location" or "label" (or whatever else we can come up with)
> propreties to identify a given device, or get some attributes of use
> about it, etc...
>
> Now, so far, we've done that in some subsystem in a fairly ad-hoc basis
> using "devspec" properties. For example, PCI creates them if it can
> correlate the probed device with a DT node. Some powerpc specific busses
> do that too.
>
> However, i2c doesn't and it would be nice to have something more generic
> since technically any device can have a corresponding device tree node.
>
> This patch adds an "of_node" symlink to devices that have a non-NULL
> dev->of_node pointer, the patch is pretty trivial and seems to work just
> fine for me.
>
> Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>
> This addresses Greg's comments. Note that I'm not 100% certain about
> using device_add_class_symlinks(), I had to put the code before the
> test for dev->class, maybe we should rename that function to device_add_symlinks()
> if it grows beyond the class bits ?
>
> Also there was nothing that I could find in Documentation/ABI that
> documented "core" device properties, it's all in
> Documentation/sysfs-rules.txt, but as suggested by Greg (on IRC) I
> went for ABI anyway, so I've added a file for "generic" properties
> and added that one in. I'm happy to change it if you think that's not
> right, just let me know where you want things.
>
> I'm not resending patch 1/2, it should still be fine. Let me know if
> you want a new copy.
>
>  Documentation/ABI/stable/sysfs-devices | 10 ++++++++++
>  drivers/base/core.c                    | 16 ++++++++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-devices
>
> diff --git a/Documentation/ABI/stable/sysfs-devices b/Documentation/ABI/stable/sysfs-devices
> new file mode 100644
> index 0000000..43f78b88d
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-devices
> @@ -0,0 +1,10 @@
> +# Note: This documents additional properties of any device beyond what
> +# is documented in Documentation/sysfs-rules.txt
> +
> +What:          /sys/devices/*/of_path
> +Date:          February 2015
> +Contact:       Device Tree mailing list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> +Description:
> +               Any device associated with a device-tree node will have
> +               an of_path symlink pointing to the corresponding device
> +               node in /sys/firmware/devicetree/
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 97e2baf..2549805 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -805,8 +805,16 @@ static void cleanup_device_parent(struct device *dev)
>
>  static int device_add_class_symlinks(struct device *dev)
>  {
> +       struct device_node *of_node = dev_of_node(dev);
>         int error;
>
> +       if (of_node) {
> +               error = sysfs_create_link(&dev->kobj, &of_node->kobj,"of_node");
> +               if (error)
> +                       dev_warn(dev, "Error %d creating of_node link\n",error);
> +               /* An error here doesn't warrant bringing down the device */
> +       }
> +
>         if (!dev->class)
>                 return 0;
>
> @@ -814,7 +822,7 @@ static int device_add_class_symlinks(struct device *dev)
>                                   &dev->class->p->subsys.kobj,
>                                   "subsystem");
>         if (error)
> -               goto out;
> +               goto out_devnode;
>
>         if (dev->parent && device_is_not_partition(dev)) {
>                 error = sysfs_create_link(&dev->kobj, &dev->parent->kobj,
> @@ -842,12 +850,16 @@ out_device:
>
>  out_subsys:
>         sysfs_remove_link(&dev->kobj, "subsystem");
> -out:
> +out_devnode:
> +       sysfs_remove_link(&dev->kobj, "of_node");
>         return error;
>  }
>
>  static void device_remove_class_symlinks(struct device *dev)
>  {
> +       if (dev_of_node(dev))
> +               sysfs_remove_link(&dev->kobj, "of_node");
> +
>         if (!dev->class)
>                 return;
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
