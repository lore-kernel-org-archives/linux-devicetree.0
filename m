From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use
 rgmii-id
Date: Fri, 22 Mar 2019 11:20:44 +0100
Message-ID: <db0a3a96-d836-f7bd-4773-81fcb7984835@ysoft.com>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
 <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com>
 <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
 <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
 <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
 <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
 <20190322011155.GO12513@dragon>
 <CAOMZO5CBjG_xZWjZof_VOKaLLOCxFz3g7Gz1uTVzD=D5GeQb4g@mail.gmail.com>
 <20190322021521.GY12513@dragon>
 <CAOMZO5CRRg9XD9VovcO5+fdM1DBp12P33T9xgW=cEvTES8yDPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5CRRg9XD9VovcO5+fdM1DBp12P33T9xgW=cEvTES8yDPA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Abel Vesa <abel.vesa@nxp.com>, Steve Twiss <stwiss.opensource@diasemi.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On 22. 03. 19 3:24, Fabio Estevam wrote:
> On Thu, Mar 21, 2019 at 11:15 PM Shawn Guo <shawnguo@kernel.org> wrote:
> 
>>> Unfortunately, just by looking at the dts files we do not know if a
>>> board uses an AR803x PHY or not, so I am afraid we can not do an
>>> automatic conversion.
>>
>> At least for those we already know?
> 
> Yes, I can help preparing a patch that fixes the i.MX boards we know
> use AR8031 PHY.

AFACT this issue is not AR803x specific. I was hit by the same problem
with QCA833x switch on imx6dl-yapp4. Though, we are currently the only
platform in tree using this chip and Shawn already has the fix in his tree.

I am not aware of any other PHY drivers that my cause problems.

$ git log --oneline v5.0..v5.1-rc1 --grep=RGMII --author=Vinod -- drivers/net/
6d4cd041f0af net: phy: at803x: disable delay only for RGMII mode
a968b5e9d587 net: dsa: qca8k: Enable delay for RGMII_ID mode
5ecdd77c61c8 net: dsa: qca8k: disable delay for RGMII mode
cd28d1d6e52e net: phy: at803x: Disable phy delay for RGMII mode

Michal
