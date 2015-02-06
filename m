From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] Documentation: dt-bindings: add dt binding info for hi6220
Date: Fri, 6 Feb 2015 13:49:29 +0800
Message-ID: <CABQgh9Hx7_-vNg2nbju_mPEZMj6KB4Sj37mk6jqnj7AS2zOMLw@mail.gmail.com>
References: <1423147620-5760-1-git-send-email-zhangfei.gao@linaro.org>
	<1423147620-5760-3-git-send-email-zhangfei.gao@linaro.org>
	<54D3B541.1070404@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D3B541.1070404-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6 February 2015 at 02:24, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>> diff --git a/Documentation/devicetree/bindings/usb/hi6220-usb.txt
>> b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
>> new file mode 100644
>> index 0000000..e926364
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/hi6220-usb.txt
>> @@ -0,0 +1,50 @@
>> +Hisilicon hi6220  SoC USB controlle
>
>
>    Controller.
Yes, my mistake.
To prevent spelling error next time, will paste to google doc first
for the auto spelling check.

>
>> +-----------------------------
>> +
>> +usb controller is inherited from dwc2, refer dwc2.txt
>> +-----
>> +
>> +Required properties:
>> +- compatible: "hisilicon,hi6220-usb-phy"
>
>
>    PHY? I thought you were describing the USB controller.
my bad
should be compatible: "hisilicon,hi6220-usb"

>
>> +Refer to dwc2.txt for dwc2 usb properties
>> +
>> +
>> +phy:
change to PHY:
>> +-----
>> +
>> +Required properties:
>> +- compatible: "hisilicon,hi6220-usb-phy"
>> +- vcc-supply: phandle to the regulator that provides power to the PHY.
>> +- clocks: phandle to the PHY clock. Use as per Documentation/devicetree
>
>
>    Actually, it's phandle and clock specifier.
Change to
 - clocks: phandle and clock specifier of the PHY clock.

>
>> +  /bindings/clock/clock-bindings.txt
>> +- hisilicon,peripheral-syscon: phandle of syscon used to control
>> peripheral.
>> +- hisilicon,gpio_vbus_det: gpio of detecting vbus.
>> +- hisilicon,gpio_id_det: gpio of detecting id.
>
>
>    Hyphens are preferred over underscores in the prop names.
Change to
- hisilicon,gpio-vbus-det: gpio of detecting vbus.
- hisilicon,gpio-id-det: gpio of detecting id.

Thanks Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
