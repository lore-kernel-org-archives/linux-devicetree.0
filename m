From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for
 IMX8MQ_CLK_TMU_ROOT
Date: Sun, 28 Jul 2019 09:58:58 +0200
Message-ID: <20190728075858.GA15144@bogon.m.sigxcpu.org>
References: <20190705045612.27665-1-Anson.Huang@nxp.com>
 <20190705045612.27665-5-Anson.Huang@nxp.com>
 <CAEnQRZAZNMBx3ApVmRP8hYPw0XY_QgR-saE6WLcT8oZmHPCxSA@mail.gmail.com>
 <20190727182636.GA7170@bogon.m.sigxcpu.org>
 <CAOMZO5C_g5bO-yqhoLbb6geUcmzi4necjdQ_P2tROq2vzEPOqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5C_g5bO-yqhoLbb6geUcmzi4necjdQ_P2tROq2vzEPOqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <ccaione@baylibre.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Leonard Crestez <leonard.crestez@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, dl-linux-imx <Linux-imx@nxp.com>, "rui.zhang" <rui.zhang@intel.com>, Michael Turquette <mturquette@baylibre.com>, Devicetree List <devicetree@vger.kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ste
List-Id: devicetree@vger.kernel.org

Hi Fabio,
On Sat, Jul 27, 2019 at 05:17:50PM -0300, Fabio Estevam wrote:
> Hi Guido,
> 
> On Sat, Jul 27, 2019 at 3:26 PM Guido Günther <agx@sigxcpu.org> wrote:
> 
> > I noticed a boot hang yesterday on next-20190726 when loading the
> > qoriq_thermal which I worked around by blacklisting it. The
> > fsl,imx8mq-tmu node specifies a clock (IMX8MQ_CLK_TMU_ROOT) but does not
> > seem to enable, shouldn't it do so?
> 
> Yes, I think you are right.
> 
> I don't have access to a imx8mq board at the moment, but something
> like below would probably help:
> http://code.bulix.org/pd88jp-812381
> 
> If it helps, I can send it as a formal patch.

Yes, this fixes it for me, thanks!
 -- Guido
