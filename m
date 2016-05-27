From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt: binding: Add Qualcomm WCNSS control binding
Date: Thu, 26 May 2016 22:58:26 -0500
Message-ID: <CAL_JsqLBF+r4JyG5r_WdFOUDPk0BVW-o6rnFa+twztOUtmh2yg@mail.gmail.com>
References: <1463095068-32225-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463095068-32225-1-git-send-email-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+dt list

On Thu, May 12, 2016 at 6:17 PM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This binding describes the control interface for the Qualcomm WCNSS.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>
> Changes since v1:
> - Introduce reference to wcnss block node for register block definition
> - Use wcnss block node compatible for hw version detection (riva vs pronto)
> - Clean up compatible name for bt node
>
>  .../devicetree/bindings/soc/qcom/qcom,wcnss.txt    | 115 +++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> new file mode 100644
> index 000000000000..5413098a1e1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> @@ -0,0 +1,115 @@
> +Qualcomm WCNSS Binding
> +
> +This binding describes the Qualcomm WCNSS hardware. It consists of control
> +block and a BT, WiFi and FM radio block, all useing SMD as command channels.

s/useing/using/

> +
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: must be: "qcom,wcnss",
> +
> +- qcom,smd-channel:
> +       Usage: required
> +       Value type: <string>
> +       Definition: standard SMD property specifying the SMD channel used for
> +                   communication with the WiFi firmware

Is the string value defined somewhere?

> +
> +- qcom,mmio:
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: reference to a node specifying the wcnss "ccu" and "dxe"
> +                   register blocks. The node must be compatible with one of
> +                   the following:
> +                   "qcom,riva",
> +                   "qcom,pronto"
> +
> += SUBNODES
> +The subnodes of the wcnss node are optional and describe the individual blocks in
> +the WCNSS.
> +
> +== Bluetooth
> +The following properties are defined to the bluetooth node:
> +
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: must be:
> +                   "qcom,wcnss-bt"
> +
> +== WiFi
> +The following properties are defined to the WiFi node:
> +
> +- compatible:
> +       Usage: required
> +       Value type: <string>
> +       Definition: must be one of:
> +                   "qcom,wcnss-wlan",
> +
> +- interrupts:
> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: should specify the "rx" and "tx" interrupts
> +
> +- interrupt-names:
> +       Usage: required
> +       Value type: <stringlist>
> +       Definition: must contain "rx" and "tx"
> +
> +- qcom,state:

This is kind of generic.

> +       Usage: required
> +       Value type: <prop-encoded-array>
> +       Definition: should reference the tx-enable and tx-rings-empty SMEM states
> +
> +- qcom,state-names:
> +       Usage: required
> +       Value type: <stringlist>
> +       Definition: must contain "tx-enable" and "tx-rings-empty"
> +
> += EXAMPLE
> +The following example represents a SMD node, with one edge representing the
> +"pronto" subsystem, with the wcnss device and its wcn3680 BT and WiFi blocks
> +described; as found on the 8974 platform.

So somewhere in here I'd expect to see 8974 in a compatible string.

> +
> +smd {
> +       compatible = "qcom,smd";
> +
> +       pronto {
> +               interrupts = <0 142 1>;
> +
> +               qcom,ipc = <&apcs 8 17>;
> +               qcom,smd-edge = <6>;
> +
> +               wcnss {
> +                       compatible = "qcom,wcnss";
> +                       qcom,smd-channels = "WCNSS_CTRL";
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       qcom,wcnss = <&pronto>;

Not documented and poorly named. The property name should reflect what
this is for or points too.

> +
> +                       bt {
> +                               compatible = "qcom,wcnss-bt";
> +                       };
> +
> +                       wlan {
> +                               compatible = "qcom,wcnss-wlan";
> +
> +                               interrupts = <0 145 0>, <0 146 0>;
> +                               interrupt-names = "tx", "rx";
> +
> +                               qcom,state = <&apps_smsm 10>, <&apps_smsm 9>;
> +                               qcom,state-names = "tx-enable", "tx-rings-empty";
> +                       };
> +               };
> +       };
> +};
> +
> +soc {
> +       pronto: pronto {

2 pronto nodes? That's confusing...

> +               compatible = "qcom,pronto";
> +
> +               reg = <0xfb204000 0x2000>, <0xfb202000 0x1000>, <0xfb21b000 0x3000>;
> +               reg-names = "ccu", "dxe", "pmu";
> +       };
> +};
> --
> 2.5.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
