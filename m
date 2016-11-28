From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] Add support for the Nexbox A1 board based on the Amlogic S912 SoC.
Date: Mon, 28 Nov 2016 12:16:37 -0800
Message-ID: <m24m2rtl5m.fsf@baylibre.com>
References: <20161121162905.14285-1-narmstrong@baylibre.com>
        <20161121162905.14285-3-narmstrong@baylibre.com>
        <20161123225205.re77xff5vcccaltl@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123225205.re77xff5vcccaltl@rob-hp-laptop> (Rob Herring's
        message of "Wed, 23 Nov 2016 16:52:05 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Mon, Nov 21, 2016 at 05:29:05PM +0100, Neil Armstrong wrote:
>> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/amlogic.txt  |   1 +
>>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>>  .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 169 +++++++++++++++++++++
>>  3 files changed, 171 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
>
> A few nits below, otherwise:
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>

Fixed up the changes locally, and applied for v4.10.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
