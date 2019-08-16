From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V6 4/4] arm64: dts: imx8mm: Enable cpu-idle driver
Date: Fri, 16 Aug 2019 10:37:00 +0000
Message-ID: <DB3PR0402MB3916E00B69BD67098F1875FBF5AF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1565915925-21009-1-git-send-email-Anson.Huang@nxp.com>
 <1565915925-21009-4-git-send-email-Anson.Huang@nxp.com>
 <e62d26b9-8c9b-644f-d2b3-485586e07e35@linaro.org>
 <DB3PR0402MB3916E469219C7CC68D55C90AF5AF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB3PR0402MB3916E469219C7CC68D55C90AF5AF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
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
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Jun Li <jun.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.inf>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

> > On 16/08/2019 02:38, Anson Huang wrote:
> > > Enable i.MX8MM cpu-idle using generic ARM cpu-idle driver, 2 states
> > > are supported, details as below:
> > >
> > > root@imx8mmevk:~# cat
> > /sys/devices/system/cpu/cpu0/cpuidle/state0/name
> > > WFI
> > > root@imx8mmevk:~# cat
> > > /sys/devices/system/cpu/cpu0/cpuidle/state0/usage
> > > 3973
> > > root@imx8mmevk:~# cat
> > /sys/devices/system/cpu/cpu0/cpuidle/state1/name
> > > cpu-pd-wait
> > > root@imx8mmevk:~# cat
> > > /sys/devices/system/cpu/cpu0/cpuidle/state1/usage
> > > 6647
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> >
> > Hi Anson,
> >
> > I've applied the patches 1-3 but this one does not apply.
> 
> Thanks.
> 
> >
> > You can either respin it against tip/timers/core and take it through
> > Shawn's tree. If the later, you can add my Acked-by.
> 
> Hi, Shawn
> 	Can you take this patch and add below Acked-by? It should can be
> applied to your tree directly.
> 
> 	Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Sorry that I just found this patch can NOT be applied to your for-next tree neither, so
I redo the patch against your for-next tree, so you can just skip this patch series now
(as Daniel already picked the rest 3 patches) and take that patch I just sent, link as below:

https://patchwork.kernel.org/patch/11097471/

Thanks,
Anson
