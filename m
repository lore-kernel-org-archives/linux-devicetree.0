From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Date: Mon, 26 Aug 2019 03:21:24 +0000
Message-ID: <AM0PR04MB421181E4376070636898906F80A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
 <20190824192101.GG16308@X250.getinternet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190824192101.GG16308@X250.getinternet.no>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Sunday, August 25, 2019 3:21 AM
> Subject: Re: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to
> parse clocks from device tree
> 
> On Tue, Aug 20, 2019 at 07:13:16AM -0400, Dong Aisheng wrote:
> > MX8QM and MX8QXP LPCG Clocks are mostly the same except they may
> > reside in different subsystems across CPUs and also vary a bit on the
> availability.
> >
> > Same as SCU clock, we want to move the clock definition into device
> > tree which can fully decouple the dependency of Clock ID definition
> > from device tree and make us be able to write a fully generic lpcg clock
> driver.
> >
> > And we can also use the existence of clock nodes in device tree to
> > address the device and clock availability differences across different SoCs.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Acked-by: Shawn Guo <shawnguo@kernel.org>

Thanks Shawn.

Stephen & Rob,
Would you help review if you're also ok with this binding?
We need this to be finalized early for the following work.

Regards
Aisheng
