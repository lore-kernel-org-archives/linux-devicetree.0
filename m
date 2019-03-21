From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use rgmii-id
Date: Thu, 21 Mar 2019 08:17:01 -0300
Message-ID: <CAOMZO5Cz0A19P9E61dy79BFF+V2WsAjobqQ1g9TeiJSCY2Nt4A@mail.gmail.com>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
 <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com>
 <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
 <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com> <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Steve Twiss <stwiss.opensource@diasemi.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

Hi Abel,

On Thu, Mar 21, 2019 at 5:42 AM Abel Vesa <abel.vesa@nxp.com> wrote:

> > It seems we have other boards that need to be fixed and we can not
> > have an old dtb with functional Ethernet with a new kernel.
> >
> > Does anyone know if this issue is AR8031 specific?
>
> I can confirm the same fix is works on imx6sx too.

imx6sx-sabresd also uses an AR8031 Ethernet PHY.

I also tested that changing the phy-mode to "rgmii-id" fixes Ethernet
on pico-imx7d with AR8035.

So yes, we currently have lots of broken dtb's in mainline and I am
wondering what is the proper fix here.

Does anyone know what was the kernel commit that introduced such regressions?
