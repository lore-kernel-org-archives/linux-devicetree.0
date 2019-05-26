From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [PATCH 0/2] mailbox: arm: introduce smc triggered mailbox
Date: Mon, 27 May 2019 00:59:23 +0100
Message-ID: <d0800650-b79b-4698-3a3e-60e83c85f2d1@arm.com>
References: <20190523060437.11059-1-peng.fan@nxp.com>
 <4ba2b243-5622-bb27-6fc3-cd9457430e54@gmail.com>
 <20190524175658.GA5045@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524175658.GA5045@e107155-lin>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 24/05/2019 18:56, Sudeep Holla wrote:
> On Thu, May 23, 2019 at 10:30:50AM -0700, Florian Fainelli wrote:

Hi,

>> On 5/22/19 10:50 PM, Peng Fan wrote:
>>> This is a modified version from Andre Przywara's patch series
>>> https://lore.kernel.org/patchwork/cover/812997/.
>>> [1] is a draft implementation of i.MX8MM SCMI ATF implementation that
>>> use smc as mailbox, power/clk is included, but only part of clk has been
>>> implemented to work with hardware, power domain only supports get name
>>> for now.
>>>
>>> The traditional Linux mailbox mechanism uses some kind of dedicated hardware
>>> IP to signal a condition to some other processing unit, typically a dedicated
>>> management processor.
>>> This mailbox feature is used for instance by the SCMI protocol to signal a
>>> request for some action to be taken by the management processor.
>>> However some SoCs does not have a dedicated management core to provide
>>> those services. In order to service TEE and to avoid linux shutdown
>>> power and clock that used by TEE, need let firmware to handle power
>>> and clock, the firmware here is ARM Trusted Firmware that could also
>>> run SCMI service.
>>>
>>> The existing SCMI implementation uses a rather flexible shared memory
>>> region to communicate commands and their parameters, it still requires a
>>> mailbox to actually trigger the action.
>>
>> We have had something similar done internally with a couple of minor
>> differences:
>>
>> - a SGI is used to send SCMI notifications/delayed replies to support
>> asynchronism (patches are in the works to actually add that to the Linux
>> SCMI framework). There is no good support for SGI in the kernel right
>> now so we hacked up something from the existing SMP code and adding the
>> ability to register our own IPI handlers (SHAME!). Using a PPI should
>> work and should allow for using request_irq() AFAICT.
>>
> 
> We have been thinking this since we were asked if SMC can be transport.
> Generally out of 16 SGIs, 8 are reserved for secure side and non-secure
> has 8. Of these 8, IIUC 7 is already being used by kernel. So unless we
> manage to get the last one reserved exclusive to SCMI, it makes it
> difficult to add SGI support in SCMI.
> 
> We have been telling partners/vendors about this limitation if they
> use SMC as transport and need to have dedicated h/w interrupt for the
> notifications.
> 
> Another issue could be with virtualisation(using HVC) and EL handling
> so called SCMI SGI. We need to think about those too. I will try to get
> more info on this and come back on this.

I think regardless of the *current* feasibility of using SGIs in *Linux*
we should at least specify an "interrupts" property in the binding, to
allow for future usage. We might copy the pmuv3 way [1] of allowing to
specify multiple SPI interrupts as well, to give more flexibility.
After all an implementation could offload the asynchronous notification
to a separate core, and that could use SPIs, for instance.

Cheers,
Andre.

[1] Documentation/devicetree/bindings/arm/pmu.yaml:45
