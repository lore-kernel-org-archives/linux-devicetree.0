Return-Path: <SRS0=2PS9=NM=googlemail.com=martin.blumenstingl@kernel.org>
MIME-Version: 1.0
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com> <20181030221310.GA22640@bogus>
In-Reply-To: <20181030221310.GA22640@bogus>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 1 Nov 2018 11:10:35 +0100
Message-ID: <CAFBinCDnB5GiX530eLR5fa6JEZP9GtYDhJq6S7sKMXEtMP5FHQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
Content-Type: text/plain; charset="UTF-8"
To: robh@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Tue, Oct 30, 2018 at 11:13 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Oct 28, 2018 at 01:08:56PM +0100, Martin Blumenstingl wrote:
> > The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
> > as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
> > There is a register area called "HHI" which is used for multiple IP
> > blocks of the SoC:
> > - the system clock controller
> > - a few reset lines (there is a separate reset controller, these reset
> >   lines are not part of the other reset controller). this reset
> >   controller is currently implemented in the clock controller driver
> > - a HDMI controller
>
> Does this have it's own clocks, resets or other resources?
I'm not sure what's the best way to answer this as the HDMI part is
not part of the public S805 datasheet. however, I went ahead and read
Amlogic's BSP code (see [1], [2] and [3] - beware: these files will
not make checkpatch happy ;)).
first I have to make a correction here: while looking deeper into this
the HDMI controller is *not* inside the HHI register area (but instead
on the APB bus). sorry for getting this wrong

here's how would make the .dts to look like (assuming we support all
peripherals that I know of in the HHI area):

&hhi {
    compatible = "amlogic,meson-hhi-sysctrl",
                           "simple-mfd",
                           "syscon";

    clkc: clock-controller {
        ...
    };

    hhi_power: power-controller {
        compatible = "amlogic,meson8-hhi-power-controller";
        #power-domain-cells = <1>;
    };

    hdmi_phy: phy {
        compatible = "amlogic,meson8-hdmi-phy";
        #phy-cells = <0>;
        /*
         * HHI_HDMI_PHY_CNTL0 needs a magic value based on
         * power on/off status. HHI_HDMI_PHY_CNTL1 has
         * bit[1]: enable clock, bit[0]: soft reset (maybe
         * these two should be provided by the clkc?)
         */
    };
};

&apb {
    hdmi_tx: hdmi-tx@42000 {
        compatible = "amlogic,meson8-hdmi";
        reg = <0x42000 0xc>;
        interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
        #address-cells = <1>;
        #size-cells = <0>;

        /*
         * internally the actual HDMI controller registers
         * are not accessed directly but through two special
         * (address and data) registers: HDMI_ADDR_PORT,
         * HDMI_DATA_PORT.
         */

        /*
         * there are five internal reset registers:
         * TX_SYS5_TX_SOFT_RESET_1
         * TX_SYS5_TX_SOFT_RESET_2
         * TX_SYS5_RX_SOFT_RESET_1
         * TX_SYS5_RX_SOFT_RESET_2
         * TX_SYS5_RX_SOFT_RESET_3
         */

        /*
         * TODO: this has to know a few details about the
         * audio stream as well to route the audio correctly
         * (vendor code differentiates between 2ch / 8ch and
         * programs the HDMI controller accordingly)
         */

        pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
        pinctrl-names = "default";

        /* TODO: what is VCLK1_HDMI exactly? */
        clocks = <&clkc CLKID_HDMI_PCLK>,
                 <&clkc CLKID_HDMI_SYS>,
                 <&clkc CLKID_VCLK1_HDMI>;
        clock-names = "pclk", "sys", "vclk1";

        power-domains = <&hhi_power 0>, <&hhi_power 1> ;
        power-domain-names = "edid", "hdcp";

        phys = <&hdmi_phy>;
        phy-names = "hdmi";

        /* VPU VENC Input */
        hdmi_tx_venc_port: port@0 {
            reg = <0>;

            hdmi_tx_in: endpoint {
                /*
                 * this is provided by the VPU which has
                 * many (>10) clock inputs - all connected
                 * to "clkc" above
                 */
                remote-endpoint = <&hdmi_tx_out>;
            };
        };

        /* TMDS Output */
        hdmi_tx_tmds_port: port@1 {
            reg = <1>;
        };
    };
};

&saradc {
...
    /*
     * patches for this are already sent: TSC bit[4] is
     * stored in HHI_DPLL_TOP_0 (which is right between the
     * SYS_PLL and VID_PLL registers. the PLL clocks from
     * these other registers are implemented in the driver
     * for the "clkc" node above)
     */
    amlogic,hhi-sysctrl = <&hhi>;
};


> > - temperature sensor calibration data (by "data" I really mean data,
> >   the ADC driver has four bits for the TSC data in it's own register
> >   space, however on Meson8b and Meson8m2 there is a fifth TSC bit which
> >   is stored in the HHI register area)
> >
> > The first three could be implemented with a single node (either in one
> > big driver, or using a MFD driver which would register function-
> > specific drivers).
> > However, the TSC data is a big problem, because the ADC has it's own
> > set of registers but needs to write one bit in the HHI register area.
>
> Generally, that would be solved with a phandle to the HHI and maybe an
> offset cell in the ADC node. I don't see why that's a big problem.
this is what I'm trying to do, see my dt-bindings patch for the SAR
ADC (which is used to read the temperature sensor): [0]
my understanding was that I should go through syscon to avoid double
ioremap() of the same register set (the clock controller and SAR ADC
would have to do it).
which APIs (other than syscon) would you suggest for this case?


Regards
Martin


[0] https://patchwork.kernel.org/patch/10658557/
[1] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_hw.c
[2] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/hdmi_tx_hw/hdmi_tx_reg.c
[3] https://github.com/endlessm/linux-meson/blob/3a749cb45a381fb977bae0bee36c6c1cbee32ac1/arch/arm/mach-meson8b/include/mach/register.h
