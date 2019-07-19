From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: dsp: fsl: Add DSP core binding support
Date: Fri, 19 Jul 2019 09:34:34 +0300
Message-ID: <CAEnQRZC+LyoZ_C3_0RVgRpBFVMuMT26KPVZunqqNKC=OJcERog@mail.gmail.com>
References: <20190718151346.3523-1-daniel.baluta@nxp.com>
 <20190718151346.3523-4-daniel.baluta@nxp.com>
 <CAL_JsqJ6o9mTjLYjnfcYgfSFKb95W8FseZBBb8RLosB__GNBcw@mail.gmail.com>
 <CAEnQRZBubFz90Xf8irDwc=erTXmByXX4rkzZy9r8ymfAuQEsZA@mail.gmail.com>
 <VI1PR04MB5055597B7C3AC114FEB7E3E5EEC80@VI1PR04MB5055.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB5055597B7C3AC114FEB7E3E5EEC80@VI1PR04MB5055.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <frank.li@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Olaru <paul.olaru@nxp.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 9:40 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:
>
> On 18.07.2019 21:24, Daniel Baluta wrote:
> > On Thu, Jul 18, 2019 at 7:41 PM Rob Herring <robh+dt@kernel.org> wrote:
> >>
> >> On Thu, Jul 18, 2019 at 9:13 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
> >>>
> >>> This describes the DSP device tree node.
> >>>
> >>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> >>> +  power-domains:
> >>> +    description:
> >>> +      List of phandle and PM domain specifier as documented in
> >>> +      Documentation/devicetree/bindings/power/power_domain.txt
> >>
> >> How many? 4?
> >
> > Yes, 4 for i.MX8QXP. Also, the same number is for i.MX8QM. Anyhow, I didn't
> > added added a limit here because I really don't know how many will be
> > in upcoming i.MX platforms.
>
> Which 4? It might help to use power-domain-names explicitly just like
> it's done for clocks and mboxes.
>
> This is very common for phandle lists.

4 like in the example at the bottom of the patch:

+   power-domains = <&pd IMX_SC_R_MU_13A>,
+                        <&pd IMX_SC_R_MU_13B>,
+                        <&pd IMX_SC_R_DSP>,
+                        <&pd IMX_SC_R_DSP_RAM>;

Not sure if it makes sense to use power-domain-names as the driver parses
directly the "power-domains" property.
