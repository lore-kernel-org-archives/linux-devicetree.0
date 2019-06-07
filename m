From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: add binding for USBSS-DRD controller.
Date: Fri, 7 Jun 2019 12:25:57 +0300
Message-ID: <64be9d26-2a68-1b90-89c8-29b227e0cd9c@ti.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
 <1559729030-16390-2-git-send-email-pawell@cadence.com>
 <f032b3f3-409d-b0fc-8d5f-01c898b4c7a7@ti.com>
 <BYAPR07MB470903AF06C1F8A34BBB3C64DD100@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB470903AF06C1F8A34BBB3C64DD100@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

On 07/06/2019 07:46, Pawel Laszczak wrote:
> 
>>
>> Pawel,
>>
>> On 05/06/2019 13:03, Pawel Laszczak wrote:
>>> This patch aim at documenting USB related dt-bindings for the
>>> Cadence USBSS-DRD controller.
>>>
>>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>
>>> ---
>>>  .../devicetree/bindings/usb/cdns-usb3.txt     | 30 +++++++++++++++++++
>>>  1 file changed, 30 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/cdns-usb3.txt b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
>>> new file mode 100644
>>> index 000000000000..1d2b449e3cb4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
>>> @@ -0,0 +1,30 @@
>>> +Binding for the Cadence USBSS-DRD controller
>>> +
>>> +Required properties:
>>> +  - reg: Physical base address and size of the controller's register areas.
>>> +	 Controller has 3 different regions:
>>> +	 region 1 - HOST registers area
>>> +	 region 2 - DEVICE registers area
>>> +	 region 3 - OTG/DRD registers area
>>> +  - reg-names - register memory area names:
>>> +	"xhci" - for HOST registers space
>>> +	"dev" - for DEVICE registers space
>>> +	"otg" - for OTG/DRD registers space
>>> +  - compatible: Should contain: "cdns,usb3-1.0.0" or "cdns,usb3-1.0.1"
>>> +  - interrupts: Interrupts used by cdns3 controller.
>>
>> Since we are requesting 3 separate named interrupts in code we need to
>> mention them here.
> 
> Hi Roger, 
> 
> Yes, I know, but this code is Reviewed-by: Rob Herring, so I thought to add 
> this as separate patch after putting this driver into kernel.
> 

Binding document should be updated as code changes.

> I assume that after making some change in this file I should remove statement
> Reviewed-by: Rob Herring <robh@kernel.org> from this patch to start reviving 
> from the beginning.  

Yes.

> 
> What do you think about such dt-binding:
> 
> Required properties:
>   - reg: Physical base address and size of the controller's register areas.
>          Controller has 3 different regions:
>          region 1 - HOST registers area
>          region 2 - DEVICE registers area
>          region 3 - OTG/DRD registers area

Is it so that region 1 is always HOST?
offset 0 seems to be OTG though.

If it is implementation specific then you could get rid of numbering.

>   - reg-names - register memory area names:
>         "xhci" - for HOST registers space
>         "dev" - for DEVICE registers space
>         "otg" - for OTG/DRD registers space
>   - compatible: Should contain:
>         "cdns,usb3-1.0.0" - for 0x00024502 controller version
>         "cdns,usb3-1.0.1" - for 0x00024509 controller version
>         "cdns,usb3-1.0.2" - for 0x0002450C controller version
>         "cdns,usb3-1.0.3" - for 0x0002450d controller version
> 
> - interrupts: Interrupts used by cdns3 controller:
>         "host" - interrupt used by XHCI driver.
>         "peripheral" - interrupt used by device driver
>         "otg" - interrupt used by DRD/OTG  part of driver
> 
> Optional properties:
>  - maximum-speed : valid arguments are "super-speed", "high-speed" and
>                    "full-speed"; refer to usb/generic.txt
>  - dr_mode: Should be one of "host", "peripheral" or "otg".
>  - phys: reference to the USB PHY

need to add 'phy-names' since you request the PHY with name.

>  - on-chip-buff-size : size of memory intended as internal memory for endpoints
>         buffers expressed in KB
> 
> Example:
>         usb@f3000000 {
>                 compatible = "cdns,usb3-1.0.1";
>                 interrupts = <USB_HOST_IRQ  7 IRQ_TYPE_LEVEL_HIGH>

coma missing.
>                                 <USB_DEVICE_IRQ  7 IRQ_TYPE_LEVEL_HIGH>
here too.
>                                 <USB_OTG_IRQ  8 IRQ_TYPE_LEVEL_HIGH>;

What is 7 and 8 ?

>                 interrupt-names = "host", "peripheral", "otg";
>                 reg = <0xf3000000 0x10000       /* memory area for HOST registers */

should end with >,

>                         0xf3010000 0x10000      /* memory area for DEVICE registers */
here too

>                         0xf3020000 0x10000>;    /* memory area for OTG/DRD registers */
>                 reg-names = "xhci", "dev", "otg";
>         };

Isn't otg at offset 0, xhci at offset 0x10000 and dev at offset 0x20000?

> 
> Is this correct now ?
> 
> Maybe I should add something additionally for phy ?

e.g.

                        phys = <&usb3_phy>;
                        phy-names = "cdns3,usbphy";

> 
> Regards,
> Pawel
> 
>   
>>
>>> +
>>> +Optional properties:
>>> + - maximum-speed : valid arguments are "super-speed", "high-speed" and
>>> +                   "full-speed"; refer to usb/generic.txt
>>> + - dr_mode: Should be one of "host", "peripheral" or "otg".
>>> + - phys: reference to the USB PHY
>>> +
>>> +Example:
>>> +	usb@f3000000 {
>>> +		compatible = "cdns,usb3-1.0.1";
>>> +		interrupts = <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
>>
>> This example won't work as code requests for 3 separate interrupts.
>>
>>> +		reg = <0xf3000000 0x10000	/* memory area for HOST registers */
>>> +			0xf3010000 0x10000	/* memory area for DEVICE registers */
>>> +			0xf3020000 0x10000>;	/* memory area for OTG/DRD registers */
>>> +		reg-names = "xhci", "dev", "otg";
>>> +	};
>>>
>>


-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
