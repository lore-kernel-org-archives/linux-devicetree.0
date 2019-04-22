From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: Add mclk0 clock for SAI
Date: Sun, 21 Apr 2019 21:25:20 -0700
Message-ID: <20190422042519.GA4304@Asurada>
References: <VE1PR04MB647951B20E0F334FF1CC3B7AE3220@VE1PR04MB6479.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VE1PR04MB647951B20E0F334FF1CC3B7AE3220@VE1PR04MB6479.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 22, 2019 at 03:30:26AM +0000, S.j. Wang wrote:
> > > SAI has 4 clock sources, which can be selected using MSEL bit of SAI
> > > TCR2 register.
> > 
> > I have a doubt at this statement. As far as I can understand, this MSEL is
> > probably used by its internal clock MUX, so it's not really proving that SAI
> > has 4 MCLK inputs. What I know is that SAI block itself only has 3 MCLK
> > inputs as we defined in DT. It's just internally connects bus clock or MCLK1
> > to input0 of clock MUX's and connects MCLK[1-3] to input[1-3]. So adding an
> > MCLK0 here doesn't sound a right way to me. Unless someone can justify
> > for it, I think we should just fix it from driver side.
> > 
> > Thanks
> > Nicolin
> >
> 
> The MSEL bit width is 2 bit, so there is 4 options,  the MCLK0 maybe the same input as
> MCLK1 or bus clock as you said, so we think may be better to show this relation in DT, 
> And this is DT's capability.  Driver don't care about which clock connect to MCLK0, 
> it only need to know there is 4 MCLK from DT. 

I know what it is. But it feels weird that we add an MCLK0 just
because of what a register filed has, and there's no "MCLK0" be
mentioned in the RM at all. My point is that if SAI doesn't have
a port named "MCLK0", I don't feel it's that convincing to have
it in the DT.

Usually in DT we define the clock sources of an entire IP block
in audio use cases, not for an internal clock MUX. But taking a
step back, it might not be really wrong to do so, since the MUX
is a part of the hardware. If we redefine the MCLK[0-4] as "four
clock sources of SAI's clock MUX selecting a clock for bit clock
and frame clock providing" in the binding doc, I feel it'd make
a lot of sense.
