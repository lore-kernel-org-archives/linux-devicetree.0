From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mm: Correct OPP table according to
 latest datasheet
Date: Mon, 1 Jul 2019 13:20:49 +0000
Message-ID: <VI1PR04MB5055B324BD963A50698A0AA9EEF90@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190629102157.8026-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Anson Huang <anson.huang@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jacky Bai <ping.bai@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 6/29/2019 1:31 PM, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> According to latest datasheet (Rev.0.2, 04/2019) from below links,
> 1.8GHz is ONLY available for consumer part, so the market segment
> bits for 1.8GHz opp should ONLY available for consumer part accordingly.
>  > Fixes: f403a26c865b (arm64: dts: imx8mm: Add cpu speed grading and 
all OPPs)
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

For both:
Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>

The vendor tree goes through a lot of testing so switching to the exact 
speed grading interpretation from there does make sense.
