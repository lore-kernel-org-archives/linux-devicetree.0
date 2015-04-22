From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/4] Fix null pointer deference when calling of_platform_depopulate
Date: Wed, 22 Apr 2015 18:14:17 +0200
Message-ID: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_platform_depopulate can lead to a kernel error when calling release_resource()

of_platform_depopulate()
      of_platform_device_destroy()
        platform_device_unregister(platform_device *pdev)
	  platform_device_del(platform_device *pdev)
	    for (i = 0; i < pdev->num_resources; i++)
	    	      release_resource()

The reason is that it is trying to release a resource that was not allocated
via insert_resource

of_platform_populate()
      ...
      	of_device_alloc()
	  pdev = platform_device_alloc()
	  # set pdev->resource, similar to platform_device_add_resources()
	  of_device_add(platform_device *pdev)
	    # similar to platform_device_add(), but note there's no
	    # insert_resource() in this path
	    device_add(&pdev->dev)

This set of patches modifies release_resource to check for
resource->parent==NULL and throw a warning if there is an error.

base/platform has been fixed for an hypothetical condition where parent is
set but the platform is neither MEM or IO.

Then platform_device_alloc has been modified so it supports of and amba 
devices.

Finally of_device_add has been modified to use platform_device_add().

v1: https://lkml.org/lkml/2015/4/20/435

v2: https://lkml.org/lkml/2015/4/21/99
    https://lkml.org/lkml/2015/4/21/100

Ricardo Ribalda Delgado (4):
  kernel/resource: Invalid memory access in __release_resource
  base/platform: Only insert MEM and IO resources
  base/platform: Continue on insert_resource() error
  of/platform: Use platform_device interface

 drivers/base/platform.c | 20 ++++++++++++--------
 drivers/of/platform.c   |  3 ++-
 kernel/resource.c       |  3 +++
 3 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
