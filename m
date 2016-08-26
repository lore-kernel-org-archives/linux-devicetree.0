From: Yongcai Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 3/3] ARM: imx: add SMP support for i.MX7D
Date: Fri, 26 Aug 2016 10:28:15 +0000
Message-ID: <AM3PR04MB1315EF67563EFA9F9B8450E4F5EC0@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1472209971-32469-1-git-send-email-Anson.Huang@nxp.com>
 <1472209971-32469-4-git-send-email-Anson.Huang@nxp.com>
 <3283479.PKRDjkX0Md@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3283479.PKRDjkX0Md@wuerfel>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



Best Regards!
Anson Huang



> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: 2016-08-26 4:59 PM
> To: Yongcai Huang <anson.huang@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; shawnguo@kernel.org; kernel@pengutronix.de;
> Fabio Estevam <fabio.estevam@nxp.com>; robh+dt@kernel.org;
> mark.rutland@arm.com; linux@armlinux.org.uk
> Subject: Re: [PATCH 3/3] ARM: imx: add SMP support for i.MX7D
> 
> On Friday, August 26, 2016 7:12:51 PM CEST Anson Huang wrote:
> > i.MX7D has 2 cortex-a7 ARM core, add support for booting up SMP kernel
> > with 2 CPUs.
> >
> > The existing i.MX SMP code is designed for i.MX6 series SoCs which
> > have cortex-a9 ARM core, but i.MX7D has 2 cortex-a7 ARM core, so we
> > need to add runtime check for those differences between cortex-a9 and
> > cortex-a7.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> >
> 
> Can't you just point i.MX7D to start from secondary_startup rather than
> v7_secondary_startup?
> 
>  ENTRY(v7_secondary_startup)
> +       .word   0xc070                  @ 0xc07 is cortex-a7 id
> +       .word   0xfff0                  @ mask for core type
> +
> 
> This looks like you are trying to execute instructions that are actually data. Does
> this work?
> 
> On a side note, could you rename v7_secondary_startup to
> imx6_secondary_startup? The name sounds overly generic on a multiplatform
> kernel.
> 
> 	Arnd


Thanks for review, yes, I made a mistake here, the data should put in another place,
but it accidently can work and boot up secondary CPU (see below the objdump),
 and also, I can just use  secondary_startup for i.MX7D. So I will
leave this file untouched, will verify the function next Mon and send out a V2 patch.

10 00000004 <v7_secondary_startup>:
 11    4:   0000c070        andeq   ip, r0, r0, ror r0
 12    8:   0000fff0        strdeq  pc, [r0], -r0

Anson.
