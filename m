From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND v1 0/4] dt-binding: clk: prepare for imx8qm clock
 support
Date: Tue, 22 Jan 2019 11:06:48 -0800
Message-ID: <154818400852.20280.9414688242016617890@swboyd.mtv.corp.google.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB42115D3E98B8B319936AC60E80820@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20190116110216.GN15808@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190116110216.GN15808@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Quoting Shawn Guo (2019-01-16 03:02:17)
> On Wed, Jan 16, 2019 at 05:40:01AM +0000, Aisheng Dong wrote:
> > Ping...
> > 
> > BTW, as the first two patches change the same firmware binding doc fs.scu.txt.
> > I'm not sure whether it should go to Shawn's tree for the binding part, or Stephen's clock tree.
> > 
> > Shawn & Stephen,
> > What's your suggestion?
> 
> I can apply the first two to my tree as long as Rob and Stephen ack on
> them.
> 

The first two are documentation updates? I don't care really either way,
so I gave my ack in case you want to pick them up before I get around to
the rest of the series.
