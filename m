From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: Add bindings for phy-da8xx-usb
Date: Fri, 15 Apr 2016 11:13:38 -0500
Message-ID: <57111332.5050808@lechnology.com>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
 <1460658919-4965-3-git-send-email-david@lechnology.com>
 <5710C6E1.8010401@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5710C6E1.8010401-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/15/2016 05:48 AM, Sergei Shtylyov wrote:
> On 4/14/2016 9:35 PM, David Lechner wrote:
>
>> Device tree binding for new phy-da8xx-usb driver.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>
>> v4 changes:
>>
>> * swapped order of usb20 and usb11 to be in logical order of reg address.
>>
>>   .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 40
>> ++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>> b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>> new file mode 100644
>> index 0000000..bead185
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>> @@ -0,0 +1,40 @@
>> +TI DaVinci DA8xx USB PHY
>
>     DA8xx is not DaVinci, please omit this.

Just to be sure, you mean omit "DaVinci"?

>
>> +
>> +Required properties:
>> + - compatible: must be "ti,da830-usbphy".
>> + - #phy-cells: must be 1.
>> +
>> +This device controls the PHY for both the USB 1.1 OHCI and USB 2.0 OTG
>> +controllers on DA8xx SoCs. Consumers of this device should use index
>> 0 for
>> +the USB 2.0 phy device and index 1 for the USB 1.1 phy device.
>
>     Not indices 2 and 1 already?

I changed this to reflect the TRM. USB0PHY = USB 2.0 and USB1PHY = USB 1.1

>
>> +    usbphy: usbphy {
>
>     Name it "usb-phy" please, consistent to what ePAPR has mandated for
> Ethernet PHYs.

Ack.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
