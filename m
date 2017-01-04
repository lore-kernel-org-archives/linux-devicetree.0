From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V5 3/3] cfg80211: support ieee80211-freq-limit DT
 property
Date: Wed, 04 Jan 2017 14:26:46 +0100
Message-ID: <1483536406.7312.3.camel@sipsolutions.net>
References: <20170103225715.14072-1-zajec5@gmail.com>
         <20170103225715.14072-3-zajec5@gmail.com>
         (sfid-20170103_235738_606634_945A6D98)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103225715.14072-3-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (sfid-20170103_235738_606634_945A6D98)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> V4: Move code to of.c
>     Use one helper called at init time (no runtime hooks)
>     Modify orig_flags


> +/**
> + * wiphy_read_of_freq_limits - read frequency limits from device
> tree
> + *
> + * @wiphy: the wireless device to get extra limits for
> + *
> + * Some devices may have extra limitations specified in DT. This may
> be useful
> + * for chipsets that normally support more bands but are limited due
> to board
> + * design (e.g. by antennas or extermal power amplifier).
> + *
> + * This function reads info from DT and uses it to *modify* channels
> (disable
> + * unavailable ones). It's usually a *bad* idea to use it in drivers
> with
> + * shared channel data as DT limitations are device specific.
> + *
> + * As this function access device node it has to be called after
> set_wiphy_dev.
> + * It also modifies channels so they have to be set first.
> + */

It should also be called before wiphy_register(), I think? And I
suppose you should add a comment about not being able to use shared
channels.

> +				pr_debug("Disabling freq %d MHz as
> it's out of OF limits\n",
> +					 chan->center_freq);
> +				chan->orig_flags |=
> IEEE80211_CHAN_DISABLED;
> 
But just setting orig_flags also won't work, since it'd be overwritten
again by wiphy_register(), no?

johannes
