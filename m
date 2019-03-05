From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 3/3] arm64: dts: imx: Add i.mx8mm evk basic dts support
Date: Tue, 5 Mar 2019 01:25:23 +0000
Message-ID: <VI1PR0402MB3519CBE560D306A1A884EE6187720@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1551691021-31505-1-git-send-email-ping.bai@nxp.com>
 <1551691021-31505-3-git-send-email-ping.bai@nxp.com>
 <CAGUNXRRerSaEW_2nbK8bOgLM+SQLyhk9+HuL1tAZbtLD8=optw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGUNXRRerSaEW_2nbK8bOgLM+SQLyhk9+HuL1tAZbtLD8=optw@mail.gmail.com>
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
To: Chris Spencer <spencercw@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH 3/3] arm64: dts: imx: Add i.mx8mm evk basic dts support
> 
> Hi Jacky,
> 
> On Mon, 4 Mar 2019 at 09:13, Jacky Bai <ping.bai@nxp.com> wrote:
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> b/arch/arm64/boot/dts/freescale/Makefile
> > index 13604e5..27286f6 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -22,3 +22,5 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) +=
> fsl-lx2160a-rdb.dtb
> >
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
> 
> You have duplicated the imx8mq-evk line here.
> 

Sorry, it is my fault when resolve the rebase conflict. Will fix it in v2.

BR
Jacky Bai
> Thanks,
> Chris
