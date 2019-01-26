Return-Path: <SRS0=+7pD=QC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-gw.unlimitedwebhosting.co.uk ([149.255.60.82]:45815 "EHLO
        mail-gw.unlimitedwebhosting.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725987AbfAZO0q (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 26 Jan 2019 09:26:46 -0500
Received: from uwhbsf01.unlimitedwebhosting.co.uk (mail-gw.unlimitedwebhosting.co.uk [149.255.60.72])
        by mail-gw.unlimitedwebhosting.co.uk (Postfix) with ESMTPS id A516A602D3F1
        for <devicetree@vger.kernel.org>; Sat, 26 Jan 2019 14:26:44 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] dt-bindings: Create the file for Realtek Bluetooth
 serial devices
References: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
 <20190121203928.32723-2-beagleboard@davidjohnsummers.uk>
 <CAL_Jsq+9zjPaDiJ0Uynp9p7WpH-NK-sT91vUm-+R7D_me8a9Mw@mail.gmail.com>
From: David Summers <beagleboard@davidjohnsummers.uk>
Message-ID: <712d0ad2-0003-881c-b066-9462d3d8fa11@davidjohnsummers.uk>
Date: Sat, 26 Jan 2019 14:26:39 +0000
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+9zjPaDiJ0Uynp9p7WpH-NK-sT91vUm-+R7D_me8a9Mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-PH
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Dear All,

OK - spent some time last night and today reading 
/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt and 
/Documentation/devicetree/bindings/serial/serial.txt; reviewing the Asus 
Tinker Board device tree, and the comments. What is clear:

 1. I do not have the time available to learn in detail the preferred
    linux style of device tree
 2. The example I gave was for the ASUS Tinker Board, taken from the
    rk3288-miniarm.dts
 3. The current ASUS Tinker Board device tree is a patch done by ASUS
    for debian:
    https://github.com/TinkerBoard/debian_kernel/blob/develop/arch/arm/boot/dts/rk3288-miniarm.dts
 4. This device tree is non standard, and not suitable for inclusion in
    mainline
 5. This device tree is the only really device tree available for the
    ASUS Tinker Board (S)
 6. The schematic for the ASUS Tinker Board is available on:
    https://www.asus.com/uk/Single-Board-Computer/Tinker-Board/
 7. The schematic is not detailed, it for example does not show how
    Bluetooth and Wi-Fi are wired
 8. The only hints on wiring are in the ASUS developed patches to the
    debian device tree
 9. The documentation for realtek Bluetooth will only be accepted with
    an example that is complete:
    https://www.spinics.net/lists/linux-bluetooth/msg78545.html
10. Marcel has only had major problem with the first version of the
    patch. Since changes made to hci_h5.c his only problem has the
    naming of the compatible names, where he needs an Ack from Rob:
    https://www.spinics.net/lists/linux-bluetooth/msg78637.html
11. Marcel needs the device tree compatible hooks documented:
    https://www.spinics.net/lists/linux-bluetooth/msg78445.html
12. Now it is clear that I don't have time to do documentation, of the
    required standard, that is applicable to the ASUS Tinker Board (S)
13. So it is with regret that on reflection I have decided to withdraw
    this patchset

This to my mind is a pity, ASUS Tinker Board (S) uses currently don't 
have good mainline support, most use the debian/ASUS rk3288-miniarm.dts 
device tree. Without mainlining, it is very hard to support this board 
in distributions like Arm Arch. But its also clear that I am not the 
person to mainline the support. I neither have the knowledge of the 
device tree. Access to proper schematics for the device. Nor the time 
available to do this.

Hopefully someone else will take up mainlining these boards. I hope the 
bits I've done will at least give someone else ideas on how to proceed, 
and that they will be more successful than I. I'll probably keep 
learning the preferred device tree vocabulary and grammar - but at a 
slow pace as time allows.

Thank you all for your time and help,

David Summers

On 25/01/2019 19:46, Rob Herring wrote:
> On Mon, Jan 21, 2019 at 2:39 PM David Summers
> <beagleboard@davidjohnsummers.uk> wrote:
>> With the changes requested by Marcel Holtmann and Rob Herring.
>>
>> Capitalisation as requested.
> Write something that makes sense for the git history. The above 2
> lines are not useful information.
>
>> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
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
> Don't show 'status' in examples.
>
>> +       pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
>> +       bluetooth {
>> +               compatible = "realtek,rtl8723bs-bt";
>> +               uart_rts_gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
> We already have a standard property name and location for handling RTS
> on a GPIO and this is not it.
>
>> +               pinctrl-names = "default","rts_gpio";
>> +               pinctrl-0 = <&uart0_rts>;
> This belongs in the parent node.
>
>> +               pinctrl-1 = <&uart0_gpios>;
>> +               BT,reset_gpio    = <&gpio4 29 GPIO_ACTIVE_HIGH>;
>> +               BT,wake_gpio     = <&gpio4 26 GPIO_ACTIVE_HIGH>;
>> +               BT,wake_host_irq = <&gpio4 31 GPIO_ACTIVE_HIGH>;
> All the above need to be documented. Putting in an example is not documented.
>
> Drop the 'BT,' as the part preceding the comma should be a vendor name
> if present and use '-' rather than '_' in property names.
>
> 'reset-gpios' is the standard name for a reset gpio. An irq should use
> the 'interrupts' binding even if connected to a GPIO on the host.
>
> Rob
