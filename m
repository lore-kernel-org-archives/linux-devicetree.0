From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: amlogic,meson-dw-hdmi: convert
 to yaml
Date: Tue, 6 Aug 2019 09:57:27 +0200
Message-ID: <334aa018-9f90-7218-f59c-5937d483ef79@baylibre.com>
References: <20190805134319.737-1-narmstrong@baylibre.com>
 <20190805134319.737-2-narmstrong@baylibre.com>
 <CAL_JsqJPFdR6bj_XuVuEDFYhCpmhQ4pZ66egCNJH_U26tTydmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJPFdR6bj_XuVuEDFYhCpmhQ4pZ66egCNJH_U26tTydmA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/08/2019 00:15, Rob Herring wrote:
> On Mon, Aug 5, 2019 at 7:43 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Now that we have the DT validation in place, let's convert the device tree
>> bindings for the Amlogic Synopsys DW-HDMI specifics over to YAML schemas.
>>
>> The original example and usage of clock-names uses a reversed "isfr"
>> and "iahb" clock-names, the rewritten YAML bindings uses the reversed
>> instead of fixing the device trees order.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../display/amlogic,meson-dw-hdmi.txt         | 119 -------------
>>  .../display/amlogic,meson-dw-hdmi.yaml        | 160 ++++++++++++++++++
>>  2 files changed, 160 insertions(+), 119 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
>>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> 
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> new file mode 100644
>> index 000000000000..1212aa7a624f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
>> @@ -0,0 +1,160 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2019 BayLibre, SAS
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-hdmi.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Amlogic specific extensions to the Synopsys Designware HDMI Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <narmstrong@baylibre.com>
>> +
>> +description: |
>> +  The Amlogic Meson Synopsys Designware Integration is composed of
>> +  - A Synopsys DesignWare HDMI Controller IP
>> +  - A TOP control block controlling the Clocks and PHY
>> +  - A custom HDMI PHY in order to convert video to TMDS signal
>> +   ___________________________________
>> +  |            HDMI TOP               |<= HPD
>> +  |___________________________________|
>> +  |                  |                |
>> +  |  Synopsys HDMI   |   HDMI PHY     |=> TMDS
>> +  |    Controller    |________________|
>> +  |___________________________________|<=> DDC
>> +
>> +  The HDMI TOP block only supports HPD sensing.
>> +  The Synopsys HDMI Controller interrupt is routed through the
>> +  TOP Block interrupt.
>> +  Communication to the TOP Block and the Synopsys HDMI Controller is done
>> +  via a pair of dedicated addr+read/write registers.
>> +  The HDMI PHY is configured by registers in the HHI register block.
>> +
>> +  Pixel data arrives in "4:4:4" format from the VENC block and the VPU HDMI mux
>> +  selects either the ENCI encoder for the 576i or 480i formats or the ENCP
>> +  encoder for all the other formats including interlaced HD formats.
>> +
>> +  The VENC uses a DVI encoder on top of the ENCI or ENCP encoders to generate
>> +  DVI timings for the HDMI controller.
>> +
>> +  Amlogic Meson GXBB, GXL and GXM SoCs families embeds the Synopsys DesignWare
>> +  HDMI TX IP version 2.01a with HDCP and I2C & S/PDIF
>> +  audio source interfaces.
>> +
>> +  The following table lists for each supported model the port number
>> +  corresponding to each HDMI output and input.
>> +
>> +                  Port 0                 Port 1
>> +  -----------------------------------------
>> +   S905 (GXBB)   VENC Input    TMDS Output
>> +   S905X (GXL)   VENC Input    TMDS Output
>> +   S905D (GXL)   VENC Input    TMDS Output
>> +   S912 (GXM)      VENC Input  TMDS Output
>> +   S905X2 (G12A)       VENC Input      TMDS Output
>> +   S905Y2 (G12A)       VENC Input      TMDS Output
>> +   S905D2 (G12A)       VENC Input      TMDS Output
> 
> Does this ever change?

Not for this one, I could remove the table and add the description
in port@0 and port@1.

> 
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - amlogic,meson-gxbb-dw-hdmi # GXBB (S905)
>> +              - amlogic,meson-gxl-dw-hdmi # GXL (S905X, S905D)
>> +              - amlogic,meson-gxm-dw-hdmi # GXM (S912)
>> +          - const: amlogic,meson-gx-dw-hdmi
>> +      - enum:
>> +          - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: isfr
>> +      - const: iahb
>> +      - const: venci
>> +
>> +  resets:
>> +    minItems: 3
>> +
>> +  reset-names:
>> +    items:
>> +      - const: hdmitx_apb
>> +      - const: hdmitx
>> +      - const: hdmitx_phy
>> +
>> +  hdmi-supply:
>> +    description: phandle to an external 5V regulator to power the HDMI logic
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  port@0:
>> +    type: object
>> +    description:
>> +      A port node modeled using the OF graph
>> +      bindings specified in Documentation/devicetree/bindings/graph.txt.
> 
> Would be better to say this is the VENC (or ...? input and drop the
> reference (as I expect graph.txt will be replaced with graph.yaml).

Yes

> 
>> +
>> +  port@1:
>> +    type: object
>> +    description:
>> +      A port node modeled using the OF graph
>> +      bindings specified in Documentation/devicetree/bindings/graph.txt.
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - port@0
>> +  - port@1
>> +  - "#address-cells"
>> +  - "#size-cells"
> 
> Should be able to add an 'additionalProperties: false' here.

Ok

> 
>> +
>> +examples:
>> +  - |
>> +    hdmi_tx: hdmi-tx@c883a000 {
>> +        compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
>> +        reg = <0xc883a000 0x1c>;
>> +        interrupts = <57>;
>> +        resets = <&reset_apb>, <&reset_hdmitx>, <&reset_hdmitx_phy>;
>> +        reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
>> +        clocks = <&clk_isfr>, <&clk_iahb>, <&clk_venci>;
>> +        clock-names = "isfr", "iahb", "venci";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        /* VPU VENC Input */
>> +        hdmi_tx_venc_port: port@0 {
>> +            reg = <0>;
>> +
>> +            hdmi_tx_in: endpoint {
>> +                remote-endpoint = <&hdmi_tx_out>;
>> +            };
>> +        };
>> +
>> +        /* TMDS Output */
>> +        hdmi_tx_tmds_port: port@1 {
>> +             reg = <1>;
>> +
>> +             hdmi_tx_tmds_out: endpoint {
>> +                 remote-endpoint = <&hdmi_connector_in>;
>> +             };
>> +        };
>> +    };
>> +
>> --
>> 2.22.0
>>
