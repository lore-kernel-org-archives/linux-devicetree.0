From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Date: Tue, 11 Jun 2019 20:45:31 +0000
Message-ID: <1560285930.2354.8.camel@impinj.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
 <20190611063333.48501-2-Anson.Huang@nxp.com>
 <CAOMZO5BCuBKHs1jXkm3qFD84_xcB=0NSwE3SLJHx9kq4Stbd_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BCuBKHs1jXkm3qFD84_xcB=0NSwE3SLJHx9kq4Stbd_A@mail.gmail.com>
Content-Language: en-US
Content-ID: <DC1328CED465FC4189CCE1BF075530CC@namprd06.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "festevam@gmail.com" <festevam@gmail.com>, "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>
Cc: "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "daniel.baluta@nxp.com" <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Linux-imx@nxp.com" <Linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "peng.fan@nxp.com" <peng.fan@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-06-11 at 17:32 -0300, Fabio Estevam wrote:
> Hi Anson,
> 
> On Tue, Jun 11, 2019 at 3:31 AM <Anson.Huang@nxp.com> wrote:
> > 
> > From: Anson Huang <Anson.Huang@nxp.com>
> > 
> > i.MX system controller RTC driver can support all i.MX SoCs
> > with system controller inside, this patch makes the compatible
> > string more generic to support other i.MX SoCs with system
> > controller inside, such as i.MX8QM etc..
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  drivers/rtc/rtc-imx-sc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
> > index c933045..38ef3ca 100644
> > --- a/drivers/rtc/rtc-imx-sc.c
> > +++ b/drivers/rtc/rtc-imx-sc.c
> > @@ -178,7 +178,7 @@ static int imx_sc_rtc_probe(struct
> > platform_device *pdev)
> >  }
> > 
> >  static const struct of_device_id imx_sc_dt_ids[] = {
> > -       { .compatible = "fsl,imx8qxp-sc-rtc", },
> > +       { .compatible = "fsl,imx-sc-rtc", },
> 
> What is wrong with the current compatible string?
> 
> If you want to support i.MX8QM just add in its dtsi:
> 
> compatible = "fsl,imx8qm-sc-rtc", "fsl,imx8qxp-sc-rtc"
> 
> and add a dt-bindings entry for "fsl,imx8qm-sc-rtc"

Yes, I thought this is (was?) the recommended practice for IP blocks in
SoCs that don't have their own version (vs something like a Synopsis
block used many places):

* Use the first SoC to have the block as the base compatible for the
block.
* Always add the current SoC, in additional to the base, in the SoC's
dts's list of compatibles.  Even if unneeded at the present.
* The driver will list the base compatible in the match table, and will
add new ones for specific socs if/when there is a need for it.
