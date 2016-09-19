From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Mon, 19 Sep 2016 09:42:22 -0700
Message-ID: <m2wpi7hmdt.fsf@baylibre.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
        <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
        <20160911134111.31141-4-martin.blumenstingl@googlemail.com>
        <m2a8faxy72.fsf@baylibre.com> <57DCC3CF.9090409@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57DCC3CF.9090409-l0cyMroinI0@public.gmane.org> (Kishon Vijay Abraham, I's message of
        "Sat, 17 Sep 2016 09:47:19 +0530")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> writes:

> Hi Kevin,
>
> On Wednesday 14 September 2016 09:36 PM, Kevin Hilman wrote:
>> Kishon,
>> 
>> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>> 
>>> This is a new driver for the USB PHY found in Meson8b and GXBB SoCs.
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>> Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> 
>> Will you be picking this up for v4.9?
>
> It's already late for 4.9. Generally send pull request to Greg around -rc6.
> This can go only in 4.10.

That's fine.

Does that mean you have it queued someplace?  I don't see it in any of
your branches.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
