From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Dynamic Loading and unnloading of Device tree(dtb)
Date: Wed, 3 Aug 2016 12:36:40 -0700
Message-ID: <57A247C8.8000909@gmail.com>
References: <CAEwN+MAqQSz7wXYZKrVGwH7arknH-487oC2U5pP0T1N0QxBnWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEwN+MAqQSz7wXYZKrVGwH7arknH-487oC2U5pP0T1N0QxBnWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raul Piper <raulpblooper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernelnewbies <kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/25/16 04:17, Raul Piper wrote:
> Hi,
> Where can I find the example for the  dynamic Loading of the device
> tree and its corresponding device driver.
> How can I build the dts with or without the kernel source.
> 
> I am getting this error whenever I am trying to build the below sample
> dts file using the dtc compiler.
> 
> dtc -O dtb -o leds-ns2.dtb leds-ns2.dts
> 
> 
> Error: leds-ns2.dts:1.1-2 syntax error

That is an error at line 1, columns 1-2. dtc does not understand cpp
directives, you need to process leds-ns2.dts with cpp. The Linux
build infrastructure does this for .dtb targets in makefiles.

> FATAL ERROR: Unable to parse input tree
> 
> Below is the content  of the leds-ns2.dts
> 
> #include <dt-bindings/leds/leds-ns2.h>
> 
>  ns2-leds {
>           compatible = "lacie,ns2-leds";
> 
>           blue-sata {
>                   label = "ns2:blue:sata";
>                   slow-gpio = <&gpio0 29 0>;
>                   cmd-gpio = <&gpio0 30 0>;
>                   modes-map = <NS_V2_LED_OFF  0 1
>                                NS_V2_LED_ON   1 0
>                                NS_V2_LED_ON   0 0
>                                NS_V2_LED_SATA 1 1>;
>           };
>   };
> 
> Thanks,
> R
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
