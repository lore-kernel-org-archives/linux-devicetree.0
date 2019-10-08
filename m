From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/2] arm64: dts: imx8mm-evk: Add i2c3 support
Date: Tue, 8 Oct 2019 01:28:15 +0000
Message-ID: <AM6PR0402MB3911D2C2A28C177CBA0D34AFF59A0@AM6PR0402MB3911.eurprd04.prod.outlook.com>
References: <1568886408-18168-1-git-send-email-Anson.Huang@nxp.com>
 <20191007122313.GJ7150@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191007122313.GJ7150@dragon>
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
To: Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jun Li <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

> On Thu, Sep 19, 2019 at 05:46:47PM +0800, Anson Huang wrote:
> > Enable i2c3 for i.MX8MM EVK board.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > index f7a15f3..7758c1c 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > @@ -306,6 +306,13 @@
> >  	};
> >  };
> >
> > +&i2c3 {
> > +	clock-frequency = <400000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c3>;
> > +	status = "okay";
> > +};
> > +
> >  &iomuxc {
> 
> The iomuxc node is being put at end of file because of its huge pinctrl data.
> I2C devices should be placed in alphabetical sort though.  Can you please
> have a patch moving i2c1 and i2c2 to correct place first, and then add i2c3?

Done in V2.

Thanks,
Anson
