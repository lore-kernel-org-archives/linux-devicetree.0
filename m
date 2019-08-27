From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH V3 1/5] thermal: qoriq: Add clock operations
Date: Tue, 27 Aug 2019 12:41:37 +0000
Message-ID: <VI1PR04MB7023773DD477FF89E2D2181CEEA00@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
 <VI1PR04MB7023F219CA7B4187F86EAA42EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <AM6PR0402MB3911D45B3B148588A582F6C4F5A00@AM6PR0402MB3911.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

On 27.08.2019 04:51, Anson Huang wrote:=0A=
>> In an earlier series the CLK_IS_CRITICAL flags was removed from the TMU=
=0A=
>> clock so if the thermal driver doesn't explicitly enable it the system w=
ill hang=0A=
>> on probe. This is what happens in linux-next right now!=0A=
> =0A=
> The thermal driver should be built with module, so default kernel should =
can boot=0A=
> up, do you modify the thermal driver as built-in?=0A=
> =0A=
>> Unless this patches is merged soon we'll end up with a 5.4-rc1 that does=
n't=0A=
>> boot on imx8mq. An easy fix would be to drop/revert commit=0A=
>> 951c1aef9691 ("clk: imx8mq: Remove CLK_IS_CRITICAL flag for=0A=
>> IMX8MQ_CLK_TMU_ROOT") until the thermal patches are accepted.=0A=
> =0A=
> If the thermal driver is built as module, I think no need to revert the c=
ommit, but=0A=
> if by default thermal driver is built-in or mod probed, then yes, it shou=
ld NOT break=0A=
> kernel boot up.=0A=
=0A=
The qoriq_thermal driver is built as a module in defconfig and when =0A=
modules are properly installed in rootfs they will be automatically be =0A=
probed on boot and cause a hang.=0A=
=0A=
I usually run nfsroot with modules:=0A=
=0A=
     make modules_install INSTALL_MOD_PATH=3D/srv/nfs/imx8-root=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
