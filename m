From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: shmobile: koelsch: enable HS-USB
Date: Fri, 10 Oct 2014 09:17:28 +0900
Message-ID: <54372598.8060000@renesas.com>
References: <1511869.4ca9KHmSFr@wasted.cogentembedded.com> <8674731.7YYzQeH0h1@wasted.cogentembedded.com> <5435DFD6.3050609@renesas.com> <543684B6.6060708@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <543684B6.6060708-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org" <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

(2014/10/09 21:51), Sergei Shtylyov wrote:
> Hello.
> 
> On 10/09/2014 05:07 AM, Yoshihiro Shimoda wrote:
> 
>>> Enable HS-USB device for the Koelsch board, defining the GPIO that the driver
>>> should check when probing (which is the ID output from MAX3355 OTG chip).
> 
>>> Note that there will be pinctrl-related error messages if both internal PCI
>>> and HS-USB drivers are enabled but they should be just ignored.
> 
>>> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>>> [Sergei: added pin function/group and prop, moved device node, fixed summary,
>>> added changelog]
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
>>> ---
>>> Changes in version 3:
>>> - added pinctrl-related properties;
>>> - moved the HS-USB node to precede the USB PHY node;
>>> - uppercased "arm" in the summary;
>>> - added changelog.
> 
>>>   arch/arm/boot/dts/r8a7791-koelsch.dts |    7 +++++++
>>>   1 file changed, 7 insertions(+)
> 
>>> Index: renesas/arch/arm/boot/dts/r8a7791-koelsch.dts
>>> ===================================================================
>>> --- renesas.orig/arch/arm/boot/dts/r8a7791-koelsch.dts
>>> +++ renesas/arch/arm/boot/dts/r8a7791-koelsch.dts
>>> @@ -464,6 +464,13 @@
>>>       pinctrl-names = "default";
>>>   };
>>>
>>> +&hsusb {
>>> +    status = "okay";
>>> +    pinctrl-0 = <&usb0_pins>;
>>> +    pinctrl-names = "default";
> 
>> Perhaps I don't understand the pinctrl world yet, but I have a question.
> 
>> In r8a7791, the USB0_PWEN is GP7_23 and the USB0_OVC is GP7_24. And,
>> the "usb0_pins" is related to these USB0 pins. But, as you know,
>> the koelsch has a OTG ID pin and it connects to GP5_31 via MAX3355 chip.
> 
>    The GPIO pins are not requested via pinctrl.
> 
>> So, would you tell me why koelsch needs the pinctrl?
> 
>    Because at least USB0_OVC/VBUS is used by HS-USB. I decided not to modify the R8A7791 PFC driver in order to create a group consisting of that signal alone (like on R8A7790), because we don't need to read GP7_23 on these boards, unlike Lager.

Thank you very much for the reply.
Finally I understood why it needs the princtrl.
(I didn't know the HS-USB will use the USB0_OVC/VBUS for detecting VBUS...)

Best regards,
Yoshihiro Shimoda

>> Best regards,
>> Yoshihiro Shimoda
> 
> WBR, Sergei
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
