From: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] dt-bindings: Document the STM32 USB OTG DWC2 core binding
Date: Fri, 24 Jun 2016 15:51:18 -0300
Message-ID: <CAF3+Tqe05kXExob_62w80BBbXz6p01-WwXM1+R6ecp0JtsgviA@mail.gmail.com>
References: <1466562349-5043-1-git-send-email-bruherrera@gmail.com>
 <1466562349-5043-3-git-send-email-bruherrera@gmail.com> <20160624154118.GA4598@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160624154118.GA4598@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.seppala-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 12:41 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jun 21, 2016 at 11:25:49PM -0300, Bruno Herrera wrote:
>> Signed-off-by: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
>> index 20a68bf..79e5370 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>> @@ -11,6 +11,7 @@ Required properties:
>>    - "lantiq,arx100-usb": The DWC2 USB controller instance in Lantiq ARX SoCs;
>>    - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
>>    - snps,dwc2: A generic DWC2 USB controller with default parameters.
>> +  - st,stm32-fsotg: The DWC2 USB controller instance in STM32F4 SoCs in FS mode;
>
> This should go above snps,dwc2.
>
Ok, tks!

> What determines FS mode vs. HS?
>
Its more HW design decision.
STM32F429/439/469 has two OTG controllers, one that is FS (internal
phy) and other that is HS (but can also work in FS mode with
internal/external phy)
This bind work with both cores FS and HS working with the internal PHY.

I tested the following configurations:
1 - STM32F429I-DISCOv1 board (OTG HS working in FS mode internal PHY)
2 - STM32F469I-DISCO board (OTG FS)

I did not tested OTG HS core working in FS mode with external PHY (I2C).

>>  - reg : Should contain 1 register range (address and length)
>>  - interrupts : Should contain 1 interrupt
>>  - clocks: clock provider specifier
>> --
>> 2.7.4 (Apple Git-66)
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
