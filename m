From: Craig Tatlor <ctatlor97@gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add sdm660 pinctrl driver
Date: Sun, 12 Aug 2018 08:18:19 +0100
Message-ID: <4A3869BF-2069-409A-B291-427971AF89FA@gmail.com>
References: <20180811162520.11641-1-ctatlor97@gmail.com> <2202961.SmUWKIdeCe@debian64>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2202961.SmUWKIdeCe@debian64>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11 August 2018 18:27:43 BST, Christian Lamparter <chunkeey@gmail=2Ecom>=
 wrote:
>On Saturday, August 11, 2018 6:25:19 PM CEST Craig Tatlor wrote:
>> Add initial pinctrl driver to support pin configuration with
>> pinctrl framework for sdm660=2E
>> Based off CAF implementation=2E
>>=20
>> Signed-off-by: Craig Tatlor <ctatlor97@gmail=2Ecom>
>> ---
>>=20
>> diff --git
>a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl=2Etxt
>b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl=2Etxt
>> new file mode 100644
>> index 000000000000=2E=2E85e6c6c17c04
>> --- /dev/null
>> +++
>b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl=2Etxt
>> @@ -0,0 +1,195 @@
>> +Qualcomm Technologies, Inc=2E SDM660 TLMM block
>> +
>> +This binding describes the Top Level Mode Multiplexer block found in
>the
>> +SDM660 platform=2E
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: must be "qcom,sdm660-pinctrl"
>> +
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: the base address and size of the TLMM register space=2E
>> +
>> +- interrupts:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: should specify the TLMM summary IRQ=2E
>> +
>> +- interrupt-controller:
>> +	Usage: required
>> +	Value type: <none>
>> +	Definition: identifies this node as an interrupt controller
>> +
>> +- #interrupt-cells:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: must be 2=2E Specifying the pin number and flags, as
>defined
>> +		    in <dt-bindings/interrupt-controller/irq=2Eh>
>> +
>> +- gpio-controller:
>> +	Usage: required
>> +	Value type: <none>
>> +	Definition: identifies this node as a gpio controller
>> +
>> +- #gpio-cells:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: must be 2=2E Specifying the pin number and flags, as
>defined
>> +		    in <dt-bindings/gpio/gpio=2Eh>
>> +
>> +Please refer to =2E=2E/gpio/gpio=2Etxt and
>=2E=2E/interrupt-controller/interrupts=2Etxt for
>> +a general description of GPIO and interrupt bindings=2E
>You want to specify gpio-ranges here as well=2E The property is explained
>in Section "2=2E1) gpio- and pin-controller interaction" in
>=2E=2E/gpio/gpio=2Etxt
>
>Without it, the gpio-hogs construct (part of =2E=2E/gpio/gpio=2Etxt) will
>cause
>the driver to fail during boot=2E (try it, ;-) )
Would gpio-ranges make sense for this, as the gpio and pinctrl are in same=
 block?
Seems no other qcom pinctrl drivers have it and I'm able to boot without i=
t=2E
>
>> +Please refer to pinctrl-bindings=2Etxt in this directory for details
>of the
>> +common pinctrl bindings used by client devices, including the
>meaning of the
>> +phrase "pin configuration node"=2E
>> +
>> +The pin configuration nodes act as a container for an arbitrary
>number of
>> +subnodes=2E Each of these subnodes represents some desired
>configuration for a
>> +pin, a group, or a list of pins or groups=2E This configuration can
>include the
>> +mux function to select on those pin(s)/group(s), and various pin
>configuration
>> +parameters, such as pull-up, drive strength, etc=2E
>> +
>> +
>> +PIN CONFIGURATION NODES:
>> +
>> +The name of each subnode is not important; all subnodes should be
>enumerated
>> +and processed purely based on their content=2E
>> +
>> +Each subnode only affects those parameters that are explicitly
>listed=2E In
>> +other words, a subnode that lists a mux function but no pin
>configuration
>> +parameters implies no information about any pin configuration
>parameters=2E
>> +Similarly, a pin subnode that describes a pullup parameter implies
>no
>> +information about e=2Eg=2E the mux function=2E
>> +
>> +
>> +The following generic properties as defined in pinctrl-bindings=2Etxt
>are valid
>> +to specify in a pin configuration subnode:
>> +
>> +- pins:
>> +	Usage: required
>> +	Value type: <string-array>
>> +	Definition: List of gpio pins affected by the properties specified
>in
>> +		    this subnode=2E  Valid pins are:
>> +		    gpio0-gpio149,
>> +		        Supports mux, bias and drive-strength
>> +		    sdc1_clk, sdc1_cmd, sdc1_data sdc2_clk, sdc2_cmd, sdc2_data
>sdc1_rclk,
>> +		        Supports bias and drive-strength
>> +
>> +- function:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: Specify the alternative function to be configured for
>the
>> +		    specified pins=2E Functions are only valid for gpio pins=2E
>> +		    Valid values are:
>> +
>> +		    blsp_uart1, blsp_spi1, blsp_i2c1, blsp_uim1, atest_tsens,
>> +		    bimc_dte1, dac_calib0, blsp_spi8, blsp_uart8, blsp_uim8,
>> +		    qdss_cti_trig_out_b, bimc_dte0, dac_calib1,
>qdss_cti_trig_in_b,
>> +		    dac_calib2, atest_tsens2, atest_usb1, blsp_spi10, blsp_uart10,
>> +		    blsp_uim10, atest_bbrx1, atest_usb13, atest_bbrx0,
>atest_usb12,
>> +		    mdp_vsync, edp_lcd, blsp_i2c10, atest_gpsadc1, atest_usb11,
>> +		    atest_gpsadc0, edp_hot, atest_usb10, m_voc, dac_gpio,
>atest_char,
>> +		    cam_mclk, pll_bypassnl, qdss_stm7, blsp_i2c8,
>qdss_tracedata_b,
>> +		    pll_reset, qdss_stm6, qdss_stm5, qdss_stm4, atest_usb2,
>cci_i2c,
>> +		    qdss_stm3, dac_calib3, atest_usb23, atest_char3, dac_calib4,
>> +		    qdss_stm2, atest_usb22, atest_char2, qdss_stm1, dac_calib5,
>> +		    atest_usb21, atest_char1, dbg_out, qdss_stm0, dac_calib6,
>> +		    atest_usb20, atest_char0, dac_calib10, qdss_stm10,
>> +		    qdss_cti_trig_in_a, cci_timer4, blsp_spi6, blsp_uart6,
>blsp_uim6,
>> +		    blsp2_spi, qdss_stm9, qdss_cti_trig_out_a, dac_calib11,
>> +		    qdss_stm8, cci_timer0, qdss_stm13, dac_calib7, cci_timer1,
>> +		    qdss_stm12, dac_calib8, cci_timer2, blsp1_spi, qdss_stm11,
>> +		    dac_calib9, cci_timer3, cci_async, dac_calib12, blsp_i2c6,
>> +		    qdss_tracectl_a, dac_calib13, qdss_traceclk_a, dac_calib14,
>> +		    dac_calib15, hdmi_rcv, dac_calib16, hdmi_cec, pwr_modem,
>> +		    dac_calib17, hdmi_ddc, pwr_nav, dac_calib18, pwr_crypto,
>> +		    dac_calib19, hdmi_hot, dac_calib20, dac_calib21, pci_e0,
>> +		    dac_calib22, dac_calib23, dac_calib24, tsif1_sync,
>dac_calib25,
>> +		    sd_write, tsif1_error, blsp_spi2, blsp_uart2, blsp_uim2,
>> +		    qdss_cti, blsp_i2c2, blsp_spi3, blsp_uart3, blsp_uim3,
>blsp_i2c3,
>> +		    uim3, blsp_spi9, blsp_uart9, blsp_uim9, blsp10_spi, blsp_i2c9,
>> +		    blsp_spi7, blsp_uart7, blsp_uim7, qdss_tracedata_a, blsp_i2c7,
>> +		    qua_mi2s, gcc_gp1_clk_a, ssc_irq, uim4, blsp_spi11,
>blsp_uart11,
>> +		    blsp_uim11, gcc_gp2_clk_a, gcc_gp3_clk_a, blsp_i2c11,
>cri_trng0,
>> +		    cri_trng1, cri_trng, qdss_stm18, pri_mi2s, qdss_stm17,
>blsp_spi4,
>> +		    blsp_uart4, blsp_uim4, qdss_stm16, qdss_stm15, blsp_i2c4,
>> +		    qdss_stm14, dac_calib26, spkr_i2s, audio_ref, lpass_slimbus,
>> +		    isense_dbg, tsense_pwm1, tsense_pwm2, btfm_slimbus, ter_mi2s,
>> +		    qdss_stm22, qdss_stm21, qdss_stm20, qdss_stm19, gcc_gp1_clk_b,
>> +		    sec_mi2s, blsp_spi5, blsp_uart5, blsp_uim5, gcc_gp2_clk_b,
>> +		    gcc_gp3_clk_b, blsp_i2c5, blsp_spi12, blsp_uart12, blsp_uim12,
>> +		    qdss_stm25, qdss_stm31, blsp_i2c12, qdss_stm30, qdss_stm29,
>> +		    tsif1_clk, qdss_stm28, tsif1_en, tsif1_data, sdc4_cmd,
>qdss_stm27,
>> +		    qdss_traceclk_b, tsif2_error, sdc43, vfr_1, qdss_stm26,
>tsif2_clk,
>> +		    sdc4_clk, qdss_stm24, tsif2_en, sdc42, qdss_stm23,
>qdss_tracectl_b,
>> +		    sd_card, tsif2_data, sdc41, tsif2_sync, sdc40, mdp_vsync_p_b,
>> +		    ldo_en, mdp_vsync_s_b, ldo_update, blsp11_uart_tx_b,
>blsp11_uart_rx_b,
>> +		    blsp11_i2c_sda_b, prng_rosc, blsp11_i2c_scl_b, uim2, uim1,
>uim_batt,
>> +		    pci_e2, pa_indicator, adsp_ext, ddr_bist, qdss_tracedata_11,
>> +		    qdss_tracedata_12, modem_tsync, nav_dr, nav_pps, pci_e1,
>gsm_tx,
>> +		    qspi_cs, ssbi2, ssbi1, mss_lte, qspi_clk, qspi0, qspi1, qspi2,
>qspi3,
>> +		    gpio
>> +
>> +- bias-disable:
>> +	Usage: optional
>> +	Value type: <none>
>> +	Definition: The specified pins should be configued as no pull=2E
>> +
>> +- bias-pull-down:
>> +	Usage: optional
>> +	Value type: <none>
>> +	Definition: The specified pins should be configued as pull down=2E
>> +
>> +- bias-pull-up:
>> +	Usage: optional
>> +	Value type: <none>
>> +	Definition: The specified pins should be configued as pull up=2E
>> +
>> +- output-high:
>> +	Usage: optional
>> +	Value type: <none>
>> +	Definition: The specified pins are configured in output mode,
>driven
>> +		    high=2E
>> +		    Not valid for sdc pins=2E
>> +
>> +- output-low:
>> +	Usage: optional
>> +	Value type: <none>
>> +	Definition: The specified pins are configured in output mode,
>driven
>> +		    low=2E
>> +		    Not valid for sdc pins=2E
>> +
>> +- drive-strength:
>> +	Usage: optional
>> +	Value type: <u32>
>> +	Definition: Selects the drive strength for the specified pins, in
>mA=2E
>> +		    Valid values are: 2, 4, 6, 8, 10, 12, 14 and 16
>> +
>> +Example:
>> +
>> +	tlmm: pinctrl@01010000 {
>> +		compatible =3D "qcom,sdm660-pinctrl";
>> +		reg =3D <0x01010000 0x300000>;
>> +		interrupts =3D <0 208 0>;
>> +		gpio-controller;
>> +		#gpio-cells =3D <2>;
>+		gpio-ranges =3D <&tlmm 0 0 114>;
>
>(please verify, I saw that sdm660_pinctrl sets =2Engpios =3D 114=2E)
Yeah, this shouldn't even be there, I just copied my test node from debugg=
ing driver which had it=2E
>
>> +		interrupt-controller;
>> +		#interrupt-cells =3D <2>;
>> +
>> +		uart_console_active: uart_console_active {
>> +			mux {
>> +				pins =3D "gpio4", "gpio5";
>> +				function =3D "blsp_uart8";
>> +			};
>> +
>> +			config {
>> +				pins =3D "gpio4", "gpio5";
>> +				drive-strength =3D <2>;
>> +				bias-disable;
>> +			};
>> +		};
>> +	};
>[=2E=2E=2E]
