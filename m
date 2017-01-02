From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/2] cfg80211: support ieee80211-freq-limit DT property
Date: Mon, 2 Jan 2017 23:12:53 +0100
Message-ID: <CACna6ryrYY5G=Fvmsrq_sD3iX5dWreyz7R8mGEd6ogUck=twnQ@mail.gmail.com>
References: <20170102163209.2445-1-zajec5@gmail.com> <20170102163209.2445-2-zajec5@gmail.com>
 <1483379548.15591.1.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483379548.15591.1.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2 January 2017 at 18:52, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote=
:
>> +static void wiphy_freq_limits_apply(struct wiphy *wiphy)
> [...]
>> +                     if (!wiphy_freq_limits_valid_chan(wiphy,
>> chan)) {
>> +                             pr_debug("Disabling freq %d MHz as
>> it's out of OF limits\n",
>> +                                      chan->center_freq);
>> +                             chan->flags |=3D
>> IEEE80211_CHAN_DISABLED;
>
> I think you didn't address the problem in the best way now.
>
> The problem with the channel sharing was the way you're applying the
> limits - at runtime. This is now OK since the new function shouldn't be
> called when the channel structs are shared, but hooking it all into the
> regulatory code is now no longer needed.
>
> What you can do now, when reading the OF data, is actually apply it to
> the channel flags immediately. If done *before* wiphy_register(), these
> flags will be preserved forever, so you no longer need any hooks in
> regulatory code at all - you can just set the original channel flags
> according to the OF data.
>
> I think this greatly simplifies the flow, since you can also remove
> wiphy->freq_limits (and n_freq_limits) completely, since now the only
> effect of the function would be to modify the channel list, and later
> regulatory updates would always preserve the flags.

I need some extra help understanding this :(

When driver uses custom regulatory it registers initial channels at
init but it can also react to regdom changes using reg_notifier. Is
that correct?

So I'm looking at brcmf_cfg80211_reg_notifier which calls
brcmf_setup_wiphybands which calls brcmf_construct_chaninfo.
That last one reworks all channels on every call. It first marks all
existing channels as DISABLED then queries firmware for the list of
supported channels and updates wiphy channels one by one.
So if I understand this correctly, every regdom change can result in
rebuilding channels pretty much from the scratch. That's why I
believed I need to call wiphy_freq_limits_apply on runtime, not just
during the init.

Is there some flow in my understanding?

--=20
Rafa=C5=82
