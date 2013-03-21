From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V2 1/2] of: Make device nodes kobjects so they show up
 in sysfs
Date: Thu, 21 Mar 2013 13:49:36 +0100
Message-ID: <1363870176.17680.33.camel@pasglop>
References: <1363865097-32764-1-git-send-email-grant.likely@secretlab.ca>
 <1363865097-32764-2-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363865097-32764-2-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2013-03-21 at 11:24 +0000, Grant Likely wrote:
> Device tree nodes are already treated as objects, and we already want to
> expose them to userspace which is done using the /proc filesystem today.
> Right now the kernel has to do a lot of work to keep the /proc view in
> sync with the in-kernel representation. If device_nodes are switched to
> be kobjects then the device tree code can be a whole lot simpler. It
> also turns out that switching to using /sysfs from /proc results in
> smaller code and data size, and the userspace ABI won't change if
> /proc/device-tree symlinks to /sys/device-tree

Here you say /sys/device-tree

> +What:		/sys/firmware/ofw/../device-tree/

Here you say /sys/firmware/../device-tree/ ... (wtf are those .. ?)

And further down:

	proc_symlink("device-tree", NULL, "/sys/firmware/ofw/device-tree-0");

Some confusion here ... at least _I_ am confused :-)

Then, you do this:

> +static bool of_init_complete = false;

The above requires some explanations

> +static int __of_node_add(struct device_node *np)
> +{
> +
> +	const char *name;
> +	struct property *pp;
> +	static int extra = 0;
> +	int rc;
> +
> +	np->kobj.kset = of_kset;
> +	if (!np->parent) {
> +		/* Nodes without parents are new top level trees */
> +		rc = kobject_add(&np->kobj, NULL, "device-tree-%i", extra++);
> +#if !defined(CONFIG_PROC_DEVICETREE)
> +		/* Symlink to the new tree when PROC_DEVICETREE is disabled */
> +		if (!rc && extra == 1)
> +			proc_symlink("device-tree", NULL, "/sys/firmware/ofw/device-tree-0");
> +#endif /* CONFIG_PROC_DEVICETREE */

WTF is this business of having multiple top level trees ? Also that
local static extra is gross. What is this all about ?
 
> +	} else {
> +		name = kbasename(np->full_name);
> +		if (!name || !name[0])
> +			return -EINVAL;
> +		rc = kobject_add(&np->kobj, &np->parent->kobj, "%s", name);
> +	}
> +	if (rc)
> +		return rc;
> +
> +	for_each_property_of_node(np, pp) {
> +		/* Important: Don't leak passwords */
> +		bool secure = strncmp(pp->name, "security-", 9) == 0;
> +
> +		pp->attr.attr.name = pp->name;
> +		pp->attr.attr.mode = secure ? S_IRUSR : S_IRUGO;
> +		pp->attr.size = secure ? 0 : pp->length;
> +		pp->attr.read = of_node_property_read;
> +		rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
> +		WARN(rc, "error creating device node attribute\n");

Might want some better message (attribute name, node path, ...)

We have mechanisms to deal with collisions in proc devicetree that you
don't seem to have here (or am I missing something ?). The main source
of pain is a property and a child node having the same name (happens
regulary with l2-cache on macs for example).

Cheers,
Ben.
