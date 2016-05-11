From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: meson8b: Add MMC nodes
Date: Wed, 11 May 2016 20:05:02 +0200
Message-ID: <CAOQ7t2ZjezqApQMSmbGQuoo8Lw8Fvrj8E1pfR+Dew=mVqr=eCw@mail.gmail.com>
References: <1456596108-1406-1-git-send-email-carlo@caione.org>
	<1456596108-1406-4-git-send-email-carlo@caione.org>
	<m24ma47a0n.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m24ma47a0n.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2016 at 7:57 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Hi Carlo,
>
> Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> writes:
>
>> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>
>> Enable the MMC for the Meson8b platforms.
>>
>> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> [...]
>
>> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
>> index 8bad557..25d795c 100644
>> --- a/arch/arm/boot/dts/meson8b.dtsi
>> +++ b/arch/arm/boot/dts/meson8b.dtsi
>> @@ -187,6 +187,22 @@
>>                                       function = "uart_ao";
>>                               };
>>                       };
>> +
>> +                     mmc0_sd_b_pins: mmc0_sd_b {
>> +                             mux {
>> +                                     groups = "sd_d1_b", "sd_d0_b", "sd_clk_b", "sd_cmd_b",
>> +                                              "sd_d3_b", "sd_d2_b";
>> +                                     function = "sd_b";
>> +                             };
>> +                     };
>
> These pins are added under pinctrl_aobus, but in the pinctrl driver,
> they're under cbus.  If I move this into the pinctrl_cbus node, I get it
> to work on my odroid-c1, and am able to mount/use an MMC rootfs.

Ouch, thank you for pointing this out, I'll fix it in v6.

thanks,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
