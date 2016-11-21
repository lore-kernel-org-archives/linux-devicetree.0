From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/13] devicetree/bindings: display: Add bindings for
 LVDS panels
Date: Mon, 21 Nov 2016 10:48:46 -0600
Message-ID: <20161121164846.ej24znigtiw6m6u5@rob-hp-laptop>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479526093-7014-3-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 19, 2016 at 05:28:02AM +0200, Laurent Pinchart wrote:
> LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A.
> Multiple incompatible data link layers have been used over time to
> transmit image data to LVDS panels. This binding supports display panels
> compatible with the JEIDA-59-1999, Open-LDI and VESA SWPG
> specifications.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> ---
>  .../bindings/display/panel/panel-lvds.txt          | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
