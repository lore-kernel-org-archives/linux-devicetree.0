From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 3/3] cfg80211: support ieee80211-freq-limit DT property
Date: Wed, 4 Jan 2017 17:13:07 +0100
Message-ID: <CACna6ryzk958T0by_4F96hJxUCR5VsKJjrsjByFO96+HcfmXqg@mail.gmail.com>
References: <20170103225715.14072-1-zajec5@gmail.com> <20170103225715.14072-3-zajec5@gmail.com>
 <1483536406.7312.3.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483536406.7312.3.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 January 2017 at 14:26, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote=
:
>
>> V4: Move code to of.c
>>     Use one helper called at init time (no runtime hooks)
>>     Modify orig_flags
>
>
>> +/**
>> + * wiphy_read_of_freq_limits - read frequency limits from device
>> tree
>> + *
>> + * @wiphy: the wireless device to get extra limits for
>> + *
>> + * Some devices may have extra limitations specified in DT. This may
>> be useful
>> + * for chipsets that normally support more bands but are limited due
>> to board
>> + * design (e.g. by antennas or extermal power amplifier).
>> + *
>> + * This function reads info from DT and uses it to *modify* channels
>> (disable
>> + * unavailable ones). It's usually a *bad* idea to use it in drivers
>> with
>> + * shared channel data as DT limitations are device specific.
>> + *
>> + * As this function access device node it has to be called after
>> set_wiphy_dev.
>> + * It also modifies channels so they have to be set first.
>> + */
>
> It should also be called before wiphy_register(), I think? And I
> suppose you should add a comment about not being able to use shared
> channels.
>
>> +                             pr_debug("Disabling freq %d MHz as
>> it's out of OF limits\n",
>> +                                      chan->center_freq);
>> +                             chan->orig_flags |=3D
>> IEEE80211_CHAN_DISABLED;
>>
> But just setting orig_flags also won't work, since it'd be overwritten
> again by wiphy_register(), no?

I told you I successfully tested it, didn't I? Well, I quickly checked
wiphy_register and couldn't understand how it was possible it worked
for me...

OK, so after some debugging I understood why I got this working. It's
the way brcmfmac handles channels.

At the beginning all channels are disabled: see __wl_2ghz_channels &
__wl_5ghz_channels. They have IEEE80211_CHAN_DISABLED set in "flags"
for every channel.

In early phase brcmfmac calls wiphy_read_of_freq_limits which sets
IEEE80211_CHAN_DISABLED in "orig_flags" for unavailable channels.

Then brcmf_construct_chaninfo kicks in. Normally it removes
IEEE80211_CHAN_DISABLED from "flags" for most of channels, but it
doesn't happen anymore due to my change:
if (channel->orig_flags & IEEE80211_CHAN_DISABLED)
        continue;

Then brcmfmac calls wiphy_apply_custom_regulatory which sets some bits
like IEEE80211_CHAN_NO_80MHZ and IEEE80211_CHAN_NO_160MHZ in "flags".

Finally wiphy_register is called which copies "flags" to
"original_flags". As brcmfmac /respected/ IEEE80211_CHAN_DISABLED set
in orig_flags, it also left IEEE80211_CHAN_DISABLED in flags. This way
I got IEEE80211_CHAN_DISABLED in orig_flags after overwriting that
field inside wiphy_register.

That's quite crazy, right?

I guess you're right after all, I should set IEEE80211_CHAN_DISABLED
in "flags" field, let wiphy_register copy that to "orig_flags" and
sanitize brcmfmac.

--=20
Rafa=C5=82
