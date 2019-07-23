From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V5 3/5] arm64: dts: imx8mm: Add system counter node
Date: Tue, 23 Jul 2019 02:29:13 +0000
Message-ID: <DB3PR0402MB3916841134BBE0C98C05ABE8F5C70@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190710063056.35689-1-Anson.Huang@nxp.com>
 <20190710063056.35689-3-Anson.Huang@nxp.com> <20190722031517.GT3738@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722031517.GT3738@dragon>
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
To: Shawn Guo <shawnguo@kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "angus@akkea.ca" <angus@akkea.ca>, Leonard Crestez <leonard.crestez@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "will@kernel.org" <will@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>"linux-kernel@vger.kernel.org" <linux->
List-Id: devicetree@vger.kernel.org

Hi, Shawn

> On Wed, Jul 10, 2019 at 02:30:54PM +0800, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > Add i.MX8MM system counter node to enable timer-imx-sysctr broadcast
> > timer driver.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> 
> Do I need to wait for patch #1 landing before I apply #3 ~ #5, or can they be
> applied independently (no breaking on anything)?

Without #1, system can bootup, but the system counter's freq will be incorrect,
although it does NOT impact normal function. So I think it is better to wait for
#1 landing. @daniel.lezcano@linaro.org, can you help review the #1 patch, since
I use a different way to fix the clock issue which is more simple.

Anson
