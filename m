From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 6/8] arm64: dts: imx: add imx8qxp support
Date: Thu, 25 Oct 2018 11:40:12 +0000
Message-ID: <AM0PR04MB421126852CF634123B17589180F70@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539886483-15775-1-git-send-email-aisheng.dong@nxp.com>
 <1539886483-15775-7-git-send-email-aisheng.dong@nxp.com>
 <20181018202457.GA25174@bogus>
 <DB7PR04MB42188ABE426A055E6097C03080F90@DB7PR04MB4218.eurprd04.prod.outlook.com>
 <CAPDyKFpYXo21fsHynZWTV9OOoCWGUJe2SZBR-A-dc8T8g3cLrg@mail.gmail.com>
 <AM0PR04MB4211E163C5AF713142C56A5A80F50@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CAPDyKFo=gt5eB2B8muA1iVJSin2CJsQ19zeL9pm==Ln73pFSfQ@mail.gmail.com>
 <AM0PR04MB421187B2BA549B04B67553E780F70@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CAPDyKFoxuRaYyYHqA=hWKQpQAbQ3HCDx+dtzSaePm0T7_j6p1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPDyKFoxuRaYyYHqA=hWKQpQAbQ3HCDx+dtzSaePm0T7_j6p1g@mail.gmail.com>
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
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Jon Hunter <jonathanh@nvidia.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Ulf Hansson [mailto:ulf.hansson@linaro.org]
> Sent: Thursday, October 25, 2018 7:31 PM
[...]
> + Jon
> 
> [...]
> 
> >>
> >> In regards to model the HW correctly. I don't believe your HW
> >> topology have each PWM block, GPIO block, etc, in their own gate-able
> power domain, right?
> >> Or is it so?
> >>
> >
> > First of all, thanks for your and Rob's good suggestions.
> > I spent a lot more time to do research to try to make it better
> > according to your suggestions. Some of your ideas absolutely helped me
> > a lot and gave me some inspirations.
> >
> > Some new findings are that some of our power domains are organized in
> > a tree was because the kernel does not support multi-power domains for one
> device.
> > but from HW point of view, they're identical.
> > You can more serious situation from local tree at here:

[...]

> >
> > I just found your following patch perfectly addressed our issue as we
> > do have many Devices requires to handle multi power domains.
> > 3c095f32a92b PM / Domains: Add support for multi PM domains per device
> > to genpd e.g. For LVDS devices, it need both LVDS and DC(Display controller)
> PD to work.
> 
> Thanks for letting me know about further use cases about multiple PM domain
> per device. Very interesting.
> 
> >
> > Now i was trying to understand all of our current user case with the
> > team, If all of them do not need a tree to address dependency issue, I may
> remove them all from device tree.
> > Then it would be much more clearer than before and be something like what
> Tegra does.
> > include/dt-bindings/power/tegra186-powergate.h
> > drivers/soc/tegra/powergate-bpmp.c
> 
> Yes!
> 
> >
> > For example, 1 #power-domain-cells will be enough. The first cell can
> > be a global SCU power domain and the 2nd cell the device ID.
> > Hopefully this can be what you and Rob want.
> >
> > If any good suggestions please let me know.
> 
> It makes perfect sense!
> 
> In regards to deploy support for multiple PM domains per device, you may
> have a look at the recent work done Jon Hunter for the Tegra xHCI genpd
> support [1].
> 

Thanks for sharing this info.
Will investigate it.

Regards
Dong Aisheng

> [...]
> 
> Kind regards
> Uffe
