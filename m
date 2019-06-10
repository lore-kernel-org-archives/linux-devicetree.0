From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC 0/2] Add workaround for core wake-up on IPI for i.MX8MQ
Date: Mon, 10 Jun 2019 15:52:09 +0100
Message-ID: <760bde51-f683-5975-4431-864f16e3365b@arm.com>
References: <20190610121346.15779-1-abel.vesa@nxp.com>
 <20190610131921.GB14647@lakrids.cambridge.arm.com>
 <20190610132910.srd4j2gtidjeppdx@fsr-ub1664-175>
 <6f1052ea-623a-b2e8-9aa8-22aef5fab4ca@arm.com>
 <20190610135514.xd5myavjsloos2y3@fsr-ub1664-175>
 <7b86aa90-6d64-589c-f11e-d2ee6ab3fd54@arm.com>
 <VI1PR04MB5055A808A08A1C47784E4332EE130@VI1PR04MB5055.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB5055A808A08A1C47784E4332EE130@VI1PR04MB5055.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Abel Vesa <abelvesa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jacky Bai <ping.bai@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 10/06/2019 15:32, Leonard Crestez wrote:
> On 6/10/2019 5:08 PM, Marc Zyngier wrote:
>> On 10/06/2019 14:55, Abel Vesa wrote:
>>> On 19-06-10 14:39:02, Marc Zyngier wrote:
>>>> On 10/06/2019 14:29, Abel Vesa wrote:
>>>>> On 19-06-10 14:19:21, Mark Rutland wrote:
>>>>>> On Mon, Jun 10, 2019 at 03:13:44PM +0300, Abel Vesa wrote:
> 
>>>>>>> Basically, it 'hijacks' the registered gic_raise_softirq __smp_cross_call
>>>>>>> handler and registers instead a wrapper which calls in the 'hijacked'
>>>>>>> handler, after that calling into EL3 which will take care of the actual
>>>>>>> wake up. This time, instead of expanding the PSCI ABI, we use a new vendor SIP.
>>>>>>
>>>>>> IIUC from last time [1,2], this erratum affects all interrupts
>>>>>> targetting teh idle CPU, not just IPIs, so even if the bodge is more
>>>>>> self-contained, it doesn't really solve the issue, and there are still
>>>>>> cases where a CPU will not be woken from idle when it should be (e.g.
>>>>>> upon receipt of an LPI).
>>>>>
>>>>> Wrong, this erratum does not affect any other type of interrupts, other
>>>>> than IPIs. That is because all the other interrupts go through GPC,
>>>>> which means the cores will wake up on any other type (again, other than IPI).
>>>>
>>>> Huh... Are you saying that LPIs and PPIs are going through the GPC, and
>>>> will trigger the wake-up of the core? That's not the conclusion we
>>>> reached last time.
>>>
>>> Hmm, I don't think that was the conclusion. Yes, Lucas was saying (IIRC)
>>> that if you terminate the IRQs at GIC then all the other interrupts will be
>>> in the same situation. But the performance improvement given by terminating
>>> them at GIC might not be worth it when compared to the cpuidle support.
>>
>> PPIs are broken,
>> relying on some other terrible hack for the timer (and only the timer,
>> leaving other PPIs dead as a nail). It also implies that LPIs have never
>> been looked into, and given that they aren't routed through the GPC, the
>> conclusion is pretty easy to draw.
>>
>> Nobody is talking about performance here. It is strictly about
>> correctness, and what I read about this system is that it cannot
>> reliably use cpuidle.
> My argument was that it's fine if PPIs and LPIs are broken as long as 
> they're not used:
> 
>   * PPIs are only used for local timer which is not used for wakeup.

How about the PMU and GIC maintenance interrupts? Any interrupt should
get you out of idle.

>   * LPIs on imx are not currently implemented.

Define "implemented". You don't have an ITS at all? Or is it that you
currently don't expose the ITS in your firmware?

> This workaround is only targeted at a very specific SOC with specific 
> usecases and in that context it behaves correctly, as far as I can tell.

And I still maintain that such specific use cases should be kept
specific, and that the mainline kernel should be reliable in all
circumstances.

> As mentioned in another thread the HW issue was already solved in newer 
> chips of the same family (like imx8mm). If there is a need for PPIs and 
> LPIs on imx8mq in the future then maybe we can detect that scenario and 
> disable cpuidle?

I'd suggest it the other way around. No cpuidle unless you absolutely
force it, tainting the kernel in the process.

	M.
-- 
Jazz is not dead. It just smells funny...
