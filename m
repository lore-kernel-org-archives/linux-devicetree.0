From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use
 rgmii-id
Date: Fri, 22 Mar 2019 10:15:22 +0800
Message-ID: <20190322021521.GY12513@dragon>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
 <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com>
 <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
 <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
 <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
 <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
 <20190322011155.GO12513@dragon>
 <CAOMZO5CBjG_xZWjZof_VOKaLLOCxFz3g7Gz1uTVzD=D5GeQb4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5CBjG_xZWjZof_VOKaLLOCxFz3g7Gz1uTVzD=D5GeQb4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Abel Vesa <abel.vesa@nxp.com>, Steve Twiss <stwiss.opensource@diasemi.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2019 at 11:00:18PM -0300, Fabio Estevam wrote:
> Hi Shawn,
> 
> On Thu, Mar 21, 2019 at 10:12 PM Shawn Guo <shawnguo@kernel.org> wrote:
> 
> > > So yes, we currently have lots of broken dtb's in mainline and I am
> > > wondering what is the proper fix here.
> >
> > So can we have a single patch fixing all broken i.MX DTBs?
> 
> Unfortunately, just by looking at the dts files we do not know if a
> board uses an AR803x PHY or not, so I am afraid we can not do an
> automatic conversion.

At least for those we already know?

Shawn
