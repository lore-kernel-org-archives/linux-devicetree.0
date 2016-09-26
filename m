From: "Peter Senna Tschudin" <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_=5BPATCH?= V5 =?utf-8?q?2=2F4=5D?=
 =?utf-8?q?_Documentation=2Fdevicetree=2Fbindings=3A?=
 =?utf-8?q?_b850v3=5Flvds=5Fdp?=
Date: Mon, 26 Sep 2016 09:26:53 +0100
Message-ID: <33e8-57e8dc00-1-799eaa00@98390718>
References: <2add7cb9193b96211f5e5938cbfc6181c76e2591.1470739193.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
in-reply-to: <2add7cb9193b96211f5e5938cbfc6181c76e2591.1470739193.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, jslaby-AlSwsSmVLrQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Patch 1/4 is already on linux-next, but what about this one? Ping?

On Tuesday, August 9, 2016 18:41 CEST, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote: 
 
> Devicetree bindings documentation for the GE B850v3 LVDS/DP++
> display bridge.
> 
> Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> Cc: Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
> Cc: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
> Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
> Unchanged from V4
> 
> Changes from V3:
>  - 2/4 instead of 3/5
> 
> Unchanged from V2
> 
> Changes from V1:
>  - Replaced '_' by '-' in node names or compatible strings
>  - Added missing @73 to the example
> 
> 
>  .../devicetree/bindings/ge/b850v3-lvds-dp.txt      | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> 
> diff --git a/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> new file mode 100644
> index 0000000..f05c3e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
> @@ -0,0 +1,37 @@
> +Driver for GE B850v3 LVDS/DP++ display bridge
> +
> +Required properties:
> +  - compatible : should be "ge,b850v3-lvds-dp".
> +  - reg : should contain the address used to ack the interrupts.
> +  - interrupt-parent : phandle of the interrupt controller that services
> +    interrupts to the device
> +  - interrupts : one interrupt should be described here, as in
> +    <0 IRQ_TYPE_LEVEL_HIGH>.
> +  - edid-reg : should contain the address used to read edid information
> +  - port : should describe the video signal connection between the host
> +    and the bridge.
> +
> +Example:
> +
> +&mux2_i2c2 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +
> +	b850v3-lvds-dp-bridge@73  {
> +		compatible = "ge,b850v3-lvds-dp";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		reg = <0x73>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		edid-reg = <0x72>;
> +
> +		port {
> +			b850v3_dp_bridge_in: endpoint {
> +				remote-endpoint = <&lvds0_out>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.5.5
> 
 
 
 
 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
