From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: dtc issue with overlays starting in next-20171009
Date: Wed, 18 Oct 2017 10:58:03 -0500
Message-ID: <CANk1AXQaXKud2Mic_879JiS39hJB4y0uTS2w1uxXje-0mO68Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

I've noticed a problem compiling DT overlays and traced it back to
beginning in next-20171009

That tag adds the following in scripts/dtc

e9480c1 2017-10-09 16:17:32 +0100 : Mark Brown : Merge remote-tracking
branch 'devicetree/for-next'
4201d05 2017-10-03 15:03:47 -0500 : Rob Herring : scripts/dtc: Update
to upstream version v1.4.5-3-gb1a60033c110
4322323 2017-10-03 15:03:46 -0500 : Rob Herring : scripts/dtc: add
fdt_overlay.c and fdt_addresses.c to sync script

The error is:

dtc: /home/atull/repos/linux-socfpga/scripts/dtc/livetree.c:543:
get_node_by_phandle: Assertion `(phandle != 0) && (phandle != -1)'
failed.
arch/arm/boot/dts/socfpga_overlay.dtb: Warning (clocks_property):
Could not get phandle node for
/fragment@0/__overlay__/gpio@10040:clocks(cell 0)
Aborted (core dumped)
scripts/Makefile.lib:316: recipe for target
'arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc_ghrd_ovl_ext_cfg.dtb'
failed
make[2]: *** [arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc_ghrd_ovl_ext_cfg.dtb]
Error 134
arch/arm/Makefile:346: recipe for target 'dtbs' failed

Here's a simplified overlay that gets this error.  Taking out the line
"interrupt-parent = <&intc>;" fixes the build.

/dts-v1/;
/plugin/;
/ {
        fragment@0 {
                target-path = "/soc/base_fpga_region";
                #address-cells = <1>;
                #size-cells = <1>;

                __overlay__ {
                        ranges = <0x00000000 0x00000000 0xc0000000 0x00040000>,
                                 <0x00000001 0x00000000 0xff200000 0x00001000>;

                        external-fpga-config;

                        #address-cells = <2>;
                        #size-cells = <1>;

                        fpga_pr_region0 {
                                compatible = "fpga-region";
                                fpga-bridges = <&freeze_controller_0>;
                                ranges;
                        };

                        freeze_controller_0: freeze_controller@0x100000450 {
                                compatible = "altr,freeze-bridge-controller";
                                reg = <0x00000001 0x00000450 0x00000010>;
                                interrupt-parent = <&intc>;  /* <--
remove to fix build */
                                interrupts = <0 21 4>;
                        };
                };
        };
};

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
