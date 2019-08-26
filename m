From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH V3 1/5] thermal: qoriq: Add clock operations
Date: Mon, 26 Aug 2019 14:45:40 +0000
Message-ID: <VI1PR04MB7023F219CA7B4187F86EAA42EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Eduardo Valentin <edubezval@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

On 7/30/2019 5:31 AM, Anson.Huang@nxp.com wrote:=0A=
> From: Anson Huang <Anson.Huang@nxp.com>=0A=
> =0A=
> Some platforms like i.MX8MQ has clock control for this module,=0A=
> need to add clock operations to make sure the driver is working=0A=
> properly.=0A=
> =0A=
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>=0A=
> Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>=0A=
=0A=
This series looks good, do you think it can be merged in time for v5.4? =0A=
Today was v5.3-rc6.=0A=
=0A=
In an earlier series the CLK_IS_CRITICAL flags was removed from the TMU =0A=
clock so if the thermal driver doesn't explicitly enable it the system =0A=
will hang on probe. This is what happens in linux-next right now!=0A=
=0A=
Unless this patches is merged soon we'll end up with a 5.4-rc1 that =0A=
doesn't boot on imx8mq. An easy fix would be to drop/revert commit =0A=
951c1aef9691 ("clk: imx8mq: Remove CLK_IS_CRITICAL flag for =0A=
IMX8MQ_CLK_TMU_ROOT") until the thermal patches are accepted.=0A=
=0A=
Merging patches out-of-order when they have hard (boot-breaking) =0A=
dependencies also breaks bisect.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
