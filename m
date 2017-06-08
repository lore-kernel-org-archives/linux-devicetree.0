From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add Synopsys DW MIPI DSI
 DRM bridge driver
Date: Thu, 8 Jun 2017 10:40:28 -0500
Message-ID: <20170608154028.6ck3dos6de2dogrk@rob-hp-laptop>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-3-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496414235-20098-3-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mickael Reulier <mickael.r>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 02, 2017 at 04:37:11PM +0200, Philippe CORNU wrote:
> This patch adds documentation of device tree bindings for the
> Synopsys DesignWare MIPI DSI host DRM bridge driver.
> 
> Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
> ---
>  .../bindings/display/bridge/dw_mipi_dsi.txt        | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> new file mode 100644
> index 0000000..1d7c438
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
> @@ -0,0 +1,30 @@
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
> +- reg: Memory mapped base address and length of the DWC MIPI DSI
> +  registers. (mandatory)
> +
> +- clocks: References to all the clocks specified in the clock-names property
> +  as specified in [1]. (mandatory)
> +
> +- clock-names: "pclk" is peripheral clock for either AHB and APB. (mandatory)

Seems strange there's not also a pixel or bit clock? Or this gets driven 
from the phy?

> +
> +- resets: References to all the resets specified in the reset-names property
> +  as specified in [2]. (optional)
> +
> +- reset-names: string reset name, must be "apb" if used. (optional)
> +
> +- panel or bridge node: see [3]. (mandatory)
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/reset/reset.txt
> +[3] Documentation/devicetree/bindings/display/mipi-dsi-bus.txt
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
