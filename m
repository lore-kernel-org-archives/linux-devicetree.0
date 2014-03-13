From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH] OF: kobj node lifecycle fixes
Date: Thu, 13 Mar 2014 08:30:37 +0200
Message-ID: <FF624D4F-D74C-48B1-896B-D0E32CBE7DBF@antoniou-consulting.com>
References: <1394664580-23130-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394664580-23130-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Mar 13, 2014, at 12:49 AM, Grant Likely wrote:

> From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> 
> After the move to having device nodes be proper kobjects the lifecycle
> of the node needs to be controlled better.
> 
> At first convert of_add_node() in the unflattened functions to
> of_init_node() which initializes the kobject so that of_node_get/put
> work correctly even before of_init is called.
> 
> Afterwards introduce of_node_is_initialized & of_node_is_attached that
> query the underlying kobject about the state (attached means kobj
> is visible in sysfs)
> 
> Using that make sure the lifecycle of the tree is correct at all
> times.
> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> [grant.likely: moved of_node_init() calls, fixed up locking, and
>               dropped __of_populate() hunks]
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> I've reworked Pantelis' patch to work on my tree. Here's the result.
> I've already got this in my tree and will be pushing it out shortly.
> 
> g.
> 
> drivers/of/base.c  | 35 ++++++++++++++++++++++++++---------
> drivers/of/fdt.c   |  3 +--
> drivers/of/pdt.c   |  3 +--
> include/linux/of.h | 19 +++++++++++++++++++
> 4 files changed, 47 insertions(+), 13 deletions(-)
> 

Looks good; booted and tested overlays with no issues.

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
