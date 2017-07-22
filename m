From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2] watchdog: meson-wdt: add support for the watchdog on
 Meson8 and Meson8m2
Date: Sat, 22 Jul 2017 20:42:42 +0200
Message-ID: <CAFBinCB_q-qNs_RwyEVf7Tyz3X+omUmhe19-1Tg5C_czip0HdA@mail.gmail.com>
References: <20170711221438.8958-1-martin.blumenstingl@googlemail.com> <20170717165152.xv2kq2lqgi3jtobm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717165152.xv2kq2lqgi3jtobm@rob-hp-laptop>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 17, 2017 at 6:51 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jul 12, 2017 at 12:14:38AM +0200, Martin Blumenstingl wrote:
>> The watchdog IP block on Meson8 and Meson8m2 is already supported by the
>> existing meson-wdt driver. Meson8 uses the same register bits as Meson6,
>> while the newer Meson8m2 SoC uses the same register bits as Meson8b.
>>
>> Currently watchdog support on Meson8 SoC already works because
>> meson8.dtsi simply uses the "amlogic,meson6-wdt" compatible. Adding a
>> separate compatible for Meson8 makes this more explicit though.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>> ---
>> Changes since v1 at [0]:
>> - updated the documentation to indicate that Meson8 should also specify
>>   the Meson6 compatible and that Meson8m2 should also specify the
>>   Meson8b compatible
>>
>> [0] https://patchwork.kernel.org/patch/9780093/
>>
>>
>>  Documentation/devicetree/bindings/watchdog/meson-wdt.txt | 6 +++++-
>>  drivers/watchdog/meson_wdt.c                             | 2 ++
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Thank you Rob and Guenter
in the meantime this was added to Guenter's watchdog-next tree: [1]


Regards,
Martin


[1] https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=6fb84b4c68fbfe1df61fb59fb2f46a8ec044e337
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
