From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Thu, 8 Sep 2016 21:20:12 +0100
Message-ID: <e3b1f611-d6f6-c98b-a53b-98e94ef5bd96@codethink.co.uk>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
 <m260q6jibf.fsf@baylibre.com>
 <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/09/16 20:52, Martin Blumenstingl wrote:
> On Thu, Sep 8, 2016 at 9:35 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>>> +     phy = devm_phy_create(&pdev->dev, NULL, &phy_meson_usb2_ops);
>>> +     if (IS_ERR(phy)) {
>>> +             dev_err(&pdev->dev, "failed to create PHY\n");
>>> +             return PTR_ERR(phy);
>>> +     }
>>> +
>>> +     if (usb_reset_refcnt++ == 0) {
>>> +             ret = device_reset(&pdev->dev);
>>> +             if (ret) {
>>> +                     dev_err(&phy->dev, "Failed to reset USB PHY\n");
>>> +                     return ret;
>>> +             }
>>> +     }
>>
>> The ref count + reset here looks like something that could/should be
>> handled in a runtime PM callback.
> Unfortunately that doesn't work (as Jerome found out) because both
> PHYs are sharing the same reset line.
> So if the second PHY would call device_reset then it would also reset
> the first PHY!
>
> There's a comment above the declaration of usb_reset_refcnt which
> tries to explain this:
> "The PHYs are sharing a common reset line -> we are only allowed to
> reset once for all PHYs."
> Maybe I should move this comment to the "if (usb_reset_refcnt++ == 0)
> {" line to make it easier to see?
>

pm-runtime has refcounting in it. When one of the nodes turns on,
the pm-runtime will call your driver to say there is a user when
this first use turns up.

If all the sub-phys turn off and drop their refcount then the driver
is called to say there are no more users and you can go to sleep.

So, in phy_meson_usb2_power_on() you could do:

pm_runtime_get_sync(pdev);

and in phy_meson_usb2_power_off

pm_runtime_put(pdev);

https://www.kernel.org/doc/Documentation/power/runtime_pm.txt

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
