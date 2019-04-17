From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
Date: Wed, 17 Apr 2019 16:21:55 +0000
Message-ID: <VI1PR04MB5533A1F87436C0839A772D03EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <20190417053211.2195-1-ping.bai@nxp.com>
 <AM0PR04MB42116FEB1EE2CAE68A1CAA8980250@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1555503195.2317.19.camel@pengutronix.de>
 <VI1PR04MB55330105F4839FCF98B7CFC0EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <68aaace3-f66e-b4b8-30a0-57b8b66a7524@arm.com>
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
To: Sudeep Holla <sudeep.holla@arm.com>, Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>, Silvano Di Ninno <silvano.dininno@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 4/17/2019 4:33 PM, Sudeep Holla wrote:
>>> I don't yet buy the security argument. There are many more shared parts
>>> on the SoC, like the clock controller, that would need to be taken away
>>> from the non-secure world if one would want to run an untrusted OS
>>> kernel on a i.MX8M system.
>>>
>>> To properly implement security on any i.MX8M based system the firmware
>>> would need to grow something like a full ARM SCPI implementation, so
>>> all shared critical peripherals are solely under firmware control.
>>
>> It might be possible to rework this to use some form of SCMI-over-SMC
>> instead of vendor-specific SMCCC SIP calls
> 
> Sounds feasible and good if all the custom IDs/calls/..etc are well
> hidden in the firmware(TF-A in this case) behind the existing
> abstraction in Linux kernel.

>> Hiding everything critical for security (especially CCM) behind a SCMI
>> interface would be a large amount of work but introducing SCMI
>> incrementally (starting with imx8mm power) would be useful by itself
>> because it simplifies OS implementation.
> 
> Agreed, but not at the expense of introducing and maintaining *random*
> *one-off* *custom* SMC extensions. Sorry, that's not open to debate.
> 
>> Many at NXP have attempted to evaluate SCMI and their conclusion has
>> always been that "many extensions are required".
> 
> I would like to hear the evaluation. Don't assume that you need to
> implement something similar to ARM SCMI reference design. All OSPM like
> Linux kernel cares is conformance to the interface, what/how you
> implement on the other side is left to you.

Brief summary from some attempts at nudging NXP devs towards SCMI:


There is no SCMI-over-SMC support specified? This would make it possible 
to use SCMI as a purely software solution on platforms which did not 
take SCMI into account at hardware design time or which don't have a 
dedicated SCP inside the SOC. This applies to all imx.

Peng has been looking at some out-of-tree arm-smc-mailbox patches so 
it's not just NXP which would like the option of implementing SCMI 
vendor side in ATF. Like this: https://lwn.net/Articles/726861/

Blessing SCMI-over-SMC would allow stuff like intercepting a SCMI 
message in EL2; checking if the guest is allowed to use that resource 
and then either forward to EL3 or return an error.


SCMI clock protocol does not cover muxes? On imx the clk hierarchy is 
very intricate and it relies on many clk core features (including 
notifiers) and occasional assigned-clocks-parents properties to control 
muxes from linux. Moving all that to firmware would be a huge amount of 
effort.

If SCMI included a generic clk mux and allowed keeping the clk hierarchy 
inside linux then the effort required for hiding the CCM would still be 
large, but more approachable. It would not "simplify the rich OS" but it 
would still improve security.


Last point is that SCMI does not cover pinctrl? This is a large chunk of 
firmware functionality on some imx and security control over individual 
pins is desirable.

--
Regards,
Leonard
