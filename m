From: Raul Piper <raulpblooper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Dynamic Loading and unnloading of Device tree(dtb)
Date: Mon, 25 Jul 2016 16:47:51 +0530
Message-ID: <CAEwN+MAqQSz7wXYZKrVGwH7arknH-487oC2U5pP0T1N0QxBnWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernelnewbies <kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
Where can I find the example for the  dynamic Loading of the device
tree and its corresponding device driver.
How can I build the dts with or without the kernel source.

I am getting this error whenever I am trying to build the below sample
dts file using the dtc compiler.

dtc -O dtb -o leds-ns2.dtb leds-ns2.dts


Error: leds-ns2.dts:1.1-2 syntax error
FATAL ERROR: Unable to parse input tree

Below is the content  of the leds-ns2.dts

#include <dt-bindings/leds/leds-ns2.h>

 ns2-leds {
          compatible = "lacie,ns2-leds";

          blue-sata {
                  label = "ns2:blue:sata";
                  slow-gpio = <&gpio0 29 0>;
                  cmd-gpio = <&gpio0 30 0>;
                  modes-map = <NS_V2_LED_OFF  0 1
                               NS_V2_LED_ON   1 0
                               NS_V2_LED_ON   0 0
                               NS_V2_LED_SATA 1 1>;
          };
  };

Thanks,
R
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
