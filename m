From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC v2 4/5] DT bindings documentation for Synopsys UDC platform driver
Date: Fri, 20 Jan 2017 17:22:05 +0530
Message-ID: <CAEHZuqO-WBFzxhrvO-H-dorHDxjoNzLKXMS02SAj2KnOt5ZOaQ@mail.gmail.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
 <1484640308-25976-5-git-send-email-raviteja.garimella@broadcom.com> <20170119173659.jeao5pqtlepmidek@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119173659.jeao5pqtlepmidek@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Jan 19, 2017 at 11:06 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jan 17, 2017 at 01:35:07PM +0530, Raviteja Garimella wrote:
>> This patch adds device tree bindings documentation for Synopsys
>> USB device controller platform driver.
>
> Bindings describe h/w, not drivers.

 Will correct the commit message.

>>
>> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
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

Is it fine to have "brcm,iproc-udc"?
iProc refers to a Broadcom family of processors that includes
above mentioned SoCs.

I see there are some compatible strings that are based on the IP,
and some based on the SoCs. I chose to have the IP based string.
Please let me know which one would be agreeable in this case.

I will also correct the typo in the above notes -- it meant to be
UDCs integrated into Broadcom's Northstar2 and Cygnus SoC's.

>
>> +
>> +Required properties:
>> + - compatible: should be "snps,dw-ahb-udc"
>
> This is a different IP than DWC2?

Yes, this is different IP. DWC2 is HS OTG.

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

Currently we can't get the extcon node from Phy.
"extcon_get_edev_by_phandle" requires "extcon" property, else would fail.
As Scott said in one of the comments, we can drop this when we get that
support in kernel. Is it fine?

Thanks,
Ravi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
