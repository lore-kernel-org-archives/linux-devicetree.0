From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 10/11] Document: dt: binding: imx: update doc for imx6sll
Date: Mon, 12 Dec 2016 02:59:15 +0000
Message-ID: <AM3PR04MB53011E24DF4E87F87788DB787980@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1480660774-25055-1-git-send-email-ping.bai@nxp.com>
 <1480660774-25055-11-git-send-email-ping.bai@nxp.com>
 <20161209181201.ewcqeqslyf3je7kq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161209181201.ewcqeqslyf3je7kq@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH 10/11] Document: dt: binding: imx: update doc for imx6sll
> 
> On Fri, Dec 02, 2016 at 02:39:33PM +0800, Bai Ping wrote:
> > Add necessary document update for i.MX6SLL support.
> >
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
> > ---
> >  .../devicetree/bindings/clock/imx6sll-clock.txt    | 13 ++++++++
> >  .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt       | 37 ++++++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> > b/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> > new file mode 100644
> > index 0000000..4f52efa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> > @@ -0,0 +1,13 @@
> > +* Clock bindings for Freescale i.MX6 UltraLite
> 
> I thought UltraLite was MX6UL?
> 

Sorry, it is a typo, will fix in V2.

> > +
> > +Required properties:
> > +- compatible: Should be "fsl,imx6sll-ccm"
> > +- reg: Address and length of the register set
> > +- #clock-cells: Should be <1>
> > +- clocks: list of clock specifiers, must contain an entry for each
> > +required
> > +  entry in clock-names
> > +- clock-names: should include entries "ckil", "osc", "ipp_di0" and "ipp_di1"
> > +
> > +The clock consumer should specify the desired clock by having the
> > +clock ID in its "clocks" phandle cell.  See
> > +include/dt-bindings/clock/imx6sll-clock.h
> > +for the full list of i.MX6 SLL clock IDs.
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
> > b/Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
> > new file mode 100644
> > index 0000000..096e471
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.tx
> > +++ t
> > @@ -0,0 +1,37 @@
> > +* Freescale i.MX6 UltraLite IOMUX Controller
> 
> ditto
> 

Will fix in V2. Thanks for review.

> > +
> > +Please refer to fsl,imx-pinctrl.txt in this directory for common
> > +binding part and usage.
> > +
> > +Required properties:
> > +- compatible: "fsl,imx6sll-iomuxc"
> > +- fsl,pins: each entry consists of 6 integers and represents the mux
> > +and config
> > +  setting for one pin.  The first 5 integers <mux_reg conf_reg
> > +input_reg mux_val
> > +  input_val> are specified using a PIN_FUNC_ID macro, which can be
> > +found in
> > +  imx6ul-pinfunc.h under device tree source folder.  The last integer
> > +CONFIG is
> > +  the pad setting value like pull-up on this pin.  Please refer to
> > +i.MX6SLL
> > +  Reference Manual for detailed CONFIG settings.
> > +
> > +CONFIG bits definition:
> > +PAD_CTL_LVE			(1 << 22)
> > +PAD_CTL_HYS                     (1 << 16)
> > +PAD_CTL_PUS_100K_DOWN           (0 << 14)
> > +PAD_CTL_PUS_47K_UP              (1 << 14)
> > +PAD_CTL_PUS_100K_UP             (2 << 14)
> > +PAD_CTL_PUS_22K_UP              (3 << 14)
> > +PAD_CTL_PUE                     (1 << 13)
> > +PAD_CTL_PKE                     (1 << 12)
> > +PAD_CTL_ODE                     (1 << 11)
> > +PAD_CTL_SPEED_LOW               (0 << 6)
> > +PAD_CTL_SPEED_MED               (1 << 6)
> > +PAD_CTL_SPEED_HIGH              (3 << 6)
> > +PAD_CTL_DSE_DISABLE             (0 << 3)
> > +PAD_CTL_DSE_260ohm              (1 << 3)
> > +PAD_CTL_DSE_130ohm              (2 << 3)
> > +PAD_CTL_DSE_87ohm               (3 << 3)
> > +PAD_CTL_DSE_65ohm               (4 << 3)
> > +PAD_CTL_DSE_52ohm               (5 << 3)
> > +PAD_CTL_DSE_43ohm               (6 << 3)
> > +PAD_CTL_DSE_37ohm               (7 << 3)
> > +PAD_CTL_SRE_FAST                (1 << 0)
> > +PAD_CTL_SRE_SLOW                (0 << 0)
> > --
> > 1.9.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
