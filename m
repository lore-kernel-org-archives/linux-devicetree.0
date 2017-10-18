From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: dtc issue with overlays starting in next-20171009
Date: Wed, 18 Oct 2017 12:33:52 -0700
Message-ID: <59E7ACA0.7030809@gmail.com>
References: <CANk1AXQaXKud2Mic_879JiS39hJB4y0uTS2w1uxXje-0mO68Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANk1AXQaXKud2Mic_879JiS39hJB4y0uTS2w1uxXje-0mO68Vw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-fpga@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Alan,

On 10/18/17 08:58, Alan Tull wrote:
> Hi Rob,
> 
> I've noticed a problem compiling DT overlays and traced it back to
> beginning in next-20171009
> 
> That tag adds the following in scripts/dtc
> 
> e9480c1 2017-10-09 16:17:32 +0100 : Mark Brown : Merge remote-tracking
> branch 'devicetree/for-next'
> 4201d05 2017-10-03 15:03:47 -0500 : Rob Herring : scripts/dtc: Update
> to upstream version v1.4.5-3-gb1a60033c110
> 4322323 2017-10-03 15:03:46 -0500 : Rob Herring : scripts/dtc: add
> fdt_overlay.c and fdt_addresses.c to sync script
> 
> The error is:
> 
> dtc: /home/atull/repos/linux-socfpga/scripts/dtc/livetree.c:543:
> get_node_by_phandle: Assertion `(phandle != 0) && (phandle != -1)'
> failed.
> arch/arm/boot/dts/socfpga_overlay.dtb: Warning (clocks_property):
> Could not get phandle node for
> /fragment@0/__overlay__/gpio@10040:clocks(cell 0)
> Aborted (core dumped)
> scripts/Makefile.lib:316: recipe for target
> 'arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc_ghrd_ovl_ext_cfg.dtb'
> failed
> make[2]: *** [arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc_ghrd_ovl_ext_cfg.dtb]
> Error 134
> arch/arm/Makefile:346: recipe for target 'dtbs' failed
> 
> Here's a simplified overlay that gets this error.  Taking out the line
> "interrupt-parent = <&intc>;" fixes the build.
> 
> /dts-v1/;
> /plugin/;
> / {
>         fragment@0 {
>                 target-path = "/soc/base_fpga_region";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> 
>                 __overlay__ {
>                         ranges = <0x00000000 0x00000000 0xc0000000 0x00040000>,
>                                  <0x00000001 0x00000000 0xff200000 0x00001000>;
> 
>                         external-fpga-config;
> 
>                         #address-cells = <2>;
>                         #size-cells = <1>;
> 
>                         fpga_pr_region0 {
>                                 compatible = "fpga-region";
>                                 fpga-bridges = <&freeze_controller_0>;
>                                 ranges;
>                         };
> 
>                         freeze_controller_0: freeze_controller@0x100000450 {
>                                 compatible = "altr,freeze-bridge-controller";
>                                 reg = <0x00000001 0x00000450 0x00000010>;
>                                 interrupt-parent = <&intc>;  /* <--
> remove to fix build */
>                                 interrupts = <0 21 4>;
>                         };
>                 };
>         };
> };
> 
> Alan

Phandle references in overlays are assigned the value of -1 (0xffffffff) in
the dtb, to be fixed up when loaded.  A new check sees this value and
triggers the assert.

It is this commit in the upstream dtc tools tree:

   commit ee3d26f6960bb5922d9a35fe266d9eac74a78ec0
   checks: add interrupts property check

There are a bunch of other new checks that call get_node_by_phandle(),
and thus could trigger the assertion.

I'm guessing that those checks would also trigger the assert if an
overlay contained something that would lead to one of the other checks
being processed.

You can avoid the problem in your example dts with "-Wno-interrupts_property"

  dtc -Wno-interrupts_property fpga_01_a.dts

The larger set of other checks that might trigger the assert is too large
for me to want to add "-Wno-" flags for all of them to the command line
(as temporary workarounds).

-Frank
