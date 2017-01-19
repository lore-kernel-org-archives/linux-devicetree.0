From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [RFC v2 4/5] DT bindings documentation for Synopsys UDC platform
 driver
Date: Thu, 19 Jan 2017 11:30:46 -0800
Message-ID: <f86f32cd-8fed-c30f-d647-8f7992013458@broadcom.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
 <1484640308-25976-5-git-send-email-raviteja.garimella@broadcom.com>
 <20170119173659.jeao5pqtlepmidek@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170119173659.jeao5pqtlepmidek@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Raviteja Garimella <raviteja.garimella@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 17-01-19 09:36 AM, Rob Herring wrote:
> On Tue, Jan 17, 2017 at 01:35:07PM +0530, Raviteja Garimella wrote:
>> This patch adds device tree bindings documentation for Synopsys
>> USB device controller platform driver.
>
> Bindings describe h/w, not drivers.
>>
>> Signed-off-by: Raviteja Garimella <raviteja.garimella@broadcom.com>
>> ---
>>  .../devicetree/bindings/usb/snps,dw-ahb-udc.txt    | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>> new file mode 100644
>> index 0000000..0c18327
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>> @@ -0,0 +1,27 @@
>> +Synopsys USB Device controller.
>> +
>> +The device node is used for Synopsys Designware Cores AHB
>> +Subsystem Device Controller (UDC).
>> +
>> +This device node is used by UDCs integrated it Broadcom's
>> +Northstar2 and Cygnus SoC's.
>
> You need compatible strings for these in addition.
>
We don't need compatibility strings when an IP block is integrated into 
an SoC.  Otherwise each time we add the IP block to a new SoC we would 
need to update ever linux driver that supports that SoC.  That doesn't 
make sense?

Cygnus and Northstar2 use existing drivers for such block as UARTs, SPI 
controllers, NAND controllers, etc, etc.  We haven't added compatibility 
strings for those drivers and won't be.

Perhaps comment above can be:
This device node is used by UDCs integrated it such as Broadcom's
Northstar2 and Cygnus SoC's.
>> +
>> +Required properties:
>> + - compatible: should be "snps,dw-ahb-udc"
>
> This is a different IP than DWC2?
>
>> + - reg: Offset and length of UDC register set
>> + - interrupts: description of interrupt line
>> + - phys: phandle to phy node.
>> + - extcon: phandle to the extcon device. This is optional and
>> +   not required for those that don't require extcon support.
>> +   Extcon support will be required if the UDC is connected to
>> +   a Dual Role Device Phy that supports both Host and Device
>> +   mode based on the external cable.
>
> Drop this. It should be a part of the phy. Also, I don't care to see new
> users of extcon binding because it needs redoing.
>
We may need extcon support to support DRD Phy though.  We have to work 
within the framework that exists in linux today.  If modified in the 
future adapt to it as needed?

Regards,
  Scott
