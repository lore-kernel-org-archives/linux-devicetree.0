From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] mfd: core: introduce of_node_name for mfd sub devices
Date: Mon, 23 Sep 2013 14:50:47 -0600
Message-ID: <5240A9A7.8080307@wwwdotorg.org>
References: <1379579392-1794-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379579392-1794-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/19/2013 02:29 AM, Laxman Dewangan wrote:

> diff --git a/Documentation/devicetree/bindings/mfd/mfd-core.txt b/Documentation/devicetree/bindings/mfd/mfd-core.txt

> +MFD DT binding document
> +-----------------------
> +
> +Multi Function Devices (MFDs) have multiple sub module whose driver is developed
> +in different sub-system like GPIO, regulators, RTC, clock etc. The device
> +tree of such device contains multiple sub-node which contains the properties
> +of these sub-modules.
> +The sub modules get of_node handle either by the dev->of_node or by getting
> +the child node handle from parent DT handle by finding child name on parent's
> +of_node.
> +To provide the of_node of sub-module directly, there is two approach:
> +- Add compatible value when defining the sub-module in mfd core and
> +  add this properties when adding DT.
> +- Add the of_node_name when defining the sub-module in mfd core and
> +  add keep same name of child node when adding DT.
> +
> +If none of above matches then sub-module driver will not get their of_node
> +and they need to derive the method to get their node from parent node.

That's all *far* too specific to Linux's internals for a DT binding
document.

I think it's fine for DT bindings for aggregate devices to be written to
require a separate node (with a specific name) for various
sub-components of the HW, if it makes sense to do so from a purely DT
binding perspective. However, the fact that some DT bindings might be
written that way implies nothing about any other particular DT binding,
nor about all other DT bindings.

And indeed if you find that there are a bunch of DT bindings that share
this structure, by all means create some common code to simplify the
drivers for those bindings. However, that still doesn't mean that every
driver or binding has to be structured like that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
