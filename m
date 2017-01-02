From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 3/3] cfg80211: support ieee80211-freq-limit DT property
Date: Mon, 2 Jan 2017 15:09:27 +0100
Message-ID: <CACna6ry6dQ=3WZTzbOspZRPMY1sF7Xu9JY7kbi2ea6ddgqDMLw@mail.gmail.com>
References: <20170102132747.3491-1-zajec5@gmail.com> <20170102132747.3491-3-zajec5@gmail.com>
 <1483365844.21014.6.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483365844.21014.6.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2 January 2017 at 15:04, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org> wrote=
:
>> +     prop =3D of_find_property(np, "ieee80211-freq-limit", &i);
>> +     if (!prop)
>> +             return 0;
>> +
>> +     i =3D i / sizeof(u32);
>
> What if it's not even a multiple of sizeof(u32)? Shouldn't you check
> that, in case it's completely bogus?
>
>> +     if (i % 2) {
>> +             dev_err(dev, "ieee80211-freq-limit wrong value");
>
> say "wrong format" perhaps? we don't care (much) above the values.
>
>> +             return -EPROTO;
>> +     }
>> +     wiphy->n_freq_limits =3D i / 2;
>
> I don't like this use of the 'i' variable - use something like
> 'len[gth]' instead?
>
>> +     wiphy->freq_limits =3D kzalloc(wiphy->n_freq_limits *
>> sizeof(*wiphy->freq_limits),
>> +                                  GFP_KERNEL);
>> +     if (!wiphy->freq_limits) {
>> +             err =3D -ENOMEM;
>> +             goto out;
>> +     }
>> +
>> +     p =3D NULL;
>> +     for (i =3D 0; i < wiphy->n_freq_limits; i++) {
>> +             struct ieee80211_freq_range *limit =3D &wiphy-
>> >freq_limits[i];
>> +
>> +             p =3D of_prop_next_u32(prop, p, &limit-
>> >start_freq_khz);
>> +             if (!p) {
>> +                     err =3D -EINVAL;
>> +                     goto out;
>> +             }
>> +
>> +             p =3D of_prop_next_u32(prop, p, &limit->end_freq_khz);
>> +             if (!p) {
>> +                     err =3D -EINVAL;
>> +                     goto out;
>> +             }
>> +     }
>
> You should also reject nonsense like empty ranges, or ranges with a
> higher beginning than end, etc. I think
>
>
> put
>
>         return 0;
>
> here.
>
>> +out:
>> +     if (err) {
>
> then you can make that a pure "error" label and remove the "if (err)"
> check.
>
>> +void wiphy_freq_limits_apply(struct wiphy *wiphy)
>
> I don't see any point in having this here rather than in reg.c, which
> is the only user.
>
>> +                     if (!wiphy_freq_limits_valid_chan(wiphy,
>> chan)) {
>> +                             pr_debug("Disabling freq %d MHz as
>> it's out of OF limits\n",
>> +                                      chan->center_freq);
>> +                             chan->flags |=3D IEEE80211_CHAN_DISABLED;
>
> This seems wrong.
>
> The sband and channels can be static data and be shared across
> different wiphys for the same driver. If the driver has custom
> regulatory etc. then this can't work, but that's up to the driver. OF
> data is handled here though, so if OF data for one device disables a
> channel, this would also cause the channel to be disabled for another
> device, if the data is shared.
>
> To avoid this, you'd have to have drivers that never share it - but you
> can't really guarantee that at this level.
>
> In order to fix that, you probably need to memdup the sband/channel
> structs during wiphy registration. Then, if you set it up the right
> way, you can actually simply edit them according to the OF data
> directly there, so that *orig_flags* (rather than just flags) already
> gets the DISABLED bit - and that allows you to get rid of the reg.c
> hooks entirely since it'll look the same to reg.c independent of the
> driver or the OF stuff doing this.
>
>
> That can actually be inefficient though, since drivers may already have
> copied the channel data somewhere and then you copy it again since you
> can't know.
>
> Perhaps a better approach would be to not combine this with wiphy
> registration, but require drivers that may use this to call a new
> helper function *before* wiphy registration (and *after* calling
> set_wiphy_dev()), like e.g.
>
>    ieee80211_read_of_data(wiphy);
>
> You can then also make this an inline when OF is not configured in
> (something which you haven't really taken into account now, you should
> have used dev_of_node() too instead of dev->of_node)
>
> Yes, this would mean that it doesn't automatically get applied to
> arbitrary drivers, but it seems unlikely that arbitrary drivers like
> realtek USB would suddenly get OF node entries ... so that's not
> necessarily a bad thing.
>
> In the documentation for this function you could then document that it
> will modify flags, and as such must not be called when the sband and
> channel data is shared, getting rid of the waste/complexity of the copy
> you otherwise have to make in cfg80211.

Thank you, I appreciate your review a lot, I'll work on this according
to your comments!

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
