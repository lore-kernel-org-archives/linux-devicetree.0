From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/2] reset: imx7: Add support for i.MX8MM SoC
Date: Thu, 4 Jul 2019 09:09:18 +0000
Message-ID: <DB3PR0402MB3916D53E9BD277C2152F7261F5FA0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190701093944.5540-1-Anson.Huang@nxp.com>
 <1562230444.6641.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562230444.6641.2.camel@pengutronix.de>
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
To: Philipp Zabel <p.zabel@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Philipp

> On Mon, 2019-07-01 at 17:39 +0800, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > i.MX8MM SoC has a subset of i.MX8MQ IP block variant, it can reuse the
> > i.MX8MQ reset controller driver and just skip those non-existing IP
> > blocks, add support for i.MX8MM SoC reset control.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  drivers/reset/reset-imx7.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
> > index 3ecd770..941131f 100644
> > --- a/drivers/reset/reset-imx7.c
> > +++ b/drivers/reset/reset-imx7.c
> > @@ -207,6 +207,26 @@ static int imx8mq_reset_set(struct
> reset_controller_dev *rcdev,
> >  	const unsigned int bit = imx7src->signals[id].bit;
> >  	unsigned int value = assert ? bit : 0;
> >
> > +	if (of_machine_is_compatible("fsl,imx8mm")) {
> 
> This should be checked once during probe, not in every reset_set, if this
> check has to be made at all. On i.MX8MM these unused reset controls are
> not going to be hooked up via phandle, so this function should never be
> called with the values that are filtered out here anyway.
> And in case somebody makes an error in the device tree, does writing 1 to
> the reserved bits on i.MX8MM have any negative side effects at all?
> Or are these bits just not hooked up? If this is no problem, I assume this
> patch is not needed at all.

I just tried it on i.MX8MM, read/write to the reserved registers looks like OK,
so this patch can be ignored, although accessing reserved registers is NOT good,
but the user should have correct settings in DT, there will be no access for these
reserved registers.

So, let's just ignore this patch, adding the fallback compatible should be good for
i.MX8MM to reuse this driver.

Thanks,
Anson 

> 
> The correct way to protect against DT writers hooking up the non- existing
> reset lines would be to replace rcdev.of_xlate with a version that returns -
> EINVAL for them on i.MX8MM. Also in that case I'd check the reset-controller
> compatible, not the machine compatible.
> 
> > +		switch (id) {
> > +		case IMX8MQ_RESET_HDMI_PHY_APB_RESET:
> > +		case IMX8MQ_RESET_PCIEPHY2: /* fallthrough */
> > +		case IMX8MQ_RESET_PCIEPHY2_PERST: /* fallthrough */
> > +		case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN: /* fallthrough
> */
> > +		case IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF: /*
> fallthrough */
> > +		case IMX8MQ_RESET_MIPI_CSI1_CORE_RESET: /* fallthrough
> */
> > +		case IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET: /*
> fallthrough */
> > +		case IMX8MQ_RESET_MIPI_CSI1_ESC_RESET: /* fallthrough
> */
> > +		case IMX8MQ_RESET_MIPI_CSI2_CORE_RESET: /* fallthrough
> */
> > +		case IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET: /*
> fallthrough */
> > +		case IMX8MQ_RESET_MIPI_CSI2_ESC_RESET: /* fallthrough
> */
> > +		case IMX8MQ_RESET_DDRC2_PHY_RESET: /* fallthrough */
> > +		case IMX8MQ_RESET_DDRC2_CORE_RESET: /* fallthrough */
> > +		case IMX8MQ_RESET_DDRC2_PRST: /* fallthrough */
> 
> I think it would make sense to add IMX8MM_RESET_* defines for all but
> these, to avoid confusion when reading the imx8mm.dtsi
> 
> regards
> Philipp
