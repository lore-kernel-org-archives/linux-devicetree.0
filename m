From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 1/2] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Date: Tue, 16 Jul 2019 15:56:39 +0000
Message-ID: <AM0PR04MB4211138D41AE98AC2E0B46D780CE0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1556846821-8581-1-git-send-email-aisheng.dong@nxp.com>
 <1556846821-8581-2-git-send-email-aisheng.dong@nxp.com>
 <CAL_JsqLJ+Lc_3huQizy4BVFgVV94Yg8KsOOgXLv4dQU8H=WfWw@mail.gmail.com>
 <AM0PR04MB4211B2F21350CAE370D7A93780360@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CAL_JsqLNRnYxUGyhpiL2OFxOT1wXZH2LG4XUH7qf14TpA5Dk=A@mail.gmail.com>
 <AM0PR04MB421180CD45226B30082BDE4D80320@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20190513180004.GA26344@bogus>
 <AM0PR04MB4211C4F27C9D1DEC29B1600E80070@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM0PR04MB421104C260EE55FD8016656480140@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB421104C260EE55FD8016656480140@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
To: Rob Herring <robh@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Would you help check the new patch series I just sent?
[v3,00/11] clk: imx8: add new clock binding for better pm support
https://patchwork.kernel.org/cover/11046287/

The former solution you suggested seems can't work as it lost the ability
to set parents for each individual clocks within the same hardware subsystems.

And seems both Stephen & You may not quite like the per node clock in DT for SCU
clocks, In order to not stuck at here, I totally removed the SCU clock nodes in DT,
Instead, we still define those SCU clocks in driver but changed to two cells binding
which is more close to hardware (SW Clock IDs are removed) and can handle
above issues.

And we also need some tricks in driver to handle the required power domains
and Clock availability for different partition configuration, as well as 
clock state save& restore.

The patch series has been pending for quite a few months.
So it would be really appreciated if you can help review and provide some
advices.

Note: for DT patches which may help the understanding, please refer to:
[v2,00/15] arm64: dts: imx8: architecture improvement and adding imx8qm support
https://patchwork.kernel.org/cover/11046341/

Regards
Dong Aisheng

> From: Aisheng Dong
> Sent: Tuesday, June 4, 2019 12:50 AM
> Subject: RE: [PATCH V2 1/2] dt-bindings: firmware: imx-scu: new binding to
> parse clocks from device tree
> 
> Hi Rob,
> 
> Would you help check my reply and offer some suggestions?
> We're a bit lost on what to do and being blocked here for a long time which
> affects all the following MX8QM/QXP upstreaming works.
> 
> We really need your help to clarify how to move forward.
> If any more information need me to provide, feel free to let me know.
> 
> Thanks a lot in advance!
> 
> Regards
> Dong Aisheng
> 
> > From: Aisheng Dong
> > Sent: Wednesday, May 22, 2019 1:57 AM
> > Hi Rob,
> >
> > [...]
> >
> > > > > > For SCU based platforms, the resource availability (e.g.
> > > > > > device/clocks/power) are configurable by SCU firmware
> > > > > > according to the
> > > > > different SW execution partition configuration.
> > > > > > e.g. According to customer's requirements, we may allocate
> > > > > > some resources to M4 partition like some I2C, CAN, audio
> > > > > > resources which can't be
> > > > > accessed by A core.
> > > > > > And we may allocate even more for virtual machines running at
> > > > > > another CPU
> > > > > core.
> > > > > > Thus, defining all the clock sources (fixed) in device tree
> > > > > > for A core seems to be a little bit meaningless and it also
> > > > > > causes us hard to extend for a
> > > > > new SoC.
> > > > >
> > > > > I'm not suggesting that. It's really just re-arranging all the
> > > > > same data from a bunch of child nodes to a single node. Granted,
> > > > > it may be easier to add/delete nodes than add/delete elements
> > > > > from an array of property values, but really that's just a
> > > > > tooling problem
> > > > >
> > > >
> > > > Okay, understood.
> > > > So it seems we could still have a separate clock controller node
> > > > for each SS but merge all the same data of child nodes data into it.
> > > >
> > > > However, we still have one concern.
> > > > Taking MX8QXP DMA SS as example, with one node description, it may
> > > > be something like below:
> > > > dma_scu_clk: dma-scu-clock-controller {
> > > >         compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-clk";
> > > >         #clock-cells = <1>;
> > > >         clock-indices = <IMX_SCU_CLK_ID(IMX_SC_R_ADC_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_CAN_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_FTM_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_FTM_1,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_I2C_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_I2C_1,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_I2C_2,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_I2C_3,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_LCD_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >
> <IMX_SCU_CLK_ID(IMX_SC_R_LCD_0_PWM_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_SPI_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_SPI_1,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_SPI_2,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_SPI_3,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_UART_0,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_UART_1,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_UART_2,
> > > IMX_SC_PM_CLK_PER)>,
> > > >                         <IMX_SCU_CLK_ID(IMX_SC_R_UART_3,
> > > IMX_SC_PM_CLK_PER)>;
> > > >         clock-output-names = "adc0_clk",
> > > >                              "can0_clk",
> > > >                              "ftm0_clk",
> > > >                              "ftm1_clk",
> > > >                              "i2c0_clk",
> > > >                              "i2c1_clk",
> > > >                              "i2c2_clk",
> > > >                              "i2c3_clk",
> > > >                              "lcd0_clk",
> > > >                              "lcd0_pwm0_clk",
> > > >                              "spi0_clk",
> > > >                              "spi1_clk",
> > > >                              "spi2_clk",
> > > >                              "spi3_clk",
> > > >                              "uart0_clk",
> > > >                              "uart1_clk",
> > > >                              "uart2_clk",
> > > >                              "uart3_clk";
> > > >         power-domains = <&pd IMX_SC_R_ADC_0>,
> > > >                         <&pd IMX_SC_R_CAN_0>,
> > > >                         <&pd IMX_SC_R_FTM_0>,
> > > >                         <&pd IMX_SC_R_FTM_1>,
> > > >                         <&pd IMX_SC_R_I2C_0>,
> > > >                         <&pd IMX_SC_R_I2C_1>,
> > > >                         <&pd IMX_SC_R_I2C_2>,
> > > >                         <&pd IMX_SC_R_I2C_3>,
> > > >                         <&pd IMX_SC_R_LCD_0>,
> > > >                         <&pd IMX_SC_R_LCD_0_PWM_0>,
> > > >                         <&pd IMX_SC_R_SPI_0>,
> > > >                         <&pd IMX_SC_R_SPI_1>,
> > > >                         <&pd IMX_SC_R_SPI_2>,
> > > >                         <&pd IMX_SC_R_SPI_3>,
> > > >                         <&pd IMX_SC_R_UART_0>,
> > > >                         <&pd IMX_SC_R_UART_1>,
> > > >                         <&pd IMX_SC_R_UART_2>,
> > > >                         <&pd IMX_SC_R_UART_3>; };
> > > >
> > > > For MX8QM, even if we have one more UART_4, then we still have to
> > > > write all the same things again with an extra UART_4. It seems
> > > > it's a bit violate our design that using a shared one and do
> > > > incremental changes for
> > > new SoCs.
> > > > Do you think if this is acceptable to you?
> > >
> > > Yes, as it should be a one time thing to do per SoC.
> > >
> >
> > I found we may still can't use this new way after giving a try.
> > One know issue is that it can't support clock parent setting well with
> > this binding If merged all sub clocks into a single node.
> > Hard to describe parent clocks for each clock within the same big array.
> >
> > For example in MX8 ADMA SS, there're another LCD PLL which can be
> > optional parent clocks to others peripherals.
> > If we list them all in the same array, we can't describe LCD
> > baud/pixel clock parents.
> > dma_scu_clk: dma-scu-clock-controller {
> >         compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-clk";
> >         #clock-cells = <1>;
> >         clock-indices = <SC_R_ELCDIF_PLL IMX_SC_PM_CLK_PLL>,
> >                         <SC_R_LCD_0 IMX_SC_PM_CLK_PER>,
> /*
> > lcd baud */
> >                         <SC_R_LCD_0 IMX_SC_PM_CLK_SLV_BUS>,
> /*
> > Pixel Link */
> >                         ...
> >         clock-output-names = "lcdif_pll",
> >                              "lcdif_baud_clk",
> >                              "lcdif_pixel_clk",
> >                                 ...
> >         power-domains = <&pd IMX_SC_R_LCD_0>,
> >                         <&pd IMX_SC_R_LCD_0>,
> >                         <&pd IMX_SC_R_LCD_0>,
> >                         ...
> > };
> >
> > And other peripherals might have different parents within the same array.
> >
> > The old way does not have this issue because it's capable of
> > configuring parents respectively for each sub clocks.
> > /* SCU clocks */
> > dma_scu_clk: clock-controller-scu-dma {
> >         #address-cells = <1>;
> >         #size-cells = <0>;
> >
> >         lcd_pll: clock-scu@323 {
> >                 reg = <323>;
> >                 #clock-cells = <1>;
> >                 clock-indices = <IMX_SC_PM_CLK_PLL>;
> >                 clock-output-names = "lcd_pll";
> >                 power-domains = <&pd IMX_SC_R_ELCDIF_PLL>;
> >         };
> >
> >         lcd0_clk: clock-scu@187 {
> >                 reg = <187>;
> >                 #clock-cells = <1>;
> >                 /* parent clocks should match HW programing order */
> >                 clocks = <&dummy_clk &dummy_clk &dummy_clk
> &dummy_clk
> > &lcd_pll>;
> >                 clock-indices = <IMX_SC_PM_CLK_PER>;
> >                 clock-output-names = "lcd0_clk";
> >                 power-domains = <&pd IMX_SC_R_LCD_0>;
> >         };
> >         ...
> > };
> >
> > I double checked other SS like Audio, DC, MIPI, PI which have the same issue.
> > I really don't know if there will be a way out if using the one single node way.
> > And I'm also a bit worrying whether it may cause more issues due to
> > its losing of the flexibility and causes potential issues.
> >
> > Do you think if we can still go back to the old way which is proposed
> > In this patch set?
> > As it can perfectly meet our requirements and also ease the driver
> > implementation.
> >
> > Hope you can help shed some lights as we're pending on it for a long time.
> >
> > Regards
> > Dong Aisheng
> >
> > > > But if describe them per nodes, we do not have such issue.
> > > >
> > > > Anyway, please tell me your choice, then I will follow.
> > > >
> > > > BTW, I don't know how a tool can address this issue.
> > >
> > > I meant you could write one that understands the binding. It's a bit
> > > more complicated having to parse and update properties compared to
> > > adding or removing nodes, but it can still be done.
> > >
> > > Rob
