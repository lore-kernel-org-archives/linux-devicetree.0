From: <colin.helliwell-ZqAGQOxBGgIxoycv7ERPSQ@public.gmane.org>
Subject: Device driver - parsing GPIOs from tree
Date: Tue, 25 Oct 2016 13:50:45 +0100
Message-ID: <047d01d22ebe$6803f740$380be5c0$@ln-systems.com>
Reply-To: <colin.helliwell-ZqAGQOxBGgIxoycv7ERPSQ@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
References: 
In-Reply-To: 
Content-Language: en-gb
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

I'm writing my own device driver for some GPIOs on my hardware. I’ve
successfully created the pins in the Device Tree, and in my driver I’ve been
able to find the pins in the device tree using 'of_get_named_gpio_flags()'
when they are at a top level (e.g. ‘test-name’ shown below).
But for neatness I would prefer to group them hierarchically e.g.

    rfctrl: rfctrl {
        compatible = "wg2xx-rfctrl";
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_rfctrl>;
        status = "okay";

        test-name = <&gpio4 25 0>;
        jn {
            jnProgN = <&gpio4 26 0>;
        };
        alt {
            altGpio0 = <&gpio4 27 0 >;
            altGpio1 = <&gpio4 28 0 >;
            altGpio2 = <&gpio4 29 0 >;
            altGpio3 = <&gpio4 30 0 >;
        };
    };
 
Is there a way to search within the subtree ("jn" or "alt"), or to descend
into it and then use 'of_get_named_gpio_flags()’?
Thanks.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
