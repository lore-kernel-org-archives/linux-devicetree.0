From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] watchdog: meson-wdt: add support for the watchdog on
 Meson8 and Meson8m2
Date: Mon, 19 Jun 2017 20:50:40 +0200
Message-ID: <CAFBinCAZZMT-YDHg4SYF3da+00KLYE-dZaEDPaEMRz_2paXNQw@mail.gmail.com>
References: <20170611095219.22095-1-martin.blumenstingl@googlemail.com>
 <20170615172510.GA7549@roeck-us.net> <CAFBinCCyqX=TGwTyhxXZPP2noUvJ1v=xNs+Vs17Gg4z2uDgjEA@mail.gmail.com>
 <20170616180009.h66dwnnhfwrjpui6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170616180009.h66dwnnhfwrjpui6@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Sun, Jun 18, 2017 at 4:04 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jun 15, 2017 at 11:13:07PM +0200, Martin Blumenstingl wrote:
>> On Thu, Jun 15, 2017 at 7:25 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> > On Sun, Jun 11, 2017 at 11:52:19AM +0200, Martin Blumenstingl wrote:
>> >> The watchdog IP block on Meson8 and Meson8m2 is already supported by the
>> >> existing meson-wdt driver. Meson8 uses the same register bits as Meson6,
>> >> while the newer Meson8m2 SoC uses the same register bits as Meson8b.
>> >>
>> >> Currently watchdog support on Meson8 SoC already works because
>> >> meson8.dtsi simply uses the "amlogic,meson6-wdt" compatible. Adding a
>> >> separate compatible for Meson8 makes this more explicit though.
>> >>
>> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> >
>> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>> thank you!
>> is there anything holding you up from taking this patch (for example:
>> are you still missing any specific Signed-off-by / Acked-by)?
>>
>> > In general, changes like this are not necessary, though. The dts file
>> > is supposed to reference both generic and specific compatible strings.
>> I thought about skipping this patch, but I find that it looks strange without.
>>
>> the hierarchy and the corresponding compatible strings would be:
>> meson.dtsi / compatible = "amlogic,meson6-wdt";
>> |- meson8.dtsi / compatible = "amlogic,meson8-wdt", "amlogic,meson6-wdt";
>>    |- meson8m2.dtsi (upcoming) / compatible = "amlogic,meson8m2-wdt",
>> "amlogic,meson8b-wdt";
>> |- meson8b.dtsi / compatible = "amlogic,meson8b-wdt";
>>
>> instead of this seemingly random mixup of compatible strings I decided
>> to introduce separate ones for each SoC.
>
> But if the block is backwards compatible, you should also provide a
> fallback compatible string.
OK, fine with me - do you want me to update the documentation to
reflect this (or is it enough if I take care of it in the .dts files)?
the resulting documentation could look like this:
       "amlogic,meson6-wdt" on Meson6 SoCs
       "amlogic,meson8-wdt" along with "amlogic,meson6-wdt" on Meson8 SoCs
       "amlogic,meson8b-wdt" on Meson8b SoCs
       "amlogic,meson8m2-wdt" along with "amlogic,meson8b-wdt" on Meson8m2 SoCs

Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
