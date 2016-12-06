From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] Add DT bindings documentation for Synopsys UDC driver
Date: Tue, 6 Dec 2016 16:23:12 +0530
Message-ID: <CAEHZuqPsk5ZDDoY=ZO2p1sAtQsGRWktaOrBB3RBLi=L6=UL_FQ@mail.gmail.com>
References: <1480485910-7797-1-git-send-email-raviteja.garimella@broadcom.com>
 <1480485910-7797-2-git-send-email-raviteja.garimella@broadcom.com> <20161205230420.ubo2cskoohfnwlfs@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205230420.ubo2cskoohfnwlfs@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Dec 6, 2016 at 4:34 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Nov 30, 2016 at 11:35:09AM +0530, Raviteja Garimella wrote:
>> This patch adds documentation for Synopsis Designware Cores AHB
>> Subsystem Device Controller (UDC).
>>
>> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/usb/snps,dw-ahb-udc.txt    | 29 ++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>> new file mode 100644
>> index 0000000..64e1fbf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
>> @@ -0,0 +1,29 @@
>> +Synopsys USB Device controller.
>> +
>> +The device node is used for Synopsys Designware Cores AHB
>> +Subsystem Device Controller (UDC).
>> +
>> +Required properties:
>> + - compatible: should be "snps,dw-ahbudc"
>
> Needs an SoC specific compatible string.

This will be changed. I am working on using amd5536udc.c driver
which's already in Kernel tree and can be used for this UDC(as per
review comments from Felipe/John).
>
>> + - reg: Offset and length of UDC register set
>> + - interrupts: description of interrupt line
>> + - phys: phandle to phy node.
>> + - phy-names: name of phy node. Must be usb2drd.
>
> A name is pointless when there's only 1 phy. Is this a device or dual
> role device(DRD)?

This is DRD phy that's is connected to a Host Controller and a Device
Controller.
>
>> + - extcon: phandle to the extcon device
>
> I don't think extcon should be required. If this is UDC only, I'm not
> sure why you'd need it.

This Phy will be initialized in Host/Device mode based on the external
connector that's plugged in. That's reason for having extcon node.
>
>> +
>> +Example:
>> +
>> +     usbdrd_phy: phy@6501c000 {
>> +             #phy-cells = <0>;
>> +             compatible = "brcm,ns2-drd-phy";
>> +             reg = <0x66000000 0x1000>,
>> +     }
>> +
>> +     udc_dwc: usb@664e0000 {
>> +             compatible = "snps,dw-ahb-udc";
>
> Doesn't match above.

This will be changed.
>
>> +             reg = <0x664e0000 0x2000>;
>> +             interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
>> +             phys = <&usbdrd_phy>;
>> +             phy-names = "usb2drd";
>> +             extcon = <&usbdrd_phy>";
>
> You are already describing the phy connection, you shouldn't need both.

"extcon_get_edev_by_phandle" requires extcon phandle. I see that's the
only way to get the extcon device, since generic Phy device doesn't
have any extcon member.
The current driver will not go as-is after the suggestion I got in UDC
driver review (to use amd5536udc driver). I will work on the changes
and submit the patches once again.

Thanks,
Ravi
>
>> +     };
>> --
>> 2.1.0
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
