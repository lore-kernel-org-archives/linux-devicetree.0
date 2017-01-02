From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V3 2/2] cfg80211: support ieee80211-freq-limit DT
 property
Date: Mon, 02 Jan 2017 18:52:28 +0100
Message-ID: <1483379548.15591.1.camel@sipsolutions.net>
References: <20170102163209.2445-1-zajec5@gmail.com>
         <20170102163209.2445-2-zajec5@gmail.com>
         (sfid-20170102_173227_440720_CC4EC280)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170102163209.2445-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (sfid-20170102_173227_440720_CC4EC280)
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +static void wiphy_freq_limits_apply(struct wiphy *wiphy)
[...]
> +			if (!wiphy_freq_limits_valid_chan(wiphy,
> chan)) {
> +				pr_debug("Disabling freq %d MHz as
> it's out of OF limits\n",
> +					 chan->center_freq);
> +				chan->flags |=
> IEEE80211_CHAN_DISABLED;

I think you didn't address the problem in the best way now.

The problem with the channel sharing was the way you're applying the
limits - at runtime. This is now OK since the new function shouldn't be
called when the channel structs are shared, but hooking it all into the
regulatory code is now no longer needed.

What you can do now, when reading the OF data, is actually apply it to
the channel flags immediately. If done *before* wiphy_register(), these
flags will be preserved forever, so you no longer need any hooks in
regulatory code at all - you can just set the original channel flags
according to the OF data.

I think this greatly simplifies the flow, since you can also remove
wiphy->freq_limits (and n_freq_limits) completely, since now the only
effect of the function would be to modify the channel list, and later
regulatory updates would always preserve the flags.

johannes
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
