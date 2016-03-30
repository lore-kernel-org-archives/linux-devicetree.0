From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/12] ARM: dts: dragonboard-600c: Add on board leds support
Date: Wed, 30 Mar 2016 07:54:04 -0500
Message-ID: <CAL_JsqLahLTk9cjKhVct7OF7VNw7yyO-uTv6Hw-tqUSELaPm4A@mail.gmail.com>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762484-9768-1-git-send-email-srinivas.kandagatla@linaro.org> <20160327055012.GD8929@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160327055012.GD8929@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 27, 2016 at 12:50 AM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed 23 Mar 12:48 PDT 2016, Srinivas Kandagatla wrote:
>
>> This patch adds support to 4 user leds, wlan and bt led on board.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> I'm not fond of the overly complicated names; and I think it should at
> least be shortened to "db600c:...".

These names are exposed to userspace. They should be the same across
all 96boards. Same goes for UART numbering and I2C bus labels on the
connector.

> Tested this on my DB600c, seems to work, except the WiFi/BT triggers,
> see comments below.
>
>> +             leds {
>> +                     pinctrl-names = "default";
>> +                     pinctrl-0 = <&user_leds>, <&mpp_leds>;
>> +
>> +                     compatible = "gpio-leds";
>> +
>> +                     led@1 {

unit-address w/o reg property will warn on new dtc. I'd suggest
something like "userX-led".


>> +                             label = "dragonboard-600c:green:user1";
>> +                             gpios = <&tlmm_pinmux 3 GPIO_ACTIVE_HIGH>;
>> +                             linux,default-trigger = "heartbeat";
>> +                             default-state = "off";
>> +                     };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
