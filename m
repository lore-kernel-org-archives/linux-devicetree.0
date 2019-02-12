From: Zhi Li <lznuaa@gmail.com>
Subject: Re: [PATCH V2 2/4] arm64: dts: imx8qxp: added ddr performance monitor
 nodes
Date: Tue, 12 Feb 2019 15:08:38 -0600
Message-ID: <CAHrpEqRMyieoSxqLx=R4Vj-LL4+0ZxM_FXeFimd=cgGRJFsbKQ@mail.gmail.com>
References: <1550005119-25750-1-git-send-email-Frank.Li@nxp.com>
 <1550005119-25750-2-git-send-email-Frank.Li@nxp.com>
 <CAOMZO5AtXz8Gyh6yBzVWWiKfSVVtSAArd52LbW=a3kszZ27iOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5AtXz8Gyh6yBzVWWiKfSVVtSAArd52LbW=a3kszZ27iOQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 3:04 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Tue, Feb 12, 2019 at 6:59 PM Frank Li <frank.li@nxp.com> wrote:
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 4c3dd95..243d7b3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -79,6 +79,13 @@
> >                 interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >         };
> >
> > +       ddr_pmu0: ddr_pmu@5c020000 {
>
> It seems you ignored the commend I made in the previous version.
>
> Here it goes again:
>
> Underscores should not be used in node names. You could use
> pmu@5c020000 instead.

Sorry, I missed this.
how about ddr-pmu0

pmu is already used by arm pmu

best regards
Frank Li
