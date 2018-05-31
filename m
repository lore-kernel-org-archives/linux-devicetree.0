From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH v4 5/5] ARM: dts: imx6qdl: add missing compatible and
 clock properties for EPIT
Date: Thu, 31 May 2018 11:54:04 +0300
Message-ID: <f71fe02d-23a7-a475-52df-62c17089549b@mentor.com>
References: <20180530120327.27681-1-peron.clem@gmail.com>
 <20180530120327.27681-6-peron.clem@gmail.com>
 <a4042956-24e1-6132-4606-b5b8f4e30023@mentor.com>
 <CAJiuCcefvMg6r=06O8m1TYa0hat_dHydcoJ7PN58qUru1K8zMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJiuCcefvMg6r=06O8m1TYa0hat_dHydcoJ7PN58qUru1K8zMQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?Q?Cl=c3=a9ment_Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

Hi Clément,

On 05/31/2018 11:41 AM, Clément Péron wrote:
> Hi Vladimir,
> 
> On Thu, 31 May 2018 at 10:33, Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
>>
>> On 05/30/2018 03:03 PM, Clément Péron wrote:
>>> From: Colin Didier <colin.didier@devialet.com>
>>>
>>> Add missing compatible and clock properties for EPIT node.
>>>
>>> Signed-off-by: Colin Didier <colin.didier@devialet.com>
>>> Signed-off-by: Clément Peron <clement.peron@devialet.com>
>>> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
>>> ---
>>>  arch/arm/boot/dts/imx6qdl.dtsi | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
>>> index c003e62bf290..0feec516847a 100644
>>> --- a/arch/arm/boot/dts/imx6qdl.dtsi
>>> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
>>> @@ -844,13 +844,23 @@
>>>                       };
>>>
>>>                       epit1: epit@20d0000 { /* EPIT1 */
>>
>> epit1: timer@20d0000 { ...
>>
>> And /* EPIT1 */ comment can be removed, it is quite clear from the same
>> line context.
>>
>> Formally it is a subject to another patch, but I think this can be
>> accepted as a part of this one.
> 
> Should I also update other boards ?
> I only did it for imx6qdl.dtsi, but the EPIT is present in other boards
> but i can't test it myself.
> 

Sure, please do it, why not, it is quite a safe modification.

One change per one dtsi file will suffice, and I see that imx25.dtsi
already contains the requested change, however probably you may
want to update its compatible = "fsl,imx25-epit" line.

Regarding compatibles for other imx6* SoCs, I think all of them should
be documented in fsl,imxepit.txt and then added to the correspondent
dtsi files one per SoC.

And I forgot the outcome of one former discussion with Uwe Kleine-König,
but if my bad memory serves me, we agreed that i.MX25 was released later
than i.MX31, so the most generic (the last value in the list) compatible
should be a compatible with i.MX31 like in

	imx25.dtsi:367:	compatible = "fsl,imx25-gpt", "fsl,imx31-gpt";

--
With best wishes,
Vladimir
