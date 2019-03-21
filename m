From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use
 rgmii-id
Date: Thu, 21 Mar 2019 12:45:44 +0100
Message-ID: <20190321114544.GG2900@lunn.ch>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
 <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com>
 <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
 <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
 <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
 <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Abel Vesa <abel.vesa@nxp.com>, Steve Twiss <stwiss.opensource@diasemi.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2019 at 08:17:01AM -0300, Fabio Estevam wrote:
> Hi Abel,
> 
> On Thu, Mar 21, 2019 at 5:42 AM Abel Vesa <abel.vesa@nxp.com> wrote:
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
> 
> Does anyone know what was the kernel commit that introduced such regressions?

Hi Fabio

The problem here is, all the DTs were broken since day 0. However,
because the PHY driver was also broken, nobody noticed and it
worked. Now that the PHY driver has been fixed, all the bugs in the
DTs now become an issue.

There is also a need to fix the PHY driver, because there is at least
one board which needs it fixed in order to work.

When we discussed fixing the PHY driver, we had no idea how many
boards would break. So we said, lets try it, and fix up whatever
breaks. We can however discuss this again. We can declare both the PHY
driver and the DTs terminally broken, and add a vendor proprietary
property for the phy-mode, which takes preference over the standard
phy-mode if present, and that does the correct thing.

    Andrew
