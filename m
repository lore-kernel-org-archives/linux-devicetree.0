From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/2] Dcumentation: bridge: Add documentation for ps8640 DT properties
Date: Fri, 16 Oct 2015 08:21:38 -0500
Message-ID: <CAL_JsqKMqiqwZaxnZGKo3eh6m+mE9aX8HnWkDZkSivSn1PHy2A@mail.gmail.com>
References: <1444997709-57293-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444997709-57293-1-git-send-email-ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek@list
List-Id: devicetree@vger.kernel.org

On Fri, Oct 16, 2015 at 7:15 AM, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> From: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Add documentation for DT properties supported by ps8640
> DSI-eDP converter.
>
> Signed-off-by: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/video/bridge/ps8640.txt    |   48 ++++++++++++++++++++

Please move to bindings/display/bridge/.

>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/bridge/ps8640.txt
>
> diff --git a/Documentation/devicetree/bindings/video/bridge/ps8640.txt b/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> new file mode 100644
> index 0000000..450b5df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/ps8640.txt
> @@ -0,0 +1,48 @@
> +ps8640-bridge bindings
> +
> +Required properties:
> +       - compatible: "parade,ps8640"
> +       - reg: first i2c address of the bridge
> +       - power-gpios: OF device-tree gpio specification for power pin.
> +       - reset-gpios: OF device-tree gpio specification for reset pin.
> +       - mode-sel-gpios: OF device-tree gpio specification for mode-sel pin.
> +       - ps8640-1v2-supply: OF device-tree regulator specification for 1v2.
> +       - ps8640-3v3-supply: OF device-tree regulator specification for 3v3.

As others have said, I would drop the part number and name them based
on the supply name (e.g. vdd?, vcore?).

> +
> +Optional properties:
> +       - video interfaces: Device node can contain video interface port
> +                           nodes for panel according to [1].

I don't think this should be optional.

> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +       edp-bridge@18 {
> +               compatible = "parade,ps8640";
> +               reg = <0x18>;
> +               power-gpios = <&pio 116 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&pio 115 GPIO_ACTIVE_HIGH>;
> +               mode-sel-gpios = <&pio 92 GPIO_ACTIVE_HIGH>;
> +               ps8640-1v2-supply = <&ps8640_fixed_1v2>;
> +               ps8640-3v3-supply = <&mt6397_vgp2_reg>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +
> +                               ps8640_in: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +
> +                               ps8640_out: endpoint {
> +                                       remote-endpoint = <&panel_in>;
> +                               };
> +                       };
> +               };
> +       };
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
