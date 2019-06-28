From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct OPP table according to
 latest datasheet
Date: Fri, 28 Jun 2019 06:45:07 +0000
Message-ID: <VI1PR04MB505542FB866BC18A27D22B90EEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190628032800.8428-1-Anson.Huang@nxp.com>
 <VI1PR04MB50553915C0D978A8019BDC5CEEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
 <DB3PR0402MB39161C60DC780B693933F9EAF5FC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kern>
List-Id: devicetree@vger.kernel.org

On 6/28/2019 9:16 AM, Anson Huang wrote:=0A=
>> From: Leonard Crestez=0A=
>>> From: Anson Huang <Anson.Huang@nxp.com>=0A=
>>>=0A=
>>> According to latest datasheet (Rev.1, 10/2018) from below links, in=0A=
>>> the consumer datasheet, 1.5GHz is mentioned as highest opp but depends=
=0A=
>>> on speed grading fuse, and in the industrial datasheet, 1.3GHz is=0A=
>>> mentioned as highest opp but depends on speed grading fuse. 1.5GHz and=
=0A=
>>> 1.3GHz opp use same voltage, so no need for consumer part to support=0A=
>>> 1.3GHz opp, with same voltage, CPU should run at highest frequency in=
=0A=
>>> order to go into idle as quick as possible, this can save power.=0A=
>>=0A=
>> I looked at the same datasheets and it's not clear to me that 1.3 Ghz sh=
ould=0A=
>> be disallowed for consumer parts. Power consumption increases with both=
=0A=
>> voltage and frequency so having two OPPs with same voltage does make=0A=
>> sense.=0A=
> =0A=
> The consumer part datasheet does NOT mention 1.3GHz at all, so consumer p=
art ONLY=0A=
> support 1GHz/1.5GHz, and industrial part ONLY support 800MHz/1.3GHz, this=
 is what=0A=
> we did in our internal tree and NPI release, so better to make them align=
ed, otherwise,=0A=
> we have to change it when kernel upgrade.=0A=
=0A=
Datasheet seems ambiguous: it mentions "max freq for volt" so my =0A=
understanding is that any lower freqs should also work at that voltage.=0A=
=0A=
This also seems to be the understanding behind commit 8cfd813c7307 =0A=
("arm64: dts: imx8mq: fix higher CPU operating point") by Lucas.=0A=
=0A=
On datasheet page 7 it mentions that product code can have "JZ" or "HZ" =0A=
for 1.3Ghz or 1.5Ghz. Are you saying that only industrial parts can be "JZ"=
?=0A=
=0A=
>>>    			opp-hz =3D /bits/ 64 <1500000000>;=0A=
>>>    			opp-microvolt =3D <1000000>;=0A=
>>>    			/* Consumer only but rely on speed grading */=0A=
>>> -			opp-supported-hw =3D <0x8>, <0x7>;=0A=
>>> +			opp-supported-hw =3D <0x8>, <0x3>;=0A=
>>=0A=
>> If you don't want to rely on the fact that only consumer parts should be=
=0A=
>> fused for 1.5 Ghz then please delete the comment.=0A=
> =0A=
> Don't quite understand, 1.5GHz is indeed consumer ONLY, but if the consum=
er=0A=
> part is fused to 1GHz, then 1.5GHz is also NOT available, so it also rely=
 on speed=0A=
> grading. So keep the comment there is OK?=0A=
=0A=
What I meant with that comment is that 1.5Ghz is only mentioned for =0A=
consumer parts but instead of explicitly banning it on industrial parts =0A=
we rely on MFG never fusing industrial parts for 1.5Ghz.=0A=
=0A=
Now you're explicitly banning it on industrial parts.=0A=
=0A=
This comment is indeed confusing so better to just remove all instances.=0A=
