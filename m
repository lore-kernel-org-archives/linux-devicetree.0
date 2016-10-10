From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 16/18] dt-bindings: Document img,boston-clock binding
Date: Mon, 10 Oct 2016 08:01:21 -0500
Message-ID: <20161010130121.GA31827@rob-hp-laptop>
References: <20161005171824.18014-1-paul.burton@imgtec.com>
 <20161005171824.18014-17-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161005171824.18014-17-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 05, 2016 at 06:18:22PM +0100, Paul Burton wrote:
> Add device tree binding documentation for the clocks provided by the
> MIPS Boston development board from Imagination Technologies, and a
> header file describing the available clocks for use by device trees &
> driver.
> 
> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> ---
> 
> Changes in v3: None
> Changes in v2:
> - Add BOSTON_CLK_INPUT to expose the input clock.
> 
>  .../devicetree/bindings/clock/img,boston-clock.txt | 27 ++++++++++++++++++++++
>  include/dt-bindings/clock/boston-clock.h           | 14 +++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/img,boston-clock.txt
>  create mode 100644 include/dt-bindings/clock/boston-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> new file mode 100644
> index 0000000..c01ea60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> @@ -0,0 +1,27 @@
> +Binding for Imagination Technologies MIPS Boston clock sources.
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : Should be "img,boston-clock".
> +- #clock-cells : Should be set to 1.
> +  Values available for clock consumers can be found in the header file:
> +    <dt-bindings/clock/boston-clock.h>
> +- regmap : Phandle to the Boston platform register system controller.
> +  This should contain a phandle to the system controller node covering the
> +  platform registers provided by the Boston board.

Can you just make the clock node a child of the system controller and 
drop this?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
