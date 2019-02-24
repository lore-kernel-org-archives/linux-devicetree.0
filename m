From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Sat, 23 Feb 2019 19:20:21 -0800
Message-ID: <96932b3e-87f1-d8f2-95bc-0e9a8d5d45ed@roeck-us.net>
References: <1550472539-16590-1-git-send-email-Anson.Huang@nxp.com>
 <1550472539-16590-2-git-send-email-Anson.Huang@nxp.com>
 <20190222195217.GA22194@bogus>
 <bb19470c-1590-f8dd-72e6-b382444d7902@roeck-us.net>
 <DB3PR0402MB3916912A64AF0837A9649913F5790@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916912A64AF0837A9649913F5790@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jag>
List-Id: devicetree@vger.kernel.org

On 2/23/19 7:04 PM, Anson Huang wrote:
> Hi, Guenter/Rob
> 
> Best Regards!
> Anson Huang
> 
>> -----Original Message-----
>> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
>> Roeck
>> Sent: 2019年2月24日 1:08
>> To: Rob Herring <robh@kernel.org>; Anson Huang <anson.huang@nxp.com>
>> Cc: mark.rutland@arm.com; shawnguo@kernel.org;
>> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
>> catalin.marinas@arm.com; will.deacon@arm.com; wim@linux-watchdog.org;
>> Aisheng Dong <aisheng.dong@nxp.com>; ulf.hansson@linaro.org; Daniel
>> Baluta <daniel.baluta@nxp.com>; Andy Gross <andy.gross@linaro.org>;
>> horms+renesas@verge.net.au; heiko@sntech.de; arnd@arndb.de;
>> bjorn.andersson@linaro.org; jagan@amarulasolutions.com;
>> enric.balletbo@collabora.com; marc.w.gonzalez@free.fr; olof@lixom.net;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-watchdog@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: Re: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog
>> binding
>>
>> On 2/22/19 11:52 AM, Rob Herring wrote:
>>> On Mon, Feb 18, 2019 at 06:53:48AM +0000, Anson Huang wrote:
>>>> Add i.MX8QXP system controller watchdog binding.
>>>>
>>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>>> ---
>>>> Changes since V1:
>>>> 	- update dts node name to "watchdog";
>>>> ---
>>>>    Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 10
>> ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>>> b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>>> index 4b79751..f388ec6 100644
>>>> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>>> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
>>>> @@ -136,6 +136,12 @@ Required properties:
>>>>    			   resource id for thermal driver to get temperature
>> via
>>>>    			   SCU IPC.
>>>>
>>>> +Watchdog bindings based on SCU Message Protocol
>>>> +------------------------------------------------------------
>>>> +
>>>> +Required properties:
>>>> +- compatible: should be "fsl,imx8qxp-sc-wdt";
>>>> +
>>>>    Example (imx8qxp):
>>>>    -------------
>>>>    lsio_mu1: mailbox@5d1c0000 {
>>>> @@ -188,6 +194,10 @@ firmware {
>>>>    			tsens-num = <1>;
>>>>    			#thermal-sensor-cells = <1>;
>>>>    		};
>>>> +
>>>> +		watchdog: watchdog {
>>>> +			compatible = "fsl,imx8qxp-sc-wdt";
>>>
>>> As-is, there's no reason for this to be in DT. The parent node's
>>> driver can instantiate the wdog.
>>>
>>
>> As the driver is currently written, you are correct, since it doesn't accept
>> watchdog timeout configuration through devicetree.
>>
>> Question is if that is intended. Is it ?
> 
> I am a little confused, do you mean we no need to have "watchdog" node in side "scu"
> node? Or we need to modify the watchdog node's compatible string to " fsl,imx-sc-wdt" to make
> it more generic for other platforms? If yes, I can resend the patch series to modify it.
>   

I think Rob suggested that the SCU parent driver should instantiate the watchdog
without explicit watchdog node. That would be possible, but it currently uses
devm_of_platform_populate() to do the instantiation, and changing that would
be a mess. Besides, it does sem to me that your suggested node would describe
the hardware, so I am not sure I understand the reasoning.

For my part I referred to
	watchdog_init_timeout(imx_sc_wdd, DEFAULT_TIMEOUT, &pdev->dev);
in the driver, which guarantees that the timeout property will not be used
to set the timeout. A more common implementation would have been

	imx_sc_wdd->timeout = DEFAULT_TIMEOUT;
	ret = watchdog_init_timeout(imx_sc_wdd, timeout, &pdev->dev);

where 'timeout' is the module parameter. Which is actually not used in your driver.
Hmm ... I wasn't careful enough with my review. The timeout initialization as-is
doesn't make sense. I'll comment on that in the patch.

Guenter

> Anson.
> 
>>
>> Thanks,
>> Guenter
