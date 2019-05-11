Return-Path: <SRS0=AdCM=TL=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH v2 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-6-chris.brandt@renesas.com>
 <e987df36-eca6-f05f-d1bf-7dc43fc9d4b4@cogentembedded.com>
 <TY1PR01MB15628A94DA371A7636984A708A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <711839c7-930f-938e-4626-8a7524f5b82e@cogentembedded.com>
Date: Sat, 11 May 2019 10:39:40 +0300
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB15628A94DA371A7636984A708A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 10.05.2019 16:55, Chris Brandt wrote:

>>> +	} else {
>>> +		/* Not OTG, so dr_mode should be set in PHY node */
>>> +		mode = usb_get_dr_mode(channel->dev);
>>> +		if (mode == USB_DR_MODE_HOST)
>>> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
>>> +		else if (mode == USB_DR_MODE_PERIPHERAL)
>>> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
>>
>>      Maybe a *switch* instead?
> 
> I like that idea because I can get rid of the dr_mode variable.

    Yes. :-)

> However...
> I just tried it, but if I only have a case for HOST and PERIPHERAL, I
> get this gcc warning:
> 
>    warning: enumeration value ‘USB_DR_MODE_UNKNOWN’ not handled in switch [-Wswitch]
>    warning: enumeration value ‘USB_DR_MODE_OTG’ not handled in switch [-Wswitch]
> 
> 
> So, my code would have to be:
> 
> 	} else {
> 		/* Not OTG, so dr_mode should be set in PHY node */
> 		switch (usb_get_dr_mode(channel->dev)) {
> 		case USB_DR_MODE_HOST:
> 			writel(0x00000000, usb2_base + USB2_COMMCTRL);
> 			break;
> 		case USB_DR_MODE_PERIPHERAL:
> 			writel(0x80000000, usb2_base + USB2_COMMCTRL);
> 			break;
> 		case USB_DR_MODE_UNKNOWN:
> 		case USB_DR_MODE_OTG:

    Maybe default: instead?

> 			break;
> 		}
> 	}
> 
> I guess that is still OK.

    Yes. :-)

> Chris

MBR, Sergei
