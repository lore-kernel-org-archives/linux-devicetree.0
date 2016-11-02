From: Michael Scott <michael.scott@linaro.org>
Subject: Re: [PATCH V4] pinctrl: qcom: Add msm8994 pinctrl driver
Date: Tue, 1 Nov 2016 22:15:09 -0700
Message-ID: <e0bdce76-dcab-36c9-bf39-6c79b1cb2820@linaro.org>
References: <20161031160009.20472-1-michael.scott@linaro.org>
 <20161101235344.GX16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161101235344.GX16026@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Joonwoo Park <joonwoop@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
List-Id: devicetree@vger.kernel.org


On 11/01/2016 04:53 PM, Stephen Boyd wrote:
> On 10/31, Michael Scott wrote:
>> +
>> +static const struct msm_pingroup msm8994_groups[] = {
>> +	PINGROUP(0,   blsp_spi1, blsp_uart1, blsp_uim1, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
> I see an hdmi_rcv group here after blsp_uim1. Please add it for
> this gpio.

Hi Stephen,

Thank you for reviewing the data-- this is really tedious stuff.

I'd like to make sure that we're both using tech data for msm8994.  I 
don't see the hdmi_rcv function at all in my docs.

>
>> +	PINGROUP(1,   blsp_spi1, blsp_uart1, blsp_uim1, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(2,   blsp_spi1, blsp_uart1, blsp_i2c1, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(3,   blsp_spi1, blsp_uart1, blsp_i2c1, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(4,   blsp_spi2, blsp_uart2, blsp_uim2, qdss_cti_trig_out_b,
>> +		 NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(5,   blsp_spi2, blsp_uart2, blsp_uim2, qdss_cti_trig_in_b, NA,
> The qdss_cti_* is in function 5 for both of these, not function
> 4.
These are indeed wrong, but my docs both show as function 7.
>
>> +		 NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(6,   blsp_spi2, blsp_uart2, blsp_i2c2, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(7,   blsp_spi2, blsp_uart2, blsp_i2c2, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(8,   blsp_spi3, blsp_uart3, blsp_uim3, blsp_spi1_cs1, NA, NA,
>> +		 NA, NA, NA, NA, NA),
>> +	PINGROUP(9,   blsp_spi3, blsp_uart3, blsp_uim3, blsp_spi1_cs2, NA, NA,
>> +		 NA, NA, NA, NA, NA),
>> +	PINGROUP(10,  mdp_vsync, blsp_spi3, blsp_uart3, blsp_i2c3,
>> +		 blsp_spi1_cs3, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(11,  mdp_vsync, blsp_spi3, blsp_uart3, blsp_i2c3,
>> +		 blsp_spi1_cs2, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(12,  mdp_vsync, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(13,  cam_mclk0, NA, NA, qdss_tracedata_b, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(14,  cam_mclk1, NA, NA, qdss_tracedata_b, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(15,  cam_mclk2, NA, qdss_tracedata_b, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(16,  cam_mclk3, NA, qdss_tracedata_b, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(17,  cci_i2c0, blsp_spi4, blsp_uart4, blsp_uim4, NA,
>> +		 qdss_tracedata_b, NA, NA, NA, NA, NA),
>> +	PINGROUP(18,  cci_i2c0, blsp_spi4, blsp_uart4, blsp_uim4, NA,
>> +		 qdss_tracedata_b, NA, NA, NA, NA, NA),
>> +	PINGROUP(19,  cci_i2c1, blsp_spi4, blsp_uart4, blsp_i2c4, NA,
>> +		 qdss_tracedata_b, NA, NA, NA, NA, NA),
>> +	PINGROUP(20,  cci_i2c1, blsp_spi4, blsp_uart4, blsp_i2c4, NA, NA, NA,
>> +		 NA, NA, NA, NA),
>> +	PINGROUP(21,  cci_timer0, blsp_spi5, blsp_uart5, blsp_uim5, NA,
>> +		 qdss_tracedata_b, NA, NA, NA, NA, NA),
>> +	PINGROUP(22,  cci_timer1, blsp_spi5, blsp_uart5, blsp_uim5, NA,
>> +		 qdss_tracedata_b, NA, NA, NA, NA, NA),
>> +	PINGROUP(23,  cci_timer2, blsp_spi5, blsp_uart5, blsp_i2c5, NA, NA,
>> +		 qdss_tracedata_b, NA, NA, NA, NA),
>> +	PINGROUP(24,  cci_timer3, cci_async_in1, blsp_spi5, blsp_uart5,
>> +		 blsp_i2c5, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(25,  cci_timer4, cci_async_in2, blsp_spi6, blsp_uart6,
>> +		 blsp_uim6, NA, NA, qdss_tracedata_b, NA, NA, NA),
>> +	PINGROUP(26,  cci_async_in0, blsp_spi6, blsp_uart6, blsp_uim6, gp0_clk,
>> +		 NA, qdss_tracedata_b, NA, NA, NA, NA),
>> +	PINGROUP(27,  blsp_spi6, blsp_uart6, blsp_i2c6, gp1_clk,
>> +		 qdss_tracectl_a, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(28,  blsp_spi6, blsp_uart6, blsp_i2c6, qdss_traceclk_a, NA,
>> +		 NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(29,  gp_mn, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(30,  NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(31,  hdmi_cec, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(32,  hdmi_ddc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(33,  hdmi_ddc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(34,  hdmi_hpd, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(35,  uim3, pci_e1, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(36,  uim3, pci_e1, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(37,  uim3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(38,  uim3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(39,  NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(40,  NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(41,  blsp_spi7, blsp_uart7, blsp_uim7, qdss_cti_trig_out_c,
>> +		 NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(42,  blsp_spi7, blsp_uart7, blsp_uim7, qdss_cti_trig_in_c, NA,
>> +		 NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(43,  blsp_spi7, blsp_uart7, blsp_i2c7, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(44,  blsp_spi7, blsp_uart7, blsp_i2c7, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(45,  blsp_spi8, blsp_uart8, blsp_uim8, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(46,  blsp_spi8, blsp_uart8, blsp_uim8, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(47,  blsp_spi8, blsp_uart8, blsp_i2c8, blsp_spi10_cs1, NA, NA,
>> +		 NA, NA, NA, NA, NA),
>> +	PINGROUP(48,  blsp_spi8, blsp_uart8, blsp_i2c8, blsp_spi10_cs2, NA, NA,
>> +		 NA, NA, NA, NA, NA),
>> +	PINGROUP(49,  uim2, blsp_spi9, blsp_uart9, blsp_uim9, NA, NA, NA, NA,
>> +		 NA, NA, NA),
>> +	PINGROUP(50,  uim2, blsp_spi9, blsp_uart9, blsp_uim9, NA, NA, NA, NA,
>> +		 NA, NA, NA),
>> +	PINGROUP(51,  uim2, blsp_spi9, blsp_uart9, blsp_i2c9, NA, NA, NA, NA,
>> +		 NA, NA, NA),
>> +	PINGROUP(52,  uim2, blsp_spi9, blsp_uart9, blsp_i2c9, NA, NA, NA, NA,
>> +		 NA, NA, NA),
>> +	PINGROUP(53,  uim4, pci_e0, blsp_spi10, blsp_uart10, blsp_uim10, NA,
>> +		 NA, NA, NA, qdss_tracedata_a, NA),
> qdss_tracedata_a is at function 8.
I show function 10 here.
>
>> +	PINGROUP(54,  uim4, pci_e0, blsp_spi10, blsp_uart10, blsp_uim10,
>> +		 gp_pdm0, NA, NA, NA, NA, qdss_tracedata_a),
> qdss_tracedata_a is at function 9.
And function 11 here.
>
>> +	PINGROUP(55,  uim4, blsp_spi10, blsp_uart10, blsp_i2c10, NA, NA, NA,
>> +		 NA, NA, qdss_cti_trig_in_a, NA),
> qdss_cti_trig_in_a is at function 8.
10 here for me.

>
>> +	PINGROUP(56,  uim4, blsp_spi10, blsp_uart10, blsp_i2c10, NA, NA, NA,
>> +		 NA, qdss_cti_trig_out_a, NA, NA),
> qdss_cti_trig_out_a is at function 7.
9 here for me.
>
>> +	PINGROUP(57,  qua_mi2s, gcc_gp_clk1, NA, NA, NA, NA, qdss_tracedata_b,
>> +		 NA, NA, NA, NA),
> qdss_tracedata_b is at function 5.
function 7 here.
>
>> +	PINGROUP(58,  qua_mi2s, gcc_gp_clk2, NA, NA, NA, NA, qdss_tracedata_b,
>> +		 NA, NA, NA, NA),
> qdss_tracedata_b is at function 5.
And function 7 here as well.
>
>> +	PINGROUP(59,  qua_mi2s, gcc_gp_clk3, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(60,  qua_mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(61,  qua_mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(62,  qua_mi2s, blsp_spi2_cs1, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(63,  qua_mi2s, blsp_spi2_cs2, gp_pdm2, NA, NA, NA, NA, NA,
>> +		 qdss_tracedata_a, NA, NA),
>> +	PINGROUP(64,  pri_mi2s, NA, NA, NA, NA, NA, qdss_tracedata_a, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(65,  pri_mi2s, NA, NA, NA, NA, NA, qdss_tracedata_a, NA, NA,
>> +		 NA, NA),
> qdss_tracedata_a is at function 5 for both of the above.
Both of these show function 7 for me.

>
>> +	PINGROUP(66,  pri_mi2s, blsp_spi2_cs3, NA, NA, NA, NA, NA,
>> +		 qdss_tracedata_a, NA, NA, NA),
>> +	PINGROUP(67,  pri_mi2s, blsp_spi10_cs1, NA, NA, NA, NA, NA,
>> +		 qdss_tracedata_a, NA, NA, NA),
> qdss_tracedata_a is at function 6 for both of the above.
Function 8 here.
>
>> +	PINGROUP(68,  pri_mi2s, blsp_spi10_cs2, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(69,  spkr_mi2s, audio_ref_clk, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(70,  slimbus, spkr_mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(71,  slimbus, spkr_mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(72,  spkr_mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
> Perahps *_mi2s should just be *_i2s here. I don't see any m except for
> mclk, which means master and sometimes there are sck for slaves
> here.
Good catch.  Changing this to spkr_i2s.
>
>> +	PINGROUP(73,  ter_mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(74,  ter_mi2s, gp_pdm1, NA, NA, NA, NA, NA, qdss_tracedata_a,
> These have mi2s though which is fine. Also qdss_tracedata_a is at
> function 6.
qdss_* is function 8 here for me.

>> +		 NA, NA, NA),
>> +	PINGROUP(75,  ter_mi2s, NA, NA, NA, NA, qdss_tracedata_a, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(76,  ter_mi2s, NA, NA, NA, NA, qdss_tracedata_a, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(77,  ter_mi2s, NA, NA, NA, NA, qdss_tracedata_a, NA, NA, NA,
>> +		 NA, NA),
> qdss_tracedata_a is at function 4 for the above 3 gpios.
Showing as function 6 for me.
>
>> +	PINGROUP(78,  sec_mi2s, gcc_gp_clk1, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(79,  sec_mi2s, gp_pdm2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(80,  sec_mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(81,  sec_mi2s, blsp_spi11, blsp_uart11, blsp_uim11,
>> +		 gcc_gp_clk2, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(82,  sec_mi2s, blsp_spi11, blsp_uart11, blsp_uim11,
>> +		 gcc_gp_clk3, NA, NA, NA, NA, NA, NA),
> I'd do gcc_gp3_clk and gcc_gp2_clk instead. The number is on the
> GP instance. Also, we have _a and _b in the 8996 driver, which
> should be copied into here?
Good catch, fixing 78, 81 and 82: # is on the GP instance for me as well 
and I'll add the _a and _b instances.
>
>> +	PINGROUP(83,  blsp_spi11, blsp_uart11, blsp_i2c11, NA, NA, NA, NA, NA,
>> +		 NA, NA, NA),
>> +	PINGROUP(84,  blsp_spi11, blsp_uart11, blsp_i2c11, NA, NA, NA, NA, NA,
>> +		 NA, NA, NA),
>> +	PINGROUP(85,  blsp_spi12, blsp_uart12, blsp_uim12, NA, NA,
>> +		 qdss_tracedata_a, NA, NA, NA, NA, NA),
>> +	PINGROUP(86,  blsp_spi12, blsp_uart12, blsp_uim12, gp_pdm1, NA,
>> +		 qdss_tracedata_a, NA, NA, NA, NA, NA),
>> +	PINGROUP(87,  blsp_spi12, blsp_uart12, blsp_i2c12, NA,
>> +		 qdss_tracedata_a, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(88,  blsp_spi12, blsp_uart12, blsp_i2c12, NA, NA, NA, NA, NA,
>> +		 NA, NA, NA),
>> +	PINGROUP(89,  tsif1, NA, qdss_tracedata_a, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(90,  tsif1, blsp_spi10_cs3, qdss_tracedata_a, NA, NA, NA, NA,
>> +		 NA, NA, NA, NA),
>> +	PINGROUP(91,  tsif1, sdc4, NA, NA, NA, NA, qdss_traceclk_b, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(92,  tsif2, sdc4, NA, NA, qdss_tracedata_b, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(93,  tsif2, sdc4, NA, NA, NA, NA, qdss_tracedata_b, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(94,  tsif2, sdc4, NA, NA, NA, NA, qdss_tracectl_b, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(95,  tsif2, sdc4, gp_pdm0, NA, NA, NA, qdss_cti_trig_out_d,
>> +		 NA, NA, NA, NA),
>> +	PINGROUP(96,  tsif2, sdc4, qdss_cti_trig_in_d, NA, NA, NA, NA, NA, NA,
>> +		 NA, NA),
>> +	PINGROUP(97,  uim1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(98,  uim1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(99,  uim1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(100, uim1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(101, uim_batt_alarm, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(102, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(103, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(104, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(105, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(106, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(107, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(108, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(109, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(110, tsif1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(111, tsif1, blsp11_uart_tx_b, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(112, blsp11_uart_rx_b, NA, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(113, blsp11_i2c_sda_b, NA, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(114, blsp11_i2c_scl_b, NA, NA, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(115, grfc, rffe6, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(116, grfc, rffe6, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(117, grfc, rffe7, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(118, grfc, rffe7, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(119, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(120, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(121, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(122, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(123, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(124, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(125, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(126, grfc, gsm_tx, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(127, grfc, nav_tsync, nav_pps, NA, NA, NA, NA, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(128, NA, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(129, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(130, gps_tx, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(131, gsm_tx, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(132, gsm_tx, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(133, gsm_tx, grfc, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(134, mss_lte, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(135, mss_lte, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(136, rffe1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(137, rffe1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(138, rffe2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(139, rffe2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(140, rffe3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(141, rffe3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(142, rffe4, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(143, rffe4, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(144, rffe5, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(145, rffe5, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
> We've typically left out rffe*, and grfc from this driver. I'd
> just leave them out here as well.
Ack, will remove rffe*
>
>> +	SDC_PINGROUP(sdc1_rclk, 0x2044, 15, 0),
>> +	SDC_PINGROUP(sdc1_clk, 0x2044, 13, 6),
>> +	SDC_PINGROUP(sdc1_cmd, 0x2044, 11, 3),
>> +	SDC_PINGROUP(sdc1_data, 0x2044, 9, 0),
>> +	SDC_PINGROUP(sdc2_clk, 0x2048, 14, 6),
>> +	SDC_PINGROUP(sdc2_cmd, 0x2048, 11, 3),
>> +	SDC_PINGROUP(sdc2_data, 0x2048, 9, 0),
>> +	SDC_PINGROUP(sdc3_clk, 0x206c, 14, 6),
>> +	SDC_PINGROUP(sdc3_cmd, 0x206c, 11, 3),
>> +	SDC_PINGROUP(sdc3_data, 0x206c, 9, 0),
>> +};
>> +
>> +#define NUM_GPIO_PINGROUPS 146
>> +
>> +static const struct msm_pinctrl_soc_data msm8994_pinctrl = {
>> +	.pins = msm8994_pins,
>> +	.npins = ARRAY_SIZE(msm8994_pins),
>> +	.functions = msm8994_functions,
>> +	.nfunctions = ARRAY_SIZE(msm8994_functions),
>> +	.groups = msm8994_groups,
>> +	.ngroups = ARRAY_SIZE(msm8994_groups),
>> +	.ngpios = NUM_GPIO_PINGROUPS,
>> +};
>> +
>> +static int msm8994_pinctrl_probe(struct platform_device *pdev)
>> +{
>> +	return msm_pinctrl_probe(pdev, &msm8994_pinctrl);
>> +}
>> +
>> +static const struct of_device_id msm8994_pinctrl_of_match[] = {
>> +	{ .compatible = "qcom,msm8992-pinctrl", },
>> +	{ .compatible = "qcom,msm8994-pinctrl", },
>> +	{ },
> Nitpick: this comma can be removed because this list shouldn't
> have any elements after this terminator.
Fixing this in the next version.

I'll send you a follow-up email directly with my tech data info, so we 
can determine where the differences on the qdss_* and hdmi_rcv functions 
are coming from.

- Michael Scott
>
