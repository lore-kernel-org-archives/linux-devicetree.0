From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2 00/10] add support for more devices on Meson8 and Meson8b
Date: Sat, 17 Jun 2017 01:00:30 +0200
Message-ID: <CAFBinCAseB_pveYPjZdF_mTxnqEHvqRQj=paAWJHL-4rXFodtA@mail.gmail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com> <m260fvg31w.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m260fvg31w.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Fri, Jun 16, 2017 at 9:12 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> This series adds:
>> - USB support on Meson8 and Meson8b (it seems that some boards show an
>>   error when trying to initialize one of the USB2 PHYs, but we have the
>>   same problem on some GXBB boards. it is working fine for me - on a board
>>   which is not supported upstream yet)
>> - hardware random number generator support (Meson8 and Meson8b seem to
>>   have two 32-bit hardware random number generator registers, while the
>>   GX SoCs only have one. This is not handled by the meson-rng driver yet,
>>   but that can still be improved later on)
>> - SAR ADC support
>> - add reserved memory zones to fix random hangs when filling the memory
>>   (currently only on Meson8 until I have a Meson8b device to test if the
>>   same problem appears there as well)
>> - use the real ethernet clock on Meson8 and Meson8b to fix ethernet when
>>   the bootloader does not enable the gate clock
>> - add the SCU (Snoop Control Unit) which is needed for SMP support
>> - minor preparations for further .dts updates as this already exports the
>>   SDIO clocks (a driver for this MMC controller is work-in-progress) as
>>   well as the corresponding pin definitions in meson8.dtsi
>> - this adds the pwm_e (typically used for the 32.768 kHz LPO clock for the
>>   SDIO wifi chip) and pwm_f (used on some boards for the dimmable power
>>   LED) pins to meson8.dtsi
>
> Oh, one minor nit... When you send a v2 of a series, please start a new
> thread.  You sent this one in-reply-to the original series.  When you do
> that, it risks getting missed when I mark the previous series as read.
oh, thanks for letting me know - I though that sending the update as
reply was "good practice"! noted for the next batch of changes :)

> Thanks,
you're welcome - it's nice to put all these puzzle pieces together to
get a specific SoC from "there's output on the serial console and
Linux boots" to "now you can use USB, the SD card slot, ADC, ..."

Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
