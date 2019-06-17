From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 6/8] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Date: Mon, 17 Jun 2019 19:05:57 +0300
Message-ID: <7d50357c-64b4-f504-e1b8-0e4542b59d12@cogentembedded.com>
References: <20190614093544.11730-1-peter.chen@nxp.com>
 <20190614093544.11730-7-peter.chen@nxp.com>
 <0dbf01f9-7c5c-ce0b-4feb-378c9147f15a@cogentembedded.com>
 <VI1PR04MB5327B9EF844F9C7505D337298BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB5327B9EF844F9C7505D337298BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <peter.chen@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 06/17/2019 04:13 AM, Peter Chen wrote:

[...]
>>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
>>> ---
>>>   arch/arm/boot/dts/imx7ulp.dtsi | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi
>>> b/arch/arm/boot/dts/imx7ulp.dtsi index fca6e50f37c8..5115e47715c3
>>> 100644
>>> --- a/arch/arm/boot/dts/imx7ulp.dtsi
>>> +++ b/arch/arm/boot/dts/imx7ulp.dtsi
>>> @@ -30,6 +30,7 @@
>>>   		serial1 = &lpuart5;
>>>   		serial2 = &lpuart6;
>>>   		serial3 = &lpuart7;
>>> +		usbphy0 = &usbphy1;
>>
>>     Is that really needed?

> Yes, since the driver code uses aligned id, and the controller number is from 0 at the code.
> I commented it here: [1]

   Fair enough...

>> [...]
>>> @@ -133,6 +134,33 @@
>> [...]
>>> +		usbphy1: usbphy@0x40350000 {
>>
>>     Name it "usb-phy@40350000" please.
>>
> 
> Would you please list binding doc for your suggestion?

   The DT spec v0.2, section 2.2.2:

https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf

> 
> Thanks,
> Peter
> 
> [1] https://patchwork.kernel.org/patch/10920599/

MBR, Sergei
