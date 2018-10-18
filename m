Return-Path: <SRS0=4ndd=M6=exceet.de=frieder.schrempf@kernel.org>
Subject: Re: [PATCH 0/4] usb: chipidea: imx: add HSIC support
References: <20181016045846.2345-1-peter.chen@nxp.com>
 <82a99c3c-20c6-4972-fc6d-1fca8d5d684d@exceet.de>
 <VI1PR04MB53271CABB291EECC73C86C518BFF0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <796469f2-ea5d-d428-6088-32d8eedb3160@exceet.de>
 <70259e7d-2b2a-ddf6-4f10-3c53c065133c@exceet.de>
 <9efff07e-deb6-5740-6326-bd2f11f9fed4@exceet.de>
 <VI1PR04MB5327FF408B0FFE0FEA8935338BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <b127d005-3407-4c00-99a1-2a92809b7148@exceet.de>
 <VI1PR04MB53271760D4EE48F1B38E73458BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <5f22a449-aa97-0abd-242c-e33233d8ca28@exceet.de>
Date: Thu, 18 Oct 2018 10:56:06 +0200
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB53271760D4EE48F1B38E73458BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 18.10.18 10:48, Peter Chen wrote:
>   
>>>
>>> Thanks, Frieder, no more tests are needed.
>>> You could send me your dts changes as patches, I will append it at my v2 patch
>> series.
>>
>> My board is currently off-tree so I can't send any patch for the pinmux settings in
>> devicetree. But I will send a patch with the changes that should go to imx6qdl.dtsi,
>> imx6sl.dtsi and imx6sx.dtsi. Though I only tested on i.MX6S.
>>
> 
> No, the changes are board level specific, you could not add it into SoC file.

Not all changes are board specific. The HSIC-only host controllers can 
only be used to interface with on-board chips via HSIC. So they need a 
"usb-nop-xceiv" dummy PHY in all use cases.

So if I understand this correctly this should be done in the SoCs dtsi 
files like in this patch I just sent: [1].

Please also note that for i.MX7S this is already added in imx7s.dtsi: [2]

Thanks,
Frieder

[1]: https://lkml.org/lkml/2018/10/18/414
[2]: 
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/imx7s.dtsi#L88
