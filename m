From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 00/10] R-Car DU: Convert LVDS code to bridge driver
Date: Mon, 15 Jan 2018 07:59:10 +0100
Message-ID: <20180115065909.ajhigdnv4nl5tuiw@verge.net.au>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180112005858.26472-1-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 12, 2018 at 02:58:48AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This patch series addresses a design mistake that dates back from the initial
> DU support. Support for the LVDS encoders, which are IP cores separate from
> the DU, was bundled in the DU driver. Worse, both the DU and LVDS were
> described through a single DT node.
> 
> To fix the, patches 01/10 and 02/10 define new DT bindings for the LVDS
> encoders, and deprecate their description inside the DU bindings. To retain
> backward compatibility with existing DT, patch 03/10 then patches the device
> tree at runtime to convert the legacy bindings to the new ones.
> 
> With the DT side addressed, patch 04/10 then converts the LVDS support code to
> a separate bridge driver. After a small fix to the Porter board device tree in
> patch 05/10, patches 06/10 to 10/10 then update all the device tree sources to
> the new LVDS encoders bindings.
> 
> I decided to go for live DT patching in patch 03/10 because implementing
> support for both the legacy and new bindings in the driver would have been
> very intrusive, and prevented further cleanups. I'm in a way both proud and 
> ashamed of that patch that I would call a neat and dirty hack. It was fun to
> write perhaps in a similar way that one would enjoy researching and developing
> proof-of-concepts for security holes: they're good and bad at the same time.
> 
> Anyway, with this philosophical considerations aside, there were a few
> shortcomings in the OF API that I worked around with local code in the driver.
> If anyone is interested in performing similar live DT patching I think we
> could move some of the code to the OF core. For instance I was surprised
> to not find a device node lookup by path function that would start at a
> given node instead of the root of the live device tree, and had to write
> rcar_du_of_find_node_by_path(). Utility functions to add or modify properties
> or to rename nodes could similarly be added.
> 
> Laurent Pinchart (10):
>   dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
>   dt-bindings: display: renesas: Deprecate LVDS support in the DU
>     bindings
>   drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
>   drm: rcar-du: Convert LVDS encoder code to bridge driver
>   ARM: dts: porter: Fix HDMI output routing
>   ARM: dts: r8a7790: Convert to new LVDS DT bindings
>   ARM: dts: r8a7791: Convert to new LVDS DT bindings
>   ARM: dts: r8a7793: Convert to new LVDS DT bindings
>   arm64: dts: renesas: r8a7795: Convert to new LVDS DT bindings
>   arm64: dts: renesas: r8a7796: Convert to new LVDS DT bindings

I understand that there will be a v2 to address review of the non DTS
patches. I am marking the DTS patches as "Changes Requested" as they
are dependent on the bindings patches from my PoV.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
