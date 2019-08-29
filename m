From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS bus-timings
Date: Thu, 29 Aug 2019 09:03:10 -0500
Message-ID: <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com> <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 1:36 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>
> Dual-LVDS connections need markers in the DT, this patch adds
> some common documentation to be referenced by both panels and
> bridges.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> ---
> v2->v3:
> * new patch
> ---
>  .../bindings/display/bus-timings/lvds.yaml         | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml b/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
> new file mode 100644
> index 0000000..f35b55a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0

(GPL-2.0-only OR BSD-2-Clause) is preferred for new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bus-timings/lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for bus timings of LVDS interfaces
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> +
> +description: |
> +  This document defines device tree properties common to LVDS and dual-LVDS
> +  interfaces, where a dual-LVDS interface is a dual-link connection with even
> +  pixels traveling on one connection, and with odd pixels traveling on the other
> +  connection.
> +  This document doesn't constitue a device tree binding specification by itself

typo: constitute

> +  but is meant to be referenced by device tree bindings.
> +  When referenced from panel or bridge device tree bindings, the properties
> +  defined in this document are defined as follows. The panel and bridge device
> +  tree bindings are responsible for defining whether each property is required
> +  or optional.
> +
> +properties:
> +  dual-lvds-even-pixels:
> +    type: boolean
> +    description:
> +      This property is specific to an input port of a sink device. When

The schema should define what nodes these go in. The description seems
to indicate in 'port' nodes (or endpoint?), but your use in the panel
binding puts them in the parent.

> +      specified, it marks the port as recipient of even-pixels.
> +
> +  dual-lvds-odd-pixels:
> +    type: boolean
> +    description:
> +      This property is specific to an input port of a sink device. When
> +      specified, it marks the port as recipient of odd-pixels.

However, I don't think you even need these. A panel's port numbers are
fixed can imply even or odd. For example port@0 can be even and port@1
can be odd. The port numbering is typically panel specific, but we may
be able to define the numbering generically if we don't already have
panels with multiple ports.

Also, aren't there dual link DSI panels?

Rob
