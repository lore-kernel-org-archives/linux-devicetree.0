From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: Multiple generic PHY instances for DWC3 USB IP
Date: Wed, 04 Apr 2018 08:36:53 +0300
Message-ID: <87vad7cz2i.fsf@linux.intel.com>
References: <CAK7LNATkS6pFQ9Gexm1uiG8e-3x6QXh-GYs3ABVEQzBnFK5gqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATkS6pFQ9Gexm1uiG8e-3x6QXh-GYs3ABVEQzBnFK5gqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-usb@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hi,

Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> Currently, DWC3 core IP (drivers/usb/dwc3/core.c)
> can take only one PHY phandle for each of SS, HS.
> (phy-names DT property is "usb2-phy" and "usb3-phy" for each)

We never had any other requirements :-)

> The DWC3 core IP is provided by Synopsys,
> but some SoC-dependent parts (a.k.a glue-layer)
> are implemented by SoC venders.
>
> The number of connected PHY instances are SoC-dependent.
>
> If you look at generic drivers such as
>   drivers/usb/host/ehci-platform.c
> the driver can handle arbitrary number of PHY instances.
>
> However, as mentioned above, DWC3 core allows only one PHY phandle
> for each SS/HS.
> This can result in a strange DT structure.
>
> For example, Socionext PXs3 SoC is integrated with 2 instances of DWC3.
>
> The instance 0 of DWC3 is connected with 2 super-speed PHYs.

why 2 super-speed phys? Is this a two-port host-only implementation?

> The instance 1 of DWC3 is connected with 1 super-speed PHY.

Are both of these instances incapable of high/full/low-speed
communication?

> According to the feed-back from Felipe Balbe,
> (https://patchwork.kernel.org/patch/10180167/)
> Socionext is trying to split the glue layer into small chunks.
>
>
> The following is the DT under internal review of Socionext.
> The full DT is super long, so
> here is only snippet for the SS PHY parts.
>
>
>         [ instance 0  (with 2 SS PHYs) ]
>
>         dwc3@65a00000 {
>                 compatible = "snps,dwc3";
>                 reg = <0x65a00000 0xcd00>;
>                 interrupt-names = "host", "peripheral";
>                 interrupts = <0 134 4>, <0 135 4>;
>                 phy-names = "usb2-phy", "usb3-phy";
>                 phys = <&usb0_hsphy>, <&usb0_ssphy>;
>                 dr_mode = "host";
>         };
>
>         usb0_ssphy: ss-phy {
>                 compatible = "socionext,uniphier-pxs3-usb3-ssphy";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 #phy-cells = <0>;
>                 clock-names = "phy-clk0", "phy-clk1";
>                 clocks = <&sys_clk 17>, <&sys_clk 18>;
>                 reset-names = "phy-rst0", "phy-rst1";
>                 resets = <&sys_rst 17>, <&sys_rst 18>;
>                 port0-supply = <&usb0_vbus0>;
>                 port1-supply = <&usb0_vbus1>;
>
>                 port@0 {
>                         reg = <0>;
>                 };
>                 port@1 {
>                         reg = <1>;
>                 };
>         };
>
>         [ instance 1 (with 1 SS PHY) ]
>
>         dwc3@65c00000 {
>                 compatible = "snps,dwc3";
>                 reg = <0x65c00000 0xcd00>;
>                 interrupt-names = "host", "peripheral";
>                 interrupts = <0 137 4>, <0 138 4>;
>                 phy-names = "usb2-phy", "usb3-phy";
>                 phys = <&usb1_hsphy>, <&usb1_ssphy>;
>                 dr_mode = "host";
>         };
>
>         usb1_ssphy: ss-phy {
>                 compatible = "socionext,uniphier-pxs3-usb3-ssphy";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 #phy-cells = <0>;
>                 clock-names = "phy-clk0";
>                 clocks = <&sys_clk 21>;
>                 reset-names = "phy-rst0";
>                 resets = <&sys_rst 21>;
>                 port0-supply = <&usb1_vbus0>;
>
>                 port@0 {
>                          reg = <0>;
>                 };
>         };
>
>
> I think this is strange, but the PHY driver
> counts the number of sub-nodes ("port@0", "port@1" ...)
> and iterate the port settings.
>
>
>
>
>
> In my opinion, the structure like follows
> will be more natural.
> (flattening homogeneous PHY nodes)
>
>
>         [ instance 0 (with 2 SS PHYs)]
>
>         dwc3@65a00000 {
>                 compatible = "snps,dwc3";
>                 reg = <0x65a00000 0xcd00>;
>                 interrupt-names = "host", "peripheral";
>                 interrupts = <0 134 4>, <0 135 4>;
>                 phys = <&usb0_hsphy>, <&usb0_ssphy0>, <&usb0_ssphy1>;
>                 dr_mode = "host";
>         };
>
>         usb0_ssphy0: ss-phy0@65b00300 {
>                 compatible = "socionext,uniphier-dwc3-ssphy";
>                 reg = <0x65b00300 0x10>;
>                 #phy-cells = <0>;
>                 clocks = <&sys_clk 17>;
>                 resets = <&sys_rst 17>;
>                 port-supply = <&usb0_vbus0>;
>         };
>
>         usb0_ssphy1: ss-phy1@65b00310 {
>                 compatible = "socionext,uniphier-dwc3-ssphy";
>                 reg = <0x65b00310 0x10>;
>                 #phy-cells = <0>;
>                 clocks = <&sys_clk 18>;
>                 resets = <&sys_rst 18>;
>                 port-supply = <&usb0_vbus1>;
>         };
>
>
>
>
>         [ instance 1 (with 1 SS PHY) ]
>
>         usb0: dwc3@65c00000 {
>                 compatible = "snps,dwc3";
>                 reg = <0x65c00000 0xcd00>;
>                 interrupt-names = "host", "peripheral";
>                 interrupts = <0 137 4>, <0 138 4>;
>                 phys = <&usb1_hsphy>, <&usb1_ssphy>;
>                 dr_mode = "host";
>         };
>
>         usb1_ssphy: ss-phy@65d00300 {
>                 compatible = "socionext,uniphier-dwc3-ssphy";
>                 reg = <0x65d00300 0x10>;
>                 #phy-cells = <0>;
>                 clocks = <&sys_clk 21>;
>                 resets = <&sys_rst 21>;
>                 port0-supply = <&usb1_vbus0>;
>         };
>
>
> To achieve this, I need driver changes.
>
>
> My proposal is to support arbitrary number of PHY instances
> like ehci-platform.c does.
>
>
>
> @@ -894,8 +894,8 @@ struct dwc3 {
>         struct usb_phy          *usb2_phy;
>         struct usb_phy          *usb3_phy;
>
> -       struct phy              *usb2_generic_phy;
> -       struct phy              *usb3_generic_phy;
> +       unsigned int            num_phys;
> +       struct phy              **phys;
>
>         bool                    phys_ready;
>
>
>
> Is this OK?

I don't know, I need a bit more details about your integration :-)

-- 
balbi
