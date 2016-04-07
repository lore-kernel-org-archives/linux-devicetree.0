From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v1 1/2] dt/bindings/usb: Add bindings for PIC32 MUSB
 driver.
Date: Thu, 7 Apr 2016 16:38:02 +0300
Message-ID: <570662BA.5070207@cogentembedded.com>
References: <1460027775-20729-1-git-send-email-purna.mandal@microchip.com>
 <57065841.9020105@cogentembedded.com> <57065A4A.8090203@microchip.com>
 <57065CB4.5080108@cogentembedded.com> <57065F7F.6030902@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57065F7F.6030902@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Purna Chandra Mandal <purna.mandal@microchip.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org, Joshua Henderson <digitalpeer@digitalpeer.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 4/7/2016 4:24 PM, Purna Chandra Mandal wrote:

>>>>> Document devicetree binding for the USB controller
>>>>
>>>>      Device tree.
>>>>
>>> ack.
>>>
>>>>> and USB Phy found on Microchip PIC32 class devices.
>>>>
>>>>      PHY.
>>>>
>>> ack.
>>>
>>>>> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
>>>>>
>>>>> ---
>>>>>
>>>>>     .../bindings/usb/microchip,pic32-musb.txt          | 67 ++++++++++++++++++++++
>>>>>     1 file changed, 67 insertions(+)
>>>>>     create mode 100644 Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt b/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
>>>>> new file mode 100644
>>>>> index 0000000..e1cec9d
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
>>>>> @@ -0,0 +1,67 @@
>>>>> +Microchip PIC32 MUSB DRC/OTG controller
>>>>> +-------------------------------------------
>>>>> +
>>>>> +Required properties:
>>>>> + - compatible       : should be "microchip,pic32mzda-usb".
>>>>> + - reg              : offset and length of "MUSB Core Registers" and
>>>>> +                      "USB Clock & Reset Registers".
>>>>> + - reg-names        : should be "mc", and "usbcr" in order
>>>>> + - clocks           : clock specifier for the musb controller clock
>>>>> + - clock-names      : should be "usb_clk"
>>>>> + - interrupts       : interrupt number for MUSB Core General interrupt
>>>>> +                      and DMA interrupt
>>>>> + - interrupt-names  : must be "mc" and "dma" in order.
>>>>> + - phys             : phy specifier for the otg phy.
>>>>> + - dr_mode          : should be one of "host", "peripheral" or "otg".
>>>>> + - mentor,multipoint: Should be "1" indicating the musb controller supports
>>>>> +                      multipoint. This is MUSB configuration-specific setting.
>>>>> + - mentor,num-eps   : Specifies the number of endpoints. This is also a
>>>>> +                      MUSB configuration-specific setting. Should be set to "8".
>>>>> + - mentor,ram-bits  : Specifies the ram address size. Should be set to "11".
>>>>> + - mentor,power     : Should be "500". This signifies the controller can supply
>>>>> +                      up to 500mA when operating in host mode.
>>>>
>>>>      No, these "nentor" prefixed parameters must be determined from the "compatible" prop.
>>>>
>>> Prefix "mentor" here is used to signify configuration of the MUSB controller IP, not
>>> specifics of the chip or glue logic.
>>
>>     I know.
>>
>>> Please suggest if replacing with "microchip" makes it better.
>>
>>     No, nothing of that sort. These parameters are probably fixed for the said PIC32 implementation? If so, they shouldn't appear as the node props but should instead be hard-coded in the glue layer. Don't look at the OMAP glues, they are a bad example.
>
> ack. Will hard code.

    Except "mentor, power", that is. It was a part of the real platform data, 
not the MUSB config. structure.

[...]

> Thanks, Purna

MBR, Sergei
