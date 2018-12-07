From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH v4 2/6] arm64: add basic DTS for i.MX8MQ
Date: Fri, 7 Dec 2018 16:17:24 +0000
Message-ID: <20181207161723.2u5z3sdobbpop4kz@fsr-ub1664-175>
References: <20181114175242.12468-1-l.stach@pengutronix.de>
 <20181114175242.12468-2-l.stach@pengutronix.de> <20181116232524.GA2013@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181116232524.GA2013@bogus>
Content-Language: en-US
Content-ID: <43241D4E8C10614A9FA91C524C802F09@eurprd04.prod.outlook.com>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 05:25:24PM -0600, Rob Herring wrote:

> > +
> > +	clk_ext1: clock-ext1 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <133000000>;
> > +		clock-output-names = "clk_ext1";
> > +	};
> > +
> > +	clk_ext2: clock-ext2 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <133000000>;
> > +		clock-output-names = "clk_ext2";
> > +	};
> > +
> > +	clk_ext3: clock-ext3 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <133000000>;
> > +		clock-output-names = "clk_ext3";
> > +	};
> > +
> > +	clk_ext4: clock-ext4 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency= <133000000>;
> > +		clock-output-names = "clk_ext4";
> > +	};
> 
> This is really 4 independent clocks or is 1 clock connected to 4 sinks?

According to the RM, yes, there are 4 independent clocks. Here is a link to the rm:

https://www.nxp.com/webapp/Download?colCode=IMX8MEVKBHUG (page 829)

Unfortunately, the old link (which worked without login) does not work anymore.

-- 
