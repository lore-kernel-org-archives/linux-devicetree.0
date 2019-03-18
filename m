From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 2/4] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Date: Mon, 18 Mar 2019 15:10:04 +0000
Message-ID: <AM0PR04MB421102D948A6972B8A19C78880470@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-3-git-send-email-aisheng.dong@nxp.com>
 <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <155112397472.191923.18309287020361500256@swboyd.mtv.corp.google.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[...]

> > diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > index 965cfa4..a317844 100644
> > --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> > @@ -11,6 +11,20 @@ enabled by these control bits, it might still not
> > be running based  on the base resource.
> >
> >  Required properties:
> > +- compatible:          Should be one of:
> > +                         "fsl,imx8qxp-lpcg"
> > +                         "fsl,imx8qm-lpcg" followed by
> "fsl,imx8qxp-lpcg".
> > +- reg:                 Address and length of the register set.
> > +- #clock-cells:                Should be 1. One LPCG supports multiple
> clocks.
> > +- clocks:              Input parent clocks phandle array for each clock.
> > +- bit-offset:          An integer array indicating the bit offset for each
> clock.
> > +- hw-autogate:         Boolean array indicating whether supports HW
> autogate for
> > +                       each clock.
> 
> This looks like one clk per node style of bindings which is a direction we don't
> want DT bindings to go in. It leads to a bunch of time parsing DT to generate
> clks and in general doesn't represent the clock controller hardware that is
> there. Basically, anything with 'bit-offset'
> in the binding is not going to be acceptable.
> 

This is not one clk per node but one clock controller per node which strictly
describes the HW.

On MX8, each LPCG is a separate clock controller which can control a couple of
clock output gates for one specific device to use. Each device has a corresponding
LPCG clock controller and those LPCGs are independent with each other with
separate IO space.

Those LPCGs are distributed in various SS (subsystems) along with device resources.
Describing them in device tree SS dtsi doesn't seem to be an issue as it is representing
the real hardware.

For SCU clocks, they're similar case that each SS having separate clock controllers
In HW which are managed by SCU firmware. So it seems also okay to put them
in device tree SS dtsi file, right?

If you're concerning each node having one compatible string, how about doing like
many power domain does as below?

Having only one compatible string in clock parent nodes.

//LSIO SS
lsio_scu_clk: lsio-scu-clock-controller {
        compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";

        fspi0_clk: clock-fspi0{
                #clock-cells = <0>;
                rsrc-id = <IMX_SC_R_FSPI_0>;
                clk-type = <IMX_SC_PM_CLK_PER>;
                power-domains = <&pd IMX_SC_R_FSPI_0>;
        };
		
		fspi1_clk: clock-fspi1{
			...
		};
        ...
};    

/* LPCG clocks */
lsio_lpcg_clk: lsio-lpcg-clock-controller {
        compatible = "fsl,imx8qxp-lpcg";

        pwm0_lpcg: clock-controller@5d400000 {
                reg = <0x5d400000 0x10000>;
                #clock-cells = <1>;
                clocks = <&pwm0_clk>, <&pwm0_clk>, <&pwm0_clk>,
                         <&lsio_bus_clk>, <&pwm0_clk>;
                bit-offset = <0 4 16 20 24>;
                clock-output-names = "pwm0_lpcg_ipg_clk",
                                     "pwm0_lpcg_ipg_hf_clk",
                                     "pwm0_lpcg_ipg_s_clk",
                                     "pwm0_lpcg_ipg_slv_clk",
                                     "pwm0_lpcg_ipg_mstr_clk";
                power-domains = <&pd IMX_SC_R_PWM_0>;
                status = "disabled";
        };
        ...
};

I also have spent a lot time to investigate how TI and Samsung does. However, 
finally i.MX is still different and I still believe current way is better for i.MX,
mainly due to below reasons:

1) IMX having separate clock controllers in HW, not shared one like others
2) IMX SoC is comprised of various HW SS (Subsystem) while others don't have.
  Describing clocks in DT can help a better SW architecture to describe HW.
3) Each clock is associated with a power domain. DT is the best place to indicate it.
4) Clock availability (Both SCU and LPCG) are configurable according to
  different HW partition configuration by SCU firmware.
  Defining them all in driver will cause annoying and continued churn in driver
  all the time when adding new SoC support.
  e.g. 
  Handling availability for different SS in different SoC.
  Defining Clock IDs for diferent SS in different SoC for same clocks.

By putting clocks in DT, we can make the clock driver completely generic and
no more churn in the driver anymore in the future for adding new SoC support.
It can significantly save the driver maintain effort.

Last, this won't break compatibility. It's just introduce a new binding.

Regards
Dong Aisheng

> > +- clock-output-names:  Shall be the corresponding names of the outputs.
> > +                       NOTE this property must be specified in the
> same order
> > +                       as the clock bit-offset and hw-autogate property.
> > +
> > +Legacy binding (DEPRECATED):
> >  - compatible:  Should be one of:
> >                   "fsl,imx8qxp-lpcg-adma",
