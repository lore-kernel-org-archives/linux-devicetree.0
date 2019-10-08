From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/3] arm64: dts: imx8mq: Use correct clock for usdhc's ipg
 clk
Date: Tue, 8 Oct 2019 00:58:08 +0000
Message-ID: <AM6PR0402MB3911D80F4C96EE9500B360D2F59A0@AM6PR0402MB3911.eurprd04.prod.outlook.com>
References: <1568869559-28611-1-git-send-email-Anson.Huang@nxp.com>
 <20191007121204.GI7150@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191007121204.GI7150@dragon>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "angus@akkea.ca" <angus@akkea.ca>, Jacky Bai <ping.bai@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infr>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

> On Thu, Sep 19, 2019 at 01:05:57PM +0800, Anson Huang wrote:
> > On i.MX8MQ, usdhc's ipg clock is from IMX8MQ_CLK_IPG_ROOT, assign it
> > explicitly instead of using IMX8MQ_CLK_DUMMY.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> 
> Fixes tag?

OK, added them in V2.

Thanks,
Anson
