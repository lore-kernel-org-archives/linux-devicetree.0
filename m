From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v15 1/6] fpga: add bindings document for fpga area and
 fpga bus
Date: Thu, 21 Jan 2016 16:00:23 +0100
Message-ID: <CAAtXAHfkQnxZtphRyjUn6qgW=9RMpcJ_CDa4vKgzATsw_NVYWQ@mail.gmail.com>
References: <1453317867-10422-1-git-send-email-atull@opensource.altera.com>
	<1453317867-10422-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1453317867-10422-2-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Alan,

I tried getting a simple example to work with overlays, however so far
I failed getting
the child nodes to probe drivers, maybe you have an idea? The fpga
image is loaded just fine.

in dts:

               fpga_bus@0 {
                       compatible = "altr,fpga-bus", "simple-bus";
                       #address-cells = <1>;
                       #size-cells = <1>;
                       ranges;

                       fpga_mgr0: devcfg@f8007000 {
                               compatible = "xlnx,zynq-devcfg-1.0",
"simple-bus";
                               reg = <0xf8007000 0x100>;
                               interrupt-parent = <&intc>;
                               interrupts = <0 8 4>;
                               clocks = <&clkc 12>;
                               clock-names = "ref_clk";
                               syscon = <&slcr>;

                               #address-cells = <1>;
                               #size-cells = <1>;
                               ranges;
                       };
              };

overlay:

fragment@0 {
        target-path = "/amba/devcfg@f8007000";
        __overlay__ {
                #address-cells = <1>;
                #size-cells = <1>;

                area@0 {
                        compatible = "fpga-area";
                        #address-cells = <1>;
                        #size-cells = <1>;
                        ranges;

                        firmware-name = "dmac.bin";

                        axi_dma0: axidma@40000000 {
                                compatible = "xlnx,axi-dma-1.00.a";
                                reg = <0x40000000 0x10000>;
                               #dma-cells = <1>;
                               xlnx,include-sg = <1>;
                               xlnx,include-dre = <1>;
                              status = "okay";
                              [...]
                       };
                };
        };
};


I also stumbled across those while looking through the examples:

> +Example:
> +
> +/dts-v1/;
> +/plugin/;

/dts-v1/ / plugin/; the above syntax is deprecated:

Warning (deprecated_plugin_syntax): Use '/dts-v1/ /plugin/'; syntax.
/dts-v1/; /plugin/; is going to be removed in next versions

> +Device Tree Example: Partial Reconfiguration with no Bridges
> +============================================================
> +
> +Live Device Tree contains:
> +       fpgamgr@ffd03000 {
> +               compatible = "altr,socfpga-a10-fpga-mgr", "simple-bus";
> +               clocks = <&l4_mp_clk>;
> +               resets = <&rst FPGAMGR_RESET>;
> +               reset-names = "fpgamgr";
> +               reg = <0xffd03000 0x1000
> +                      0xffcfe400 0x1000>;
> +
> +               #address-cells = <0x1>;
> +               #size-cells = <0x1>;
> +               ranges;
> +       };
> +
> +DT Overlay contains:
> +/dts-v1/;
> +/plugin/;

see above

Cheers,

Moritz
