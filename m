From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT
Date: Sat, 27 Jul 2019 17:17:50 -0300
Message-ID: <CAOMZO5C_g5bO-yqhoLbb6geUcmzi4necjdQ_P2tROq2vzEPOqQ@mail.gmail.com>
References: <20190705045612.27665-1-Anson.Huang@nxp.com> <20190705045612.27665-5-Anson.Huang@nxp.com>
 <CAEnQRZAZNMBx3ApVmRP8hYPw0XY_QgR-saE6WLcT8oZmHPCxSA@mail.gmail.com> <20190727182636.GA7170@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727182636.GA7170@bogon.m.sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <ccaione@baylibre.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Leonard Crestez <leonard.crestez@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, dl-linux-imx <Linux-imx@nxp.com>, "rui.zhang" <rui.zhang@intel.com>, Michael Turquette <mturquette@baylibre.com>, Devicetree List <devicetree@vger.kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ste
List-Id: devicetree@vger.kernel.org

Hi Guido,

On Sat, Jul 27, 2019 at 3:26 PM Guido G=C3=BCnther <agx@sigxcpu.org> wrote:

> I noticed a boot hang yesterday on next-20190726 when loading the
> qoriq_thermal which I worked around by blacklisting it. The
> fsl,imx8mq-tmu node specifies a clock (IMX8MQ_CLK_TMU_ROOT) but does not
> seem to enable, shouldn't it do so?

Yes, I think you are right.

I don't have access to a imx8mq board at the moment, but something
like below would probably help:
http://code.bulix.org/pd88jp-812381

If it helps, I can send it as a formal patch.

Regards,

Fabio Estevam
