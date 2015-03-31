From: Robert Baldyga <r.baldyga@samsung.com>
Subject: Re: [PATCH 4/4] Documentation: extcon: usb-gpio: update usb-gpio
 binding description
Date: Tue, 31 Mar 2015 14:04:55 +0200
Message-ID: <551A8D67.4060701@samsung.com>
References: <1427787963-23562-1-git-send-email-r.baldyga@samsung.com>
 <1427787963-23562-5-git-send-email-r.baldyga@samsung.com>
 <551A74F5.4050900@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <551A74F5.4050900@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi,

On 03/31/2015 12:20 PM, Roger Quadros wrote:
> On 31/03/15 10:46, Robert Baldyga wrote:
>> Add information about VBUS pin detection support, 'debounce' property
>> and some other details.
>>
>> Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
>> ---
>>  .../devicetree/bindings/extcon/extcon-usb-gpio.txt | 23 ++++++++++++++++++++--
>>  1 file changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>> index af0b903..d3fcf8b 100644
>> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>> @@ -1,16 +1,35 @@
>>  USB GPIO Extcon device
>>  
>> -This is a virtual device used to generate USB cable states from the USB ID pin
>> -connected to a GPIO pin.
>> +This is a virtual device used to generate USB cable states from the USB
>> +ID and VBUS signals connected to a GPIO pins.
> 
> s/to a GPIO/to GPIO/
> 
>> +
>> +Some devices has only one of these GPIO pins, so we support cases when
> s/has/have/
> 
>> +only one of them is present. Hence properties 'id-gpio' and 'vbus-gpio'
>> +are described as optional, but at least one of them has to be present
>> +in extcon-usb-gpio node.
>> +
>> +In general we have three cases:
>> + 1. We have both VBUS and ID pin detection - we can detect USB, USB-HOST
>> +    and cable disconnection.
> 
> The interpretation of "cable disconnect" might not be always true.
> ID may be 1 and VBUS 0 but cable might still not be disconnected.
> e.g. if both are OTG devices.
> That's why we have ADP to detect cable connect/disconnect status for OTG case.
> 
> So let's leave cable disconnection interpretation to the USB stack and
> just deal with passing ID/VBUS status. I must admit that the extcon cable
> state names are misleading. They should really have been named
> USB-ID and USB-VBUS :).

I thought the same.

Chanwoo, what do you think about such naming convention change? USB
cable detection in general is needed mainly for OTG, so having cable
state names clearly related to OTG statemachine states seems to be good
idea.

> 
> The driver doesn't do connect/disconnect detection but only infers the other
> pin state if only one of the ID/VBUS is available.
> 
>> + 2. We have only VBUS detection - we can detect USB and cable disconnection.
>> + 3. We have ID pin only - we can distinguish between USB and USB-HOST
>> +    but without ability to detect cable disconnection.
> 
> how about rewording these 3 points like so with a short header about
> clarification of extcon USB/USB_HOST states.
> 
> The extcon cable states USB and USB_HOST are actually VBUS and (inverted) ID
> pin states and do not indicate what mode the USB needs to operate in.
> That decision is done by the USB stack.
> 
> 1. If VBUS and ID gpios are present we pass them as is
> 	USB-HOST = !ID, USB = VBUS
> 2. If only VBUS gpio is present we assume that ID pin is always High.
> 	USB-HOST = false, USB = VBUS.
> 3. If only ID pin is available we infer the VBUS pin states based on ID.
> 	USB-HOST = !ID, USB = ID
> 

Thanks for comments. I will try to fix it up.

Best regards,
Robert Baldyga
