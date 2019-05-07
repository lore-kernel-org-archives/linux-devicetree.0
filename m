Return-Path: <SRS0=53jk=TH=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
 <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
 <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <34544f59-76aa-710a-a6ec-7d7d7f31a023@cogentembedded.com>
Date: Tue, 7 May 2019 17:28:25 +0300
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1562550164C7977D28C90F128A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 05/07/2019 02:45 PM, Chris Brandt wrote:

>>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> @@ -408,7 +408,12 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>>>  		if (rcar_gen3_needs_init_otg(channel))
>>>  			rcar_gen3_init_otg(channel);
>>>  		rphy->otg_initialized = true;
>>> -	}
>>> +	} else
>>
>>    Wait, don't we neeed {} here?
>>
>>> +		/* Not OTG, so dr_mode should be set in PHY node */
>>> +		if (usb_get_dr_mode(channel->dev) == USB_DR_MODE_PERIPHERAL)
>>> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
>>> +		else
>>> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
> 
> Technically there is only 1 statement after the else (the 'if' which 
> will also include the 'else') statement. The coding rules say not to use
> { } if there is only 1 statement.

   Don't you remember another rule: use {} in all branches if at least 
one branch uses {}?

> Chris

MBR, Sergei
