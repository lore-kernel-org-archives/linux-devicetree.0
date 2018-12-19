From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: nxp: ls208xa: add more thermal zone support
Date: Wed, 19 Dec 2018 12:08:22 +0800
Message-ID: <20181219040820.GA13728@dragon>
References: <20181031044742.26327-1-andy.tang@nxp.com>
 <VI1PR04MB433351E63826CC2128153943F3BD0@VI1PR04MB4333.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB433351E63826CC2128153943F3BD0@VI1PR04MB4333.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Tang <andy.tang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 07:01:32AM +0000, Andy Tang wrote:
> Hi,
> 
> PING.
> 
> BR,
> Andy
> 
> > -----Original Message-----
> > From: Yuantian Tang <andy.tang@nxp.com>
> > Sent: 2018年10月31日 12:48
> > To: shawnguo@kernel.org
> > Cc: Leo Li <leoyang.li@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; rui.zhang@intel.com; daniel.lezcano@linaro.org;
> > Andy Tang <andy.tang@nxp.com>
> > Subject: [PATCH] arm64: dts: nxp: ls208xa: add more thermal zone support
> > 
> > Ls208xa has several thermal sensors. Add all the sensor id to dts to enable
> > them.
> > 
> > To make the dts cleaner, re-organize the nodes to split out the common part so
> > that it can be shared with other SoCs.
> > 
> > Signed-off-by: Yuantian Tang <andy.tang@nxp.com>

Please take a look at patch below.

https://patchwork.kernel.org/patch/10685815/

Shawn
