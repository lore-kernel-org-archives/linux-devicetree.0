From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Sat, 6 Feb 2016 00:55:27 +0100
Message-ID: <CAEP=dzCDWTC1p1=gJebmLUQGqw+H8=T5wFNUbLBOh-uX=uuvLA@mail.gmail.com>
References: <1454693676-20211-1-git-send-email-petr@barix.com> <364593765.PbysHF8iXJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <364593765.PbysHF8iXJ@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5 February 2016 at 23:22, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> One more thing:
>
>>  3 files changed, 227 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
>> new file mode 100644
>> index 0000000..69c0961
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
>> @@ -0,0 +1,63 @@
>> +TI DA8xx MUSB
>> +~~~~~~~~~~~~~
>> +
>> +Required properties:
>> +~~~~~~~~~~~~~~~~~~~~
>> + - compatible : Should be "ti,da8xx-musb"
>> +
>
> Please make this
>
>         Should be one of "ti,da850-musb" or "ti,da830-musb"
>
> We don't use wildcards in compatible strings, so better use specific model
> names in case we later find something that is different betweent the models.

OK, I will update the binding. But is the MODULE_DEVICE_TABLE() in the
code able to handle wildcards?
Or do I need to create 2 entries in the code? I mean something like this:

static const struct of_device_id da8xx_id_table[] = {
       {
               .compatible = "ti,da850-musb"
       },
       {
               .compatible = "ti,da830-musb"
       },
      {},
};

MODULE_DEVICE_TABLE(of, da8xx_id_table);

Thanks
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
