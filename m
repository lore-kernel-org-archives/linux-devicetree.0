From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Fri, 12 Feb 2016 20:26:48 +0300
Message-ID: <56BE15D8.3020303@cogentembedded.com>
References: <1455188466-10879-1-git-send-email-petr@barix.com>
 <20160212162110.GA21833@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160212162110.GA21833@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 02/12/2016 07:21 PM, Rob Herring wrote:

>> This adds DT support for the TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver.
>>
>> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
>> ---
>>   .../devicetree/bindings/usb/da8xx-usb.txt          | 47 ++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
>> new file mode 100644
>> index 0000000..62dcc51
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
>> @@ -0,0 +1,47 @@
>> +TI DA8xx MUSB
>> +~~~~~~~~~~~~~
>> +For DA830 and DA850 platforms.
>> +
>> +Required properties:
>> +~~~~~~~~~~~~~~~~~~~~
>> + - compatible : Should be set to "ti,da830-musb".
>> +
>> + - reg: Offset and length of the USB controller register set.
>> +
>> + - interrupts: The USB interrupt number.
>> +
>> + - interrupt-names: Should be set to "mc".
>> +
>> + - dr_mode: The USB operation mode. Should be one of "host", "peripheral" or "otg".
>> +
>> + - mentor,power : Specifies the maximum current in milliamperes the controller can
>> +     supply in host mode.
>
> Still a no for me.

    Note that it's been used twice already, for musb_dsps.c and omap2430.c 
glues (in the latter case the prop was called just "power"). The corresponding 
field is a part of the 'struct musb_hdrc_platform_data'.

> Looks like this just sets hcd->power_budget. This
> property may not be a regulator, but ultimately the value depends on
> some regulator supplying Vbus.

    Yes.

> Also, given this has nothing to do with MUSB h/w,

    This regulator is controlled by the DRVVBUS signal from MUSB h/w!

> however this is described should be generic.

    You mean just "power", w/o the vendor prefix?

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
