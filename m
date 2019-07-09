From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm: Assign highest opp as suspend opp
Date: Tue, 9 Jul 2019 10:15:04 +0530
Message-ID: <20190709044504.gyljwwnxdt5niur5@vireshk-i7>
References: <20190704061403.8249-1-Anson.Huang@nxp.com>
 <20190704061403.8249-2-Anson.Huang@nxp.com>
 <DB7PR04MB50519C02D90675070F21501DEEFA0@DB7PR04MB5051.eurprd04.prod.outlook.com>
 <20190708082511.py7gnjbqyp7bnhqx@vireshk-i7>
 <DB3PR0402MB391622133CD116FDE26A4F9AF5F60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190708084957.waiwdun327pgvfv4@vireshk-i7>
 <DB3PR0402MB39164E2F386181255ED37F45F5F60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39164E2F386181255ED37F45F5F60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Leonard Crestez <leonard.crestez@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kern>
List-Id: devicetree@vger.kernel.org

On 08-07-19, 08:54, Anson Huang wrote:
> Each OPP has "opp-supported-hw" property as below, the first value needs to be
> checked with speed grading fuse, and the second one needs to be checked with
> market segment fuse, ONLY both of them passed, then this OPP is supported. It
> calls dev_pm_opp_set_supported_hw() to tell OPP framework to parse the OPP
> table, this is my understanding.
> 
> opp-supported-hw = <0x8>, <0x3>;

Right, so that's what I was expecting.

One thing we can do is change the binding of OPP core a bit to allow
multiple OPP nodes to contain the "opp-suspend" property and select
the one finally with the highest frequency. That would be a better as
a generic solution IMO.

And then a small OPP core patch will fix it.

-- 
viresh
