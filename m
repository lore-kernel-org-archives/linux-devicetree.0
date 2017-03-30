From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/7] pinctrl: dt-bindings: Add documentation for Armada 37xx pin controllers
Date: Thu, 30 Mar 2017 18:18:08 +0200
Message-ID: <87d1cy91rz.fsf@free-electrons.com>
References: <cover.72ded2a212a37139db2a4193482b04a84a545a48.1490282185.git-series.gregory.clement@free-electrons.com>
        <941d03c9a3bdfd5e789aada29b35184ec9fed9fe.1490282185.git-series.gregory.clement@free-electrons.com>
        <20170329211105.ype3os6jldsjyrqa@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170329211105.ype3os6jldsjyrqa@rob-hp-laptop> (Rob Herring's
        message of "Wed, 29 Mar 2017 16:11:05 -0500")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Wilson Ding <dingwei-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hua Jing <jinghua-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,
 
 On mer., mars 29 2017, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

>> +GPIO subnode:
>> +
>> +Please refer to gpio.txt in this directory for details of gpio-ranges property
>> +and the common GPIO bindings used by client devices.
>> +
>> +Required properties for gpio driver under the gpio subnode:
>
> Why does this need to be a sub node? You should probably have a 
> compatible if it is.

It is needed to be able to have a phandle associated to the gpio. Then
the other node can refer to it.

But if we can do without it I would happy to do it.


>
>> +- interrupts: List of interrupt specifier for the controllers interrupt.
>> +- gpio-controller: Marks the device node as a gpio controller.
>> +- #gpio-cells: Should be 2. The first cell is the GPIO number and the
>> +   second cell specifies GPIO flags, as defined in
>> +   <dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH and
>> +   GPIO_ACTIVE_LOW flags are supported.
>> +- gpio-ranges: Range of pins managed by the GPIO controller.
>> +
>> +Xtal Clock bindings for Marvell Armada 37xx SoCs
>> +------------------------------------------------
>> +
>> +see Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
>> +
>> +
>> +Example:
>> +pinctrl_sb: pinctrl-sb@18800 {
>
> pinctrl@

OK

>
>> +	compatible = "marvell,armada3710-sb-pinctrl", "syscon", "simple-mfd";
>> +	reg = <0x18800 0x100>, <0x18C00 0x20>;
>> +	gpiosb: gpiosb {
>
> gpio@

There is no reg property so we don't use the @

Thanks,

Gregory

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
