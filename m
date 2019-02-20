From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH V3 5/5] clk: imx: scu: add fallback compatible string
 support
Date: Wed, 20 Feb 2019 12:57:15 -0800
Message-ID: <155069623505.77512.17191789640283789974@swboyd.mtv.corp.google.com>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
 <1548335800-6438-6-git-send-email-aisheng.dong@nxp.com>
 <AM6PR04MB42151CA6852C4EEA0FECC93C807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM6PR04MB42151CA6852C4EEA0FECC93C807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Quoting Aisheng Dong (2019-02-19 23:09:57)
> Hi Stephen,
> 
> Can you help picked this one?
> SCU clock is likely to be common, so we add a common
> compatible string to handle it.
> 
> BTW Patch 1~2 already picked up by Shawn.
> Patch 3~4 dropped.
> 

Sure. Picked into clk-next.
