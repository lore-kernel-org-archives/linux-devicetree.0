From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add Synopsys DW MIPI DSI DRM
 bridge driver
Date: Tue, 6 Jun 2017 10:00:29 +0200
Message-ID: <c7770778-3132-12f9-1293-f1ced0e3b4e9@baylibre.com>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-3-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496414235-20098-3-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Yao <mark.yao@rock-chips.>
Cc: Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/02/2017 04:37 PM, Philippe CORNU wrote:
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
---------------------------------------/\

I'm not sure about this one, and it's already here in the dw_hdmi.txt text.


> +by itself but is meant to be referenced by platform-specific device tree
> +bindings.
> +
> +When referenced from platform device tree bindings the properties defined in
> +this document are defined as follows. The platform device tree bindings are
> +responsible for defining whether each property is required or optional.
> +
> +- reg: Memory mapped base address and length of the DWC MIPI DSI
> +  registers. (mandatory)
-------------------/\

Why do you specify the mandatory/optional here since it's written it's the
responsibility of the platform bindings ?

> +
> +- clocks: References to all the clocks specified in the clock-names property
> +  as specified in [1]. (mandatory)
> +
> +- clock-names: "pclk" is peripheral clock for either AHB and APB. (mandatory)
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
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
