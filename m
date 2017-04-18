From: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: Add support for phyCORE-RK3288
 SoM
Date: Tue, 18 Apr 2017 17:01:41 +0200
Message-ID: <381e11bc-649d-ddf2-4a28-f72a264204c3@phytec.de>
References: <1491483866-18368-1-git-send-email-w.egorov@phytec.de>
 <CAFLEztSQ1-WU7KAXzuB66htXiaQN4wd=XmM5XtjZcoONt77XmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFLEztSQ1-WU7KAXzuB66htXiaQN4wd=XmM5XtjZcoONt77XmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


>> +&i2c0 {
>> +       status = "okay";
>> +       clock-frequency = <400000>;
>> +
>> +       rk818: pmic@1c {
>> +               compatible = "rockchip,rk818";
>> +               reg = <0x1c>;
>> +               interrupt-parent = <&gpio0>;
>> +               interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pmic_int>;
>> +               rockchip,system-power-controller;
>> +               wakeup-source;
>> +               #clock-cells = <1>;
>> +
> I think you miss  "clock-output-names = "xin32k" here.
Yes, thanks for catching that. I will fix this later.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
