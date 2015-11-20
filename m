From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: [PATCH v3 1/3] Documentation: dt-bindings: add async_irq to
 msm_hsusb
Date: Fri, 20 Nov 2015 15:24:47 -0800
Message-ID: <564FABBF.8090308@sonymobile.com>
References: <1448061641-31672-1-git-send-email-tim.bird@sonymobile.com>
 <5200286.dcPK8pnl2Z@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5200286.dcPK8pnl2Z@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Peter.Chen@freescale.com" <Peter.Chen@freescale.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "balbi@ti.com" <balbi@ti.com>, =?UTF-8?Q?Andersson=2c_Bj=c3=b6rn?= <Bjorn.Andersson@sonymobile.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>
List-Id: devicetree@vger.kernel.org



On 11/20/2015 03:22 PM, Arnd Bergmann wrote:
> On Friday 20 November 2015 15:20:39 Tim Bird wrote:
>> +- interrupt-names: Should contain the following:
>> +  "core"        USB core interrupt
>> +  "async"       Asynchronous interrupt to wake up from low power mode
>> +                (optional)
>>  
>>  - clocks:       A list of phandle + clock-specifier pairs for the
>>                  clocks listed in clock-names
>> @@ -89,7 +94,8 @@ Example HSUSB OTG controller device node:
>>      usb@f9a55000 {
>>          compatible = "qcom,usb-otg-snps";
>>          reg = <0xf9a55000 0x400>;
>> -        interrupts = <0 134 0>;
>> +        interrupts = <0 134 0>, <0 140 0>;
>> +        interrupt-names = "core_irq", "async_irq";
>>          dr_mode = "peripheral";
>>  
>>
> 
> Now the example doesn't match the documentation any more.
Arrgh.  I'm an idiot.  V4 coming RSN.
 -- Tim
