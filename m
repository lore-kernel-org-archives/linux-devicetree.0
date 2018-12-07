From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v4 2/6] arm64: add basic DTS for i.MX8MQ
Date: Fri, 7 Dec 2018 21:07:19 +0000
Message-ID: <20181207210718.ueg2uw6tfniniscl@fsr-ub1664-175>
References: <20181114175242.12468-1-l.stach@pengutronix.de>
 <20181114175242.12468-2-l.stach@pengutronix.de> <20181116232524.GA2013@bogus>
 <20181207161723.2u5z3sdobbpop4kz@fsr-ub1664-175>
 <1544200612.3709.111.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544200612.3709.111.camel@pengutronix.de>
Content-Language: en-US
Content-ID: <AB1EAF748FF8104C805D9F69BFDDC2FA@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 05:36:52PM +0100, Lucas Stach wrote:
> Hi Abel,
> 
> Am Freitag, den 07.12.2018, 16:17 +0000 schrieb Abel Vesa:
> > On Fri, Nov 16, 2018 at 05:25:24PM -0600, Rob Herring wrote:
> > 
> > > > +
> > > > +	clk_ext1: clock-ext1 {
> > > > +		compatible = "fixed-clock";
> > > > +		#clock-cells = <0>;
> > > > +		clock-frequency = <133000000>;
> > > > +		clock-output-names = "clk_ext1";
> > > > +	};
> > > > +
> > > > +	clk_ext2: clock-ext2 {
> > > > +		compatible = "fixed-clock";
> > > > +		#clock-cells = <0>;
> > > > +		clock-frequency = <133000000>;
> > > > +		clock-output-names = "clk_ext2";
> > > > +	};
> > > > +
> > > > +	clk_ext3: clock-ext3 {
> > > > +		compatible = "fixed-clock";
> > > > +		#clock-cells = <0>;
> > > > +		clock-frequency = <133000000>;
> > > > +		clock-output-names = "clk_ext3";
> > > > +	};
> > > > +
> > > > +	clk_ext4: clock-ext4 {
> > > > +		compatible = "fixed-clock";
> > > > +		#clock-cells = <0>;
> > > > +		clock-frequency= <133000000>;
> > > > +		clock-output-names = "clk_ext4";
> > > > +	};
> > > 
> > > This is really 4 independent clocks or is 1 clock connected to 4
> > > sinks?
> > 
> > According to the RM, yes, there are 4 independent clocks. Here is a
> > link to the rm:
> > 
> > https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.nxp.com%2Fwebapp%2FDownload%3FcolCode%3DIMX8MEVKBHUG&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C303f3053feb94a3c1c9f08d65c623255%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636797974154936811&amp;sdata=CuJSqDl1WiL%2Bc%2B4wYnr3ssDDpH3DorYIzLN87PNHVh4%3D&amp;reserved=0 (page 829)
> > 
> > Unfortunately, the old link (which worked without login) does not
> > work anymore.
> 
> It's really 4 clock inputs to the SoC, but they may actually be
> connected to the same clock source on the board. So I really wonder if
> we should even put this into the base SoC DT, but rather push this into
> individual board DTs.

Hmm, it's part of the SoC, right ? So I would keep it in the dtsi rather than
having it duplicated into every new dts.

> 
> Regards,
> Lucas

-- 
