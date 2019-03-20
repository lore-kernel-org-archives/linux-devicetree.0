From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use rgmii-id
Date: Wed, 20 Mar 2019 14:04:42 -0300
Message-ID: <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
 <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com> <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

Hi Steve,

[Adding Andrew]

On Wed, Mar 20, 2019 at 1:03 PM Steve Twiss
<stwiss.opensource@diasemi.com> wrote:
>
> Hi Fabio,
>
> On 20 March 2019 12:17, Fabio Estevam wrote:
> > Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use rgmii-id
> >
> > Hi Steve,
> >
> > On Wed, Mar 20, 2019 at 9:06 AM Steve Twiss
> > <stwiss.opensource@diasemi.com> wrote:
> > >
> > > The PHY used on the Freescale i.MX6Q/DL SABRE boards is qualified as
> > > 'rgmii' instead of 'rgmii-id'. Meaning the RX and TX delays that were
> >
> > This patch declares it as 'rgmii-id', which contradicts the commit log.
>
> The PHY used on the Freescale i.MX6Q/DL SABRE boards is qualified as
> 'rgmii' instead of 'rgmii-id'.
>
> Can that be read two ways?
> I meant the phy-mode is currently qualified as 'rgmii' instead of what it
> should be: 'rgmii-id'.

Thanks for the clarification.

>
> [...]
>
> > > This patch fixes the network problems seen on the Freescale i.MX6Q/DL
> >
> > Please provide a Fixes tag. It would be good to know if this fix needs
> > to be applied to older kernels.
>
> I didn't put a Fixes tag in because I find this patch fixes v5.1-rc1 (which I see as broken).
> But the patch is not needed in v5.0 because I see that as working.
> So didn't see the need for a Cc: stable.

It seems we have other boards that need to be fixed and we can not
have an old dtb with functional Ethernet with a new kernel.

Does anyone know if this issue is AR8031 specific?

Thanks
