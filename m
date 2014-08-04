From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] usb: renesas_usbhs: Add device tree bindings documentation
Date: Mon, 4 Aug 2014 13:24:54 +0900
Message-ID: <53DF0B16.4040405@renesas.com>
References: <53DB7EBA.3080004@renesas.com> <53DB97B7.2090203@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <53DB97B7.2090203@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, SH-Linux <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

(2014/08/01 22:35), Sergei Shtylyov wrote:
> Hello.
> 
> On 08/01/2014 03:49 PM, Yoshihiro Shimoda wrote:
> 
>> Document the device tree bindings for the Renesas USBHS controller.
> 
>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> ---
>>   .../devicetree/bindings/usb/renesas_usbhs.txt      |   24 ++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> 
>> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
>> new file mode 100644
>> index 0000000..e9faa65
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
>> @@ -0,0 +1,24 @@
>> +Renesas Electronics USBHS driver
>> +
>> +Required properties:
>> +  - compatible: Must contain one of the following:
>> +	- "renesas,usbhs-r8a7790"
>> +	- "renesas,usbhs-r8a7791"
>> +  - reg: Base address and length of the register for the USBHS
>> +  - interrupts: Interrupt specifier for the USBHS
>> +  - clocks: A list of phandle + clock specifier pairs
>> +
>> +Optional properties:
>> +  - buswait_bwait: Integer to use BUSWAIT register
> 
>    Should be named "renesas,buswait-bwait" or probably just "renesas,buswait".

Thank you for the point. I will fix this name to "renesas,buswait".

>> +  - enable-gpio: A gpio specifier to check GPIO determining if USB function
> 
>    Should also be prefixed with "renesas,".

I will fix this name to "renesas,enable-gpio".

Best regards,
Yoshihiro Shimoda

> [...]
> 
> WBR, Sergei
> 
