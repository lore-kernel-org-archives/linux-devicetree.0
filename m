From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use
 rgmii-id
Date: Thu, 21 Mar 2019 13:43:11 +0100
Message-ID: <1553172191.4806.38.camel@pengutronix.de>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
         <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com>
         <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
         <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
         <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
         <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Support Opensource <Support.Opensource@diasemi.com>, DEVICETREE <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Steve Twiss <stwiss.opensource@diasemi.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 21.03.2019, 08:17 -0300 schrieb Fabio Estevam:
> Hi Abel,
> 
> > On Thu, Mar 21, 2019 at 5:42 AM Abel Vesa <abel.vesa@nxp.com> wrote:
> 
> > > It seems we have other boards that need to be fixed and we can not
> > > have an old dtb with functional Ethernet with a new kernel.
> > > 
> > > Does anyone know if this issue is AR8031 specific?
> > 
> > I can confirm the same fix is works on imx6sx too.
> 
> imx6sx-sabresd also uses an AR8031 Ethernet PHY.
> 
> I also tested that changing the phy-mode to "rgmii-id" fixes Ethernet
> on pico-imx7d with AR8035.
> 
> So yes, we currently have lots of broken dtb's in mainline and I am
> wondering what is the proper fix here.

Fix the DT. It's unfortunate the a kernel and DT bug canceled each
other out, but if the DT is clearly broken and fixing it in a backward
compatible way is not really feasible, I would argue that we should
treat a DT bug like any other bug.

Regards,
Lucas
