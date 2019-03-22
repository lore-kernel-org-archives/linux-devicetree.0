From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use
 rgmii-id
Date: Fri, 22 Mar 2019 11:59:59 +0100
Message-ID: <20190322105959.GD24801@lunn.ch>
References: <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
 <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
 <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
 <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
 <20190322011155.GO12513@dragon>
 <CAOMZO5CBjG_xZWjZof_VOKaLLOCxFz3g7Gz1uTVzD=D5GeQb4g@mail.gmail.com>
 <20190322021521.GY12513@dragon>
 <CAOMZO5CRRg9XD9VovcO5+fdM1DBp12P33T9xgW=cEvTES8yDPA@mail.gmail.com>
 <db0a3a96-d836-f7bd-4773-81fcb7984835@ysoft.com>
 <DB7PR10MB2348358D285E2560F5B5E699FE430@DB7PR10MB2348.EURPRD10.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB7PR10MB2348358D285E2560F5B5E699FE430@DB7PR10MB2348.EURPRD10.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

> There is a way of doing this to preserve backwards compatibility I think.
> Maybe deprecating the previous DTS phy-mode and replacing it with a new one,
> phy-mode-v2 instead?

Hi Steve

It needs to be a vendor specific property, atheros,phy-mode, for
example.

   Andrew
