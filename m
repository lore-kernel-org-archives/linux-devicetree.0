From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Fri, 9 Sep 2016 22:37:25 +0200
Message-ID: <CAFBinCCWFcy1h-28=xie-2Op79UTXvawDuem_YYypTCYHCgLKQ@mail.gmail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
 <m260q6jibf.fsf@baylibre.com> <CAFBinCA4Yvw5pbOFmJ8SqyOASADavyEPmHywSdOiUazcqe_Zmg@mail.gmail.com>
 <e3b1f611-d6f6-c98b-a53b-98e94ef5bd96@codethink.co.uk> <m2eg4ui0nl.fsf@baylibre.com>
 <ffdd0188-72bc-4575-f997-e8547f4c31d2@codethink.co.uk> <CAFBinCC4gkMrJtertYevg_hXDLJEZ0PqfKKLL5UKXo8B=SXsPw@mail.gmail.com>
 <m2sht9gkau.fsf@baylibre.com> <CAFBinCCDDwydB+RP0CZKoAW5Suxotn224ZFVWvt2OGW3gNJR1g@mail.gmail.com>
 <b9730890-d98c-2c3a-8af1-96b8c394c30f@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b9730890-d98c-2c3a-8af1-96b8c394c30f-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 7:21 PM, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> wrote:
> On 09/09/16 17:14, Martin Blumenstingl wrote:
>>
>> On Fri, Sep 9, 2016 at 5:33 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>>>
>>> However, the problem with all of the solutions proposed (runtime PM ones
>>> included) is that we're forcing a board-specific design issue (2 devices
>>> sharing a reset line) into a driver that should not have any
>>> board-specific assumptions in it.
>>>
>>> For example, if this driver is used on another platform where different
>>> PHYs have different reset lines, then one of them (the unlucky one who
>>> is not probed first) will never get reset.  So any form of per-device
>>> ref-counting is not a portable solution.
>>
>> maybe we should also consider Ben's solution: he played with the USB
>> PHY on his Meson8b board. His approach was to have only one USB PHY
>> driver instance which exposes two PHYs.
>> The downside of this: the driver would have to know the offset of the
>> PHYs (0x0 for the first PHY, 0x20 for the second), but we could handle
>> the reset using runtime PM without any hacks.
>>
>> I checked the USB PHY reference driver: it seems that there will be a
>> new USB PHY with the GXL/GXM SoCs.
>> So maybe we could live with the assumption that the PHYs are at
>> consecutive addresses.
>>
>>> I'm not sure yet how the reset framework is supposed to handle shared
>>> reset lines, but that needs some investigation.  I quick glance and it
>>> seems that reset controllers can have shared lines, so that should be
>>> investigated.
>>
>> unfortunately shared resets are not allowed to use reset_control_reset,
>> see [0]
>>
>>
>> [0] http://lxr.free-electrons.com/source/drivers/reset/core.c#L102
>
>
> If we didn't have the shared reset, we'd have one of node per phy
> and not have to have two sub-nodes... I don't think any other bits
> of the PHY framework are shared.
okay, sounds reasonable - so we should try to get this scenario
supported through by the reset framework -> see my other mail.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
