From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/2] cfg80211: support ieee80211-freq-limit DT property
Date: Mon, 2 Jan 2017 23:16:12 +0100
Message-ID: <CACna6rx5fMFVyjB=4=ZeXhfXWGPQmKiEQuJRY+mz2OFMLYx_HA@mail.gmail.com>
References: <20170102163209.2445-1-zajec5@gmail.com> <20170102163209.2445-2-zajec5@gmail.com>
 <1483379548.15591.1.camel@sipsolutions.net> <e194b980-1048-8da6-624b-26f824ff655d@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e194b980-1048-8da6-624b-26f824ff655d-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2 January 2017 at 21:12, Arend van Spriel
<arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 02-01-17 18:52, Johannes Berg wrote:
>>> +static void wiphy_freq_limits_apply(struct wiphy *wiphy)
>> [...]
>>> +                    if (!wiphy_freq_limits_valid_chan(wiphy,
>>> chan)) {
>>> +                            pr_debug("Disabling freq %d MHz as
>>> it's out of OF limits\n",
>>> +                                     chan->center_freq);
>>> +                            chan->flags |=3D
>>> IEEE80211_CHAN_DISABLED;
>>
>> I think you didn't address the problem in the best way now.
>>
>> The problem with the channel sharing was the way you're applying the
>> limits - at runtime. This is now OK since the new function shouldn't be
>> called when the channel structs are shared, but hooking it all into thes
>> regulatory code is now no longer needed.
>>
>> What you can do now, when reading the OF data, is actually apply it to
>> the channel flags immediately. If done *before* wiphy_register(), these
>> flags will be preserved forever, so you no longer need any hooks in
>> regulatory code at all - you can just set the original channel flags
>> according to the OF data.
>
> I suppose this then can also be done early in the wiphy_register()
> function itself, right?

When driver calls wiphy_apply_custom_regulatory I need to already have
limits read from the DT (at least in my current implementation, it may
change, but I need help understanding flow first). As
wiphy_apply_custom_regulatory has to be called before wiphy_register,
I can't read DT so late (in wiphy_register).

--=20
Rafa=C5=82
