From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] DT: iio: adc: Add CC_10001 binding documentation
Date: Mon, 10 Nov 2014 16:59:48 -0300
Message-ID: <54611934.6050701@imgtec.com>
References: <1415224611-22096-1-git-send-email-ezequiel.garcia@imgtec.com> <1415224611-22096-3-git-send-email-ezequiel.garcia@imgtec.com> <545E1333.9010904@kernel.org> <5461170B.7070505@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5461170B.7070505-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Phani Movva <phani.movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/10/2014 04:50 PM, Ezequiel Garcia wrote:
> On 11/08/2014 09:57 AM, Jonathan Cameron wrote:
>> On 05/11/14 21:56, Ezequiel Garcia wrote:

>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/cc_10001_adc.txt b/Documentation/devicetree/bindings/iio/adc/cc_10001_adc.txt
>>> new file mode 100644
>>> index 0000000..6491839
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/adc/cc_10001_adc.txt
>>> @@ -0,0 +1,19 @@
>>> +* Cosmic Circuits - Analog to Digital Converter (CC-10001-ADC)
>>> +
>>> +Required properties:
>>> +  - compatible: Should be "cosmic,10001-adc"
>>> +  - reg: Should contain adc registers location and length.
>>> +  - cosmic,adc-available-channels: Bitmask of the channels currently enabled.
>> I suspect there may be other preferred ways of doing this (child nodes perhaps
>> for each enabled channel?)
> 
> Hm, I'm not sure about this. As far I can recall, if a node has children
> then it *must* be a bus, which is not the case. Of course, you'll find
> examples doing this wrong.
> 

On a second thought... I guess you meant something like this?

adc: adc@18101600 {
        compatible = "cosmic,10001-adc";
        reg = <0x18101600 0x24>;
        clocks = <&adc_clk>;
        clock-names = "adc";
        vref-supply = <&reg_1v8>;
        cosmic,channels {
                #address-cells = <1>;
                #size-cells = <0>;
                channel@0 {
                        reg = <0>;
                };
                channel@1 {
                        reg = <1>;
                };
        };
};

Might be better, but I don't have a strong opinion on it.

-- 
Ezequiel
