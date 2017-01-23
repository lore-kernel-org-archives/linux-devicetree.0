From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v4 0/9] meson-gx: reset RGMII PHYs and configure TX delay
Date: Mon, 23 Jan 2017 20:02:46 +0100
Message-ID: <CAFBinCCoQpidWA9yTEBQ1rEomd33Sqouo3h86b2gmWHh5fcRag@mail.gmail.com>
References: <20170120152232.13943-1-martin.blumenstingl@googlemail.com>
 <20170122181028.5014-1-martin.blumenstingl@googlemail.com> <m24m0p38sk.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m24m0p38sk.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 7:55 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> This series adds the reset GPIOs for the (external) ethernet PHYs on all
>> GXBB boards.
>> Additionally it provides a ethernet PHY node which can be used to specify
>> PHY-specific properties (this may be required if more boards require the
>> "eee-broken-1000t" for the RTL8211F ethernet PHY). To make all board .dts
>> consistent I chose to add the PHY node also for boards which don't have a
>> RTL8211F PHY.
>>
>> Patch #7 from this series also removes ethernet support for the P200
>
> I think you mean P201 here, right?
indeed, that's a left-over of my P200 / P201 mixup in v2 - please ignore this :(
I should have dropped that sentence completely since it's a lie in v3
(v3 states in changes since v2: "instead of dropping ethernet support
for P201 we simply re-configure it to RMII mode")
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
