From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: Re: [PATCH_V4 1/3] dt: usb: jz4740: Add DT binding document for OHCI
Date: Tue, 3 Feb 2015 10:53:26 +0000
Message-ID: <54D0A8A6.5040805@imgtec.com>
References: <1422958640-25723-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1422958640-25723-2-git-send-email-Zubair.Kakakhel@imgtec.com> <54D0A3C4.6010100@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54D0A3C4.6010100@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 03/02/15 10:32, Lars-Peter Clausen wrote:
> On 02/03/2015 11:17 AM, Zubair Lutfullah Kakakhel wrote:
> [...]
>> V4 Changes
>> Removed clock binding because of pending work in clock tree. Will add
>> binding later. Rather than introduce a bad binding now and change later.
> 
> But this patch is introducing a bad binding. The part needs the clock to work. The binding you are specifying right now says that it works fine without any clocks.

Facing a chicken and egg problem with these patches here..

When the new clock driver gets in we can add the correct clock binding and replace
devm_clk_get(&pdev->dev, "uhc"); with devm_clk_get(&pdev->dev, NULL);

Specifying the current binding got NAKed by Arnd who mentioned that clock names shouldn't be needed as required properties.
And even if needed, then it shouldn't be "uhc" and more close to what other ohci drivers have.

Hence rather than bad binding now, we'll add a binding later..

> 
>> [...]
>> +Example for jz4740:
>> +
>> +/ {
>> +    ohci: jz4780-ohci@0x134a0000 {
> 
> s/jz4780/jz4740

Thanks

ZubairLK

> 
>> +        compatible = "ingenic,jz4740-ohci";
>> +        reg = <0x134a0000 0x10000>;
>> +
>> +        interrupts = <5>;
>> +    };
>> +};
>> +
>>
> 
