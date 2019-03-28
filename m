From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8qxp: Add EDMA0/EDMA1 nodes
Date: Thu, 28 Mar 2019 10:53:59 +0200
Message-ID: <CAEnQRZB8f4rHhsUoefKUB6PN_aRPtSB4y8O_D8N0_s-Zq0_8Vw@mail.gmail.com>
References: <20190327190244.9208-1-daniel.baluta@nxp.com>
 <20190327190244.9208-3-daniel.baluta@nxp.com>
 <AM0PR04MB4211B89650EA1AC9133F4EBE80590@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211B89650EA1AC9133F4EBE80590@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, Teo Hall <teo.hall@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, yibin.gong@nxp.com, "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 4:32 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Daniel Baluta
> > Sent: Thursday, March 28, 2019 3:03 AM
> >
> > i.MX8QXP contains a total of 4 EDMA controllers of which two are primarily
> > for audio components and the other two are for non-audio periperhals.
> >
> > This patch adds the EDMA0/EDMA1 nodes used by audio peripherals.
> >
> > EDMA0 contains channels for:
> >       * ASRC0
> >       * ESAI0
> >       * SPDIF0
> >       * SAI0, SAI1, SAI2, SAI3
> >
> > EDMA1 contains channels for:
> >       * ASRC1
> >       * SAI4, SAI5
> >
> > See chapter Audio DMA Memory Maps (2.2.3) from i.MX8QXP RM [1]
> >
> > This patch is based on the dtsi file initially submitted by Teo Hall in i.MX NXP
> > internal tree.
> >
> > [1] https://www.nxp.com/docs/en/reference-manual/IMX8DQXPRM.pdf
> >
> > Cc: Teo Hall <teo.hall@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 72
> > ++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 0cb939861a60..84c7c3eca1a1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -182,6 +182,78 @@
> >                       #clock-cells = <1>;
> >               };
> >
> > +             edma0: dma-controller@591f0000 {
> > +                     compatible = "fsl,imx8qxp-edma";
> > +                     reg = <0x59200000 0x10000>,   /* asrc0 pair A input req */
> > +                             <0x59210000 0x10000>, /* asrc0 pair B input req */
> > +                             <0x59220000 0x10000>, /* asrc0 pair C input req */
> > +                             <0x59230000 0x10000>, /* asrc0 pair A output req */
> > +                             <0x59240000 0x10000>, /* asrc0 pair B output req */
> > +                             <0x59250000 0x10000>, /* asrc0 pair C output req */
> > +                             <0x59260000 0x10000>, /* esai0 rx */
> > +                             <0x59270000 0x10000>, /* esai0 tx */
> > +                             <0x59280000 0x10000>, /* spdif0 rx */
> > +                             <0x59290000 0x10000>, /* spdif0 tx */
> > +                             <0x592c0000 0x10000>, /* sai0 rx */
> > +                             <0x592d0000 0x10000>, /* sai0 tx */
> > +                             <0x592e0000 0x10000>, /* sai1 rx */
> > +                             <0x592f0000 0x10000>, /* sai1 tx */
> > +                     #dma-cells = <3>;
>
> In binding doc, it's 2.
> - #dma-cells : Must be <2>.
>         The 1st cell specifies the DMAMUX(0 for DMAMUX0 and 1 for DMAMUX1).
>         Specific request source can only be multiplexed by specific channels
>         group called DMAMUX.
>         The 2nd cell specifies the request source(slot) ID.
>
> Need update binding doc?
>
> > +                     shared-interrupt;
>
> Undocumented property?
>
> Checkpatch did not complain?

Thanks Aisheng for this comment. I think we might need to delay a little bit
this patch because (as pointed by Yibin) on i.MX8 QXP/QM we use
fsl-edma-v3 which *is not* yet upstream.

So, lets get back to adding the nodes after Yibin sends edma-v3 patches.

thanks,
Daniel.
