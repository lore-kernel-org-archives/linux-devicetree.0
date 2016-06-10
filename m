From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V2 3/5] Documentation/devicetree/bindings: b850v3_lvds_dp
Date: Fri, 10 Jun 2016 14:54:42 -0400
Message-ID: <CABxcv==XNwojaj6cF0-HTVOpsdcWSCdcOKEow=Ajebdxvz0y4Q@mail.gmail.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
	<cover.1465486875.git.peter.senna@collabora.com>
	<59c49951b95b0eb5b34eede6cfce526e72bc2443.1465486875.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59c49951b95b0eb5b34eede6cfce526e72bc2443.1465486875.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, akpm <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, jslaby-AlSwsSmVLrQ@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, martin.donnelly-JJi787mZWgc@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, Mauro Carvalho Chehab <mchehab@osg.>
List-Id: devicetree@vger.kernel.org

Hello Peter,

On Thu, Jun 9, 2016 at 12:25 PM, Peter Senna Tschudin
<peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> Devicetree bindings documentation for the GE B850v3 LVDS/DP++
> display bridge.
>
> Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
> Changes from V1:
>  - Replaced '_' by '-' in node names or compatible strings
>  - Added missing @73 to the example
>
>  .../devicetree/bindings/ge/b850v3_lvds_dp.txt      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
>
> diff --git a/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt b/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
> new file mode 100644
> index 0000000..46bbea9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ge/b850v3_lvds_dp.txt
> @@ -0,0 +1,38 @@
> +Driver for GE B850v3 LVDS/DP++ display bridge
> +
> +Required properties:
> +  - compatible : should be "ge,b850v3_lvds_dp".

It seems you forgot to replace '_' by '-' (you did in the example though)

> +  - reg : should contain the address used to ack the interrupts.
> +  - interrupt-parent : should link to the gpio used as interrupt
> +    source on the host.

Is the interrupt parent always a GPIO controller since that is what
this description says.

Shouldn't be instead something like instead?

interrupt-parent: phandle of the interrupt controller that services
interrupts to the device

> +  - interrupts : one interrupt should be described here, as in
> +    <0 IRQ_TYPE_LEVEL_HIGH>.
> +  - edid-reg : should contain the address used to read edid information
> +  - port : should describe the vide signal connection between the host

s/vide/video

> +    and the bridge.
> +
> +Example:
> +
> +&mux2_i2c2 {
> +       status = "okay";
> +       clock-frequency = <100000>;
> +
> +       b850v3-lvds-dp-bridge@73  {
> +               compatible = "ge,b850v3-lvds-dp";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               reg = <0x73>;
> +               interrupt-parent = <&gpio2>;
> +               interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +               edid-reg = <0x72>;
> +
> +               port@0 {
> +                       reg = <0>;

AFAIU a unit-address and reg property for ports are only needed if you
have more than one port according to
Documentation/devicetree/bindings/graph.txt and
Documentation/devicetree/bindings/media/video-interfaces.txt.

> +                       b850v3_dp_bridge_in: endpoint {
> +                               remote-endpoint = <&lvds0_out>;
> +                       };
> +               };
> +       };
> +};
> --

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
