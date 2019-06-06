Return-Path: <SRS0=gQZM=UF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr30081.outbound.protection.outlook.com ([40.107.3.81]:3751
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728762AbfFFRzs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 6 Jun 2019 13:55:48 -0400
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
Date: Thu, 6 Jun 2019 17:55:44 +0000
Message-ID: <VI1PR04MB5055663AF82B651E9E3E36AFEE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190606164443.6991-1-festevam@gmail.com>
 <20190606165546.6675520693@mail.kernel.org>
 <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
 <20190606172210.7B3F82083E@mail.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 06.06.2019 20:22, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2019-06-06 10:15:32)=0A=
>> On 06.06.2019 19:55, Stephen Boyd wrote:=0A=
>>> Quoting Fabio Estevam (2019-06-06 09:44:43)=0A=
>>>> Use devm_platform_ioremap_resource() to simplify the code a bit.=0A=
>>>>=0A=
>>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>=0A=
>>>> ---=0A=
>>>=0A=
>>> Reviewed-by: Stephen Boyd <sboyd@kernel.org>=0A=
>>=0A=
>> An extremely similar patch was already submitted and then reverted=0A=
>> because it breaks boot:=0A=
>>=0A=
>> The current imx8 lpcg driver maps entire subsystems at once and if=0A=
>> devm_platform_ioremap_resource is used then devices inside the subsystem=
=0A=
>> will fail to probe, including lpuart!=0A=
>>=0A=
>> The hardware on imx8qxp and related parts (imx8qm) has multiple separate=
=0A=
>> LPCG blocks interspersed between devices. Some refactoring patches were=
=0A=
>> posted by Aisheng to split LPCG into multiple blocks but apparently got=
=0A=
>> stuck in review:=0A=
>>=0A=
>> There were some disagreements regarding DT bindings for split imx8=0A=
>> clocks, what would it take to move those patches forward?=0A=
> =0A=
> Don't know. I'll have to read those patches on the list and reply there.=
=0A=
=0A=
Some specific advice on how to refactor and split imx8qxp clk in a way =0A=
that is acceptable to upstream would be very helpful to us.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
