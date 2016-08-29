From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] ARm64: amlogic: Introduce common GX family dtsi
Date: Mon, 29 Aug 2016 20:38:31 +0200
Message-ID: <2983d731-82fd-63fc-7541-8c1d6a929416@suse.de>
References: <1472457371-1305-1-git-send-email-narmstrong@baylibre.com>
 <CAOQ7t2YGbASh7v25wgDspKNWgFOcRsikJs_WZptn+LkVXmaHig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOQ7t2YGbASh7v25wgDspKNWgFOcRsikJs_WZptn+LkVXmaHig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amlogic <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 29.08.2016 um 10:01 schrieb Carlo Caione:
> On Mon, Aug 29, 2016 at 9:56 AM, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> The new Amlogic GLX SoCs (S905X and S905D) are part of the Meson GX family so
>> they share some basic characteritics that can be described in a common GX
>> dtsi file used by the Meson GXBB and Meson GXL dtsi.
>>
>> This patchset introduces the common dtsi and switches the GLX and GXBB to use
>> the common dtsi, the GXBB dtsi is reformated to handle this situation.
>>
>> This patchset depends on Carlo Caione "ARM64: dts: amlogic: Add basic support for Amlogic S905X" [1]
>>
>> [1] http://lkml.kernel.org/r/1472382113-10754-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
>>
>> Neil Armstrong (3):
>>   ARM64: dts: amlogic: Add Meson GX Family common dtsi
>>   ARM64: dts: amlogic: Switch Meson GXL dtsi to use common GX dtsi
>>   ARM64: dts: amlogic: Switch Meson GXBB dtsi to use common GX dtsi
> 
> FWIW
> Acked-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Adding an unused .dtsi duplicating GXBB makes me uneasy.

Any chance we can simplify this to at most two steps?
1) Move code from gxbb to gx (1/3 + 3/3)
2) Add gxl using gx ("Add basic support for Amlogic S905X" + 2/3)

Alternatively:
1) "Add basic support for Amlogic S905X"
2) Factor out common bits (1/3 + 2/3 + 3/3)

As for bike-shedding, is there a GX family as well or could we drop
-common? .dtsi is always something common - compare Exynos or i.MX.
Since there are meson8b and meson8 I was anticipating that after gxbb
would come gx, not gxl.

Do you know what the L in GXL is for? Should we consider renaming gxbb
to gxb, and then also insert -s905 as suggested by Kevin, for symmetry?
U-Boot is still in an early stage with $fdtfile issues remaining that I
need to iterate over; DT compatible strings would need to remain though.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
