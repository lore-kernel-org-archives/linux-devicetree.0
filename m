From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
Date: Wed, 17 Apr 2019 12:40:19 +0000
Message-ID: <VI1PR04MB55330105F4839FCF98B7CFC0EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <20190417053211.2195-1-ping.bai@nxp.com>
 <AM0PR04MB42116FEB1EE2CAE68A1CAA8980250@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1555503195.2317.19.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Lucas Stach <l.stach@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Silvano Di Ninno <silvano.dininno@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 4/17/2019 3:13 PM, Lucas Stach wrote:
> Am Mittwoch, den 17.04.2019, 11:16 +0000 schrieb Aisheng Dong:
>>> From: Jacky Bai
>>> Sent: Wednesday, April 17, 2019 1:27 PM
>>>
>>> The i.MX8M family is a set of NXP product focus on delivering the latest and
>>> greatest video and audio experience combining state-of-the-art media-specific
>>> features with high-performance processing while optimized for lowest power
>>> consumption.
>>> i.MX8MQ, i.MX8MM, i.MX8MN, even the furture i.MX8MP are all belong to
>>> this family.
>>>
>>> The GPC module is used to manage the PU power domains' power on/off. For
>>> the whole i.MX8M family, different SoC has differnt power domain design. the
>>> power up sequence has significant difference.
>>> all the power sequence must be guaranteed by SW. Some domains' power up
>>> sequence need to access the SRC module or sub-system specific GPR.
>>> the SRC register & SS's register are not in in the GPC's memory range.
>>>
>>> it makes us hard to use the GPCv2 driver to cover all the different power up
>>> requirement. Each time, a new SoC is added, we must modify the GPCv2 driver
>>> to make it resuable for it. a lot of code need to be added in GPCv2 to support it.
>>> we need to access the SRC & SS' GPR, then the GPCv2 driver can NOT be
>>> self-contained. Accessing the non-driver specific module's register is a bad
>>> practice. Although, the GPC module provided the similar function for PU power
>>> domain, but it is not 100% compatible with GPCv2.
>>>
>>> The most important thing is that the GPC & SRC module is a security critical
>>> resource that security permission must be considered when building the
>>> security system. The GPC module is not only used by PU power domain power
>>> on/off. It is also used by the TF-A PSCI code to do the CPU core power
>>> management. the SRC module control the CPU CORE reset and the CPU reset
>>> vector address. if we give the non-secure world write permission to SRC.
>>> System can be easily induced to malicious code.
>>
>> Considering the security issue, it looks to me a right direction to move GPC
>> power handling into ATF.
>> It also helps build a more generic driver and ease other OS integration
>> needed by customers (e.g. QNX, Win10).
>>
>> Lucas,
>> How do you think of it?
> 
> I don't yet buy the security argument. There are many more shared parts
> on the SoC, like the clock controller, that would need to be taken away
> from the non-secure world if one would want to run an untrusted OS
> kernel on a i.MX8M system.
> 
> To properly implement security on any i.MX8M based system the firmware
> would need to grow something like a full ARM SCPI implementation, so
> all shared critical peripherals are solely under firmware control.

It might be possible to rework this to use some form of SCMI-over-SMC 
instead of vendor-specific SMCCC SIP calls

+SCMI maintainer

> I agree that it might make sense to move some parts into the firmware
> and have much simpler OS level drivers, but I don't agree on the
> implementation direction taken here. Growing custom PSCI extension
> interfaces will only get us so far, without solving the system security
> issue in a holistic way. It is my strong believe that only a complete
> rearchitecture of the OS support on top of a ARM SCPI firmware
> interface can solve this properly.
Hiding everything critical for security (especially CCM) behind a SCMI 
interface would be a large amount of work but introducing SCMI 
incrementally (starting with imx8mm power) would be useful by itself 
because it simplifies OS implementation.

Many at NXP have attempted to evaluate SCMI and their conclusion has 
always been that "many extensions are required".

--
Regards,
Leonard
