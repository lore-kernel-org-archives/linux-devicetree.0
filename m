From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Mon, 10 Jun 2019 14:32:37 +0000
Message-ID: <VI1PR04MB5055A808A08A1C47784E4332EE130@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <20190610131921.GB14647@lakrids.cambridge.arm.com>
 <20190610132910.srd4j2gtidjeppdx@fsr-ub1664-175>
 <6f1052ea-623a-b2e8-9aa8-22aef5fab4ca@arm.com>
 <20190610135514.xd5myavjsloos2y3@fsr-ub1664-175>
 <7b86aa90-6d64-589c-f11e-d2ee6ab3fd54@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Abel Vesa <abelvesa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jacky Bai <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 6/10/2019 5:08 PM, Marc Zyngier wrote:=0A=
> On 10/06/2019 14:55, Abel Vesa wrote:=0A=
>> On 19-06-10 14:39:02, Marc Zyngier wrote:=0A=
>>> On 10/06/2019 14:29, Abel Vesa wrote:=0A=
>>>> On 19-06-10 14:19:21, Mark Rutland wrote:=0A=
>>>>> On Mon, Jun 10, 2019 at 03:13:44PM +0300, Abel Vesa wrote:=0A=
=0A=
>>>>>> Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross=
_call=0A=
>>>>>> handler and registers instead a wrapper which calls in the 'hijacked=
'=0A=
>>>>>> handler, after that calling into EL3 which will take care of the act=
ual=0A=
>>>>>> wake up. This time, instead of expanding the PSCI ABI, we use a new =
vendor SIP.=0A=
>>>>>=0A=
>>>>> IIUC from last time [1,2], this erratum affects all interrupts=0A=
>>>>> targetting teh idle CPU, not just IPIs, so even if the bodge is more=
=0A=
>>>>> self-contained, it doesn't really solve the issue, and there are stil=
l=0A=
>>>>> cases where a CPU will not be woken from idle when it should be (e.g.=
=0A=
>>>>> upon receipt of an LPI).=0A=
>>>>=0A=
>>>> Wrong, this erratum does not affect any other type of interrupts, othe=
r=0A=
>>>> than IPIs. That is because all the other interrupts go through GPC,=0A=
>>>> which means the cores will wake up on any other type (again, other tha=
n IPI).=0A=
>>>=0A=
>>> Huh... Are you saying that LPIs and PPIs are going through the GPC, and=
=0A=
>>> will trigger the wake-up of the core? That's not the conclusion we=0A=
>>> reached last time.=0A=
>>=0A=
>> Hmm, I don't think that was the conclusion. Yes, Lucas was saying (IIRC)=
=0A=
>> that if you terminate the IRQs at GIC then all the other interrupts will=
 be=0A=
>> in the same situation. But the performance improvement given by terminat=
ing=0A=
>> them at GIC might not be worth it when compared to the cpuidle support.=
=0A=
> =0A=
> PPIs are broken,=0A=
> relying on some other terrible hack for the timer (and only the timer,=0A=
> leaving other PPIs dead as a nail). It also implies that LPIs have never=
=0A=
> been looked into, and given that they aren't routed through the GPC, the=
=0A=
> conclusion is pretty easy to draw.=0A=
> =0A=
> Nobody is talking about performance here. It is strictly about=0A=
> correctness, and what I read about this system is that it cannot=0A=
> reliably use cpuidle.=0A=
My argument was that it's fine if PPIs and LPIs are broken as long as =0A=
they're not used:=0A=
=0A=
  * PPIs are only used for local timer which is not used for wakeup.=0A=
  * LPIs on imx are not currently implemented.=0A=
=0A=
This workaround is only targeted at a very specific SOC with specific =0A=
usecases and in that context it behaves correctly, as far as I can tell.=0A=
=0A=
As mentioned in another thread the HW issue was already solved in newer =0A=
chips of the same family (like imx8mm). If there is a need for PPIs and =0A=
LPIs on imx8mq in the future then maybe we can detect that scenario and =0A=
disable cpuidle?=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
