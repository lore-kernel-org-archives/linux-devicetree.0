From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Thu, 8 Sep 2016 21:52:45 +0200
Message-ID: <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg@mail.gmail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com> <m260q6jibf.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m260q6jibf.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 8, 2016 at 9:35 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> +     phy = devm_phy_create(&pdev->dev, NULL, &phy_meson_usb2_ops);
>> +     if (IS_ERR(phy)) {
>> +             dev_err(&pdev->dev, "failed to create PHY\n");
>> +             return PTR_ERR(phy);
>> +     }
>> +
>> +     if (usb_reset_refcnt++ == 0) {
>> +             ret = device_reset(&pdev->dev);
>> +             if (ret) {
>> +                     dev_err(&phy->dev, "Failed to reset USB PHY\n");
>> +                     return ret;
>> +             }
>> +     }
>
> The ref count + reset here looks like something that could/should be
> handled in a runtime PM callback.
Unfortunately that doesn't work (as Jerome found out) because both
PHYs are sharing the same reset line.
So if the second PHY would call device_reset then it would also reset
the first PHY!

There's a comment above the declaration of usb_reset_refcnt which
tries to explain this:
"The PHYs are sharing a common reset line -> we are only allowed to
reset once for all PHYs."
Maybe I should move this comment to the "if (usb_reset_refcnt++ == 0)
{" line to make it easier to see?


Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
