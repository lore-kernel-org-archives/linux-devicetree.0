Return-Path: <SRS0=ySGx=QB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-gw.unlimitedwebhosting.co.uk ([149.255.60.82]:41495 "EHLO
        mail-gw.unlimitedwebhosting.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726179AbfAYTDM (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 25 Jan 2019 14:03:12 -0500
Received: from uwhbsf01.unlimitedwebhosting.co.uk (mail-gw.unlimitedwebhosting.co.uk [149.255.60.72])
        by mail-gw.unlimitedwebhosting.co.uk (Postfix) with ESMTPS id C450E60ACA31
        for <devicetree@vger.kernel.org>; Fri, 25 Jan 2019 19:03:10 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] dt-bindings: Create the file for Realtek Bluetooth
 serial devices
References: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
 <20190121203928.32723-2-beagleboard@davidjohnsummers.uk>
 <CAGb2v64j=hGFhb3GVocRo9B1uY+tFBjbrm6F71L4ejA+cruUvA@mail.gmail.com>
From: David Summers <beagleboard@davidjohnsummers.uk>
Message-ID: <1fee0e05-5b41-ab24-8fe7-0f8c58479f19@davidjohnsummers.uk>
Date: Fri, 25 Jan 2019 19:03:08 +0000
MIME-Version: 1.0
In-Reply-To: <CAGb2v64j=hGFhb3GVocRo9B1uY+tFBjbrm6F71L4ejA+cruUvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-PH
Sender: devicetree-owner@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chen-Yu,

Thanks for the interest, and sorry for the slow reply - I've been away 
on business.

The latter was why my patches were so terse. I'd done v3 at the weekend:

https://www.spinics.net/lists/linux-bluetooth/msg78694.html

But Rob and Marcel wanted minor changes:

https://www.spinics.net/lists/linux-bluetooth/msg78706.html
https://www.spinics.net/lists/linux-bluetooth/msg78713.html

Now as I was going away, I quickly made the changes requested, and 
posted night before I left.

Your questions are good, but without a clear answer. What I will say is 
that

  * the device drive hci_h5 is a bluetooth hci 3 wire driver
  * I take this to be GND,RX,TX
  * I also assume this means BCSP
  * BCSP is either 3 wire or 5 wire
  * The device tree hooks I took from

    https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f758887048578ada61a4b7ab8e678

  * a patch direct from ASUS, and so I take it this is how the board is
    wired up.
  * If you look at the datasheet:
    http://files.pine64.org/doc/datasheet/pine64/RTL8723BS.pdf
  * You can see as well and RX and TX on pin 42,42 there is a UART_CTS
    on 44,  BT_WAKE on 6, BT_HOST_WAKE
  * So I'm guessing these are wired up as described in the asus device tree

Now my problem is I don't have a board, I'm trying to mainline this your 
Arm Arch users.

So really this asks the question as to if the hci_h5 is the correct 
driver for the RTL8723BS; I think hci_h5 is intended just for 3 wire - 
so probably can't get changes there. Does make you wonder if there 
should be a more general driver?

Anyway, I'm not expert here. Really just want to get this chip supported 
in the device tree. So I just did the minimal to load the module.

If you have any thoughts though, do let the thread know.

Regards,

David.


On 22/01/2019 02:40, Chen-Yu Tsai wrote:
> Hi,
>
> Interested party here. I'd like to get this working on the Pine64 which has
> an RTL8723BS module. I had made some changes and had it working but didn't
> get around to doing the patches yet.
>
> On Tue, Jan 22, 2019 at 4:39 AM David Summers
> <beagleboard@davidjohnsummers.uk> wrote:
>> With the changes requested by Marcel Holtmann and Rob Herring.
>>
>> Capitalisation as requested.
>>
>> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
> The commit log is a bit lacking, as it doesn't provide any context or details
> relevant to the changes in this patch, but also has details that should be
> in the changelog, and not the commit log.
>
>> ---
>>   .../bindings/net/realtek-bluetooth-serial.txt | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
>>
>> diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
>> new file mode 100644
>> index 000000000000..2eddde1a0cf1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
>> @@ -0,0 +1,32 @@
>> +Realtek Bluetooth devices connected via a UART.
>> +These devices typically also have a WI-FI connected via SDIO - the
>> +compatible described here is used just for referencing the Bluetooth.
>> +
>> +- compatible: should be "realtek,<name>-bt"
>> +  except for "realtek,trl8761atv" - which only has a serial Bluetooth connection
>> +       "realtek,rtl8723as-bt"
>> +       "realtek,rtl8723bs-bt"
>> +       "realtek,rtl8723ds-bt"
>> +       "realtek,rtl8761atv"
>> +       "realtek,rtl8821as-bt"
>> +       "realtek,rtl8821cs-bt"
>> +       "realtek,rtl8822bs-bt"
>> +
>> +Example:
>> +
>> +&uart0 {
>> +       status = "okay";
>> +       pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
>> +       bluetooth {
>> +               compatible = "realtek,rtl8723bs-bt";
>> +               uart_rts_gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
>> +               pinctrl-names = "default","rts_gpio";
>> +               pinctrl-0 = <&uart0_rts>;
>> +               pinctrl-1 = <&uart0_gpios>;
>> +               BT,reset_gpio    = <&gpio4 29 GPIO_ACTIVE_HIGH>;
>> +               BT,wake_gpio     = <&gpio4 26 GPIO_ACTIVE_HIGH>;
>> +               BT,wake_host_irq = <&gpio4 31 GPIO_ACTIVE_HIGH>;
> You haven't listed these three properties in the bindings.
>
> Second, for the last one, the property name says irq, but it takes
> a GPIO phandle. This is slightly misleading.
>
> Furthermore, ACPI already uses the names "device-wake-gpios",
> "enable-gpios", and "host-wake-gpios". Would it be possible to
> stick to those?
>
> Last, you don't actually add support for them in the driver.
>
> So why are they there?
>
> Regards
> ChenYu
>
>> +       };
>> +};
>> +
>> +this ensures that the Bluetooth device is tied to the correct uart.
>> --
>> beagleboard@davidjohnsummers.uk
>>
