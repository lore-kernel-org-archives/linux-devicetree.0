From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add Synopsys DW MIPI DSI
 DRM bridge driver
Date: Tue, 23 May 2017 10:14:08 -0500
Message-ID: <20170523151408.jn3vlqh5i4xmmtqw@rob-hp-laptop>
References: <1495207218-11372-1-git-send-email-philippe.cornu@st.com>
 <1495207218-11372-3-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495207218-11372-3-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.orgdev
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 05:20:15PM +0200, Philippe CORNU wrote:
> This patch adds documentation of device tree bindings for the
> Synopsys DesignWare MIPI DSI host DRM bridge driver.
> 
> Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
> ---
>  .../bindings/display/bridge/dw_mipi_dsi.txt        | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> new file mode 100644
> index 0000000..652c0f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> @@ -0,0 +1,36 @@
> +Synopsys DesignWare MIPI DSI host controller
> +============================================
> +
> +This document defines device tree properties for the Synopsys DesignWare MIPI
> +DSI host controller. It doesn't constitue a device tree binding specification
> +by itself but is meant to be referenced by platform-specific device tree
> +bindings.
> +
> +When referenced from platform device tree bindings the properties defined in
> +this document are defined as follows. The platform device tree bindings are
> +responsible for defining whether each property is required or optional.
> +
> +- reg: Memory mapped base address and length of the DWC MIPI DSI registers.
> +
> +- clocks: References to all the clocks specified in the clock-names property
> +  as specified in [1].
> +
> +- clock-names: The DWC MIPI DSI host uses the following clocks.
> +
> +  - "pclk" is the peripheral clock for either AHB and APB (mandatory).
> +  - "ref" is the pll reference clock (mandatory).
> +
> +- resets: References to all the resets specified in the reset-names property
> +  as specified in [2]. (optional)
> +
> +- reset-names: string reset name, must be "apb" if used. (optional)
> +
> +- ports: The connectivity of the DWC MIPI DSI host controller
> +  with the rest of the system is expressed in using ports as specified in the
> +  device graph bindings in [3] & [4]. The numbering of the ports
> +  is platform-specific.

Why is numbering platform specific? Are there differing numbers of 
independent channels? I'm fine if platforms can override, but can we 
define what is the default or common case?

> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/reset/reset.txt
> +[3] Documentation/devicetree/bindings/media/video-interfaces.txt
> +[4] Documentation/devicetree/bindings/graph.txt
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
