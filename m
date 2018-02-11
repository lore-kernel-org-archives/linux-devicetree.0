From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 0/5] improvements and fixes for the phy-meson-gxl-usb2 driver
Date: Sun, 11 Feb 2018 22:18:09 +0100
Message-ID: <CAFBinCCZ+eYp0Y7qdvxiHtCxF+AAdxubpUATbzMptFsvRiRvmA@mail.gmail.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com> <9b5295ea-74a2-7bb1-744e-6e8eb76f2673@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b5295ea-74a2-7bb1-744e-6e8eb76f2673-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Yixun,

On Fri, Feb 9, 2018 at 9:27 AM, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> wrote:
>
>
> On 01/29/18 04:22, Martin Blumenstingl wrote:
>> This contains two fixes and two (minor) fixes for the phy-meson-gxl-usb2
>> driver:
>> - a clock and reset line is used for the PHYs. this was not clear from
>>   the Amlogic GPL kernel sources since the clock is enabled very early
>>   in the boot process (either because the hardware defaults to "on",
>>   the bootrom enables it or a bootloader before BL3-3/u-boot enables it)
>> - we don't read the controller's dr_mode anymore because the USB2 PHY
>>   can only be switched into host mode if the USB3 PHY knows about it.
>>   Thus auto-detecting the mode doesn't work for this PHY so it's removed
>>   in patch #3
>> - do not log an error message when the phy-supply is not ready yet and
>>   we have to return -EPROBE_DEFER
>> - improve the naming of some U2P_R2 test mode registers
>>
>>
>> Martin Blumenstingl (5):
>>   dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and clock
>>   phy: amlogic: phy-meson-gxl-usb2: support the clock and reset line
>>   phy: amlogic: phy-meson-gxl-usb2: default to host mode
>>   phy: amlogic: phy-meson-gxl-usb2: don't log an error on -EPROBE_DEFER
>>   phy: amlogic: phy-meson-gxl-usb2: rename some of the U2P_R2 registers
>>
>>  .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt |  4 ++
>>  drivers/phy/amlogic/Kconfig                        |  1 -
>>  drivers/phy/amlogic/phy-meson-gxl-usb2.c           | 78 ++++++++++++++++------
>>  3 files changed, 61 insertions(+), 22 deletions(-)
>>
>
> Hi Martin
>
>   thanks for your great work for pushing the USB driver upstream.
you're welcome - I hope that most problems are sorted out in the latest version

>   I've test your whole series[1] on AXG S400 board and it works fine here.
many thanks!
I just re-sent v9 of "initialize (multiple) PHYs for a HCD" and v2
"DWC3 support for Amlogic Meson AXG and GXL SoCs" which both include
fixes based on the feedback I got. I added your "Tested-by" to all
applicable patches, which I hope is fine for you!

I will re-send the USB2 and USB3 PHY patches once -rc1 is out if
Kishon wants me to re-send those with all Reviewed-by/Tested-by's
collected.

> Yixun
>
>
> [1] the whole patch series include
>
> [RFC usb-next v8 0/3] initialize (multiple) PHYs for a HCD
> https://lkml.kernel.org/r/20180125000053.9387-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
>
> [PATCH 0/3] DWC3 support for Amlogic Meson AXG and GXL SoCs
> https://lkml.kernel.org/r/20180128200333.20093-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
>
> [PATCH v2 0/2] Meson GXL USB3 PHY driver
> https://lkml.kernel.org/r/20180128201554.23889-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
>
> [PATCH 1/5] dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and
> clock
> https://lkml.kernel.org/r/20180128202245.25021-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org


Regards
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
