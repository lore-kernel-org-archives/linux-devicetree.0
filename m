From: =?utf-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
Subject: Re: [PATCH] ARM: dts: imx: Add Y Soft IOTA Draco, Hydra and Ursa
 boards
Date: Tue, 11 Dec 2018 13:46:30 +0000
Message-ID: <dc1db0e2-b9a6-8624-4be5-8b3719d99f4b@ysoft.com>
References: <1541086962-52626-1-git-send-email-michal.vokac@ysoft.com>
 <5bea0e99.1c69fb81.18be0.5162@mx.google.com>
 <42ffee3e-7c2a-aab9-547f-2064a77339a8@ysoft.com>
 <a61683a2-30aa-e387-2170-3d79e0043739@ysoft.com>
 <18065d41-4ae0-ada2-35f1-00d8a8489397@ysoft.com>
 <20181211123640.GC4632@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181211123640.GC4632@lunn.ch>
Content-Language: en-US
Content-ID: <06C7763841A75A4B8F7B7956CF721C8D@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 11.12.2018 13:36, Andrew Lunn wrote:
>>> Hi Rob, gentle ping on this.
>>>
>>> I would like to be sure how to proceed with this. Do you really want me
>>> to move *all* nodes that are disabled in this common dtsi into the per
>>> board dts?
>>>
>>> All the boards use identical PCB. Anything that is disabled here is not
>>> present on at least one of the boards. It means it is routed on the
>>> board and the SoC has the capability but the parts are not populated.
>>>
>>> So it is not only about the LED controller. What about the LCD, OLED,
>>> backlight, USB..?
>>
>> Can anybody advice how to split these dts/dtsi files, please?
>> I am not sure what should reside in the common dtsi and what should
>> be moved into the per board dts in case my current solution is not
>> appropriate.
> 
> The kirkwood-synology.dtsi might be of interest? There are a lot of
> Synology NAS boxes which share a lot in common. So all the common
> parts are in that .dtsi. The .dbs file for each individual model then
> enables the parts its needs.

That is a great example Andrew, thank you! That is exactly what I am
doing. Everything that is supported by the PCB/platform is specified
in the common file. Only parts that are populated on all products are
enabled there, the other stuff is disabled. The .dts files then enable
additional stuff they need.

To me it seems reasonable to do it that way and maybe I only
misunderstood what Rob actually meant by his comment? I still do not
have his reply to that though.

> Although you have one PCB, or the different population options
> considered different products, each with there own name?

Yes, each of the three population options can be considered a different
product with different name. That is still the same as the Synology
NAS boxes, right?

Michal
