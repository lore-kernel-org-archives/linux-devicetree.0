From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: meson-gxbb: add the USB reset also to the
 second USB PHY
Date: Tue, 22 Nov 2016 23:05:17 +0100
Message-ID: <CAFBinCCU-4vpttr14aHYjnO+yeQ=CM4dSe98ZSn_OCdatPagyg@mail.gmail.com>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-4-martin.blumenstingl@googlemail.com>
 <m2twb7w1j6.fsf@baylibre.com> <CAFBinCBVaQ7SLwQ0M2eJj0iyQuErF1Ev5dtGzKr7itiesy11MQ@mail.gmail.com>
 <m2eg2437za.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m2eg2437za.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 21, 2016 at 9:15 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> Hi Kevin,
>>
>> On Wed, Nov 16, 2016 at 10:35 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>>> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>>
>>>> When the USB PHY driver was introduced the reset framework did not
>>>> have support for triggering a reset pulse for shared resets. On GXBB
>>>> however there is only one reset line for both PHYs (meaning we have a
>>>> shared reset line). With the latest changes to the reset framework and
>>>> the corresponding updates to the phy-meson8b-usb2 driver we can now pass
>>>> the reset to the second PHY as well.
>>>>
>>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>>
>>> Applied.
>> Unfortunately I think I put crucial information only in the
>> cover-letter's description:
>> "the dts patch has a runtime-dependency on patch 1 and 2"
>
> I saw that, but also see that both of those have been queued, so should
> land in v4.10 also.
>
>> So please feel free to keep or drop the patch as it is. In case you
>> decide drop it I will re-send it for 4.11 (after all the 4.10 stuff is
>> done).
>
> IMO, it's fine to keep it.  That means there may be some versions of
> linux-next that have the problem where the reset will get asserted
> twice, but since that is affecting very few people (probably only you),
> I think it's OK, since it will be fine once v4.10-rc1 is released.
fine with me, just wanted to let you know (so you're aware of it in
case someone runs into an issue with this)

> If you don't want that, let me know and I'll drop it for now.
let's keep it - this will mean that more users will test it :)


Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
