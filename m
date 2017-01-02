From: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V3 2/2] cfg80211: support ieee80211-freq-limit DT property
Date: Mon, 2 Jan 2017 21:12:07 +0100
Message-ID: <e194b980-1048-8da6-624b-26f824ff655d@broadcom.com>
References: <20170102163209.2445-1-zajec5@gmail.com>
 <20170102163209.2445-2-zajec5@gmail.com>
 <1483379548.15591.1.camel@sipsolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483379548.15591.1.camel-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 02-01-17 18:52, Johannes Berg wrote:
>> +static void wiphy_freq_limits_apply(struct wiphy *wiphy)
> [...]
>> +			if (!wiphy_freq_limits_valid_chan(wiphy,
>> chan)) {
>> +				pr_debug("Disabling freq %d MHz as
>> it's out of OF limits\n",
>> +					 chan->center_freq);
>> +				chan->flags |=
>> IEEE80211_CHAN_DISABLED;
> 
> I think you didn't address the problem in the best way now.
> 
> The problem with the channel sharing was the way you're applying the
> limits - at runtime. This is now OK since the new function shouldn't be
> called when the channel structs are shared, but hooking it all into thes 
> regulatory code is now no longer needed.
> 
> What you can do now, when reading the OF data, is actually apply it to
> the channel flags immediately. If done *before* wiphy_register(), these
> flags will be preserved forever, so you no longer need any hooks in
> regulatory code at all - you can just set the original channel flags
> according to the OF data.

I suppose this then can also be done early in the wiphy_register()
function itself, right?

> I think this greatly simplifies the flow, since you can also remove
> wiphy->freq_limits (and n_freq_limits) completely, since now the only
> effect of the function would be to modify the channel list, and later
> regulatory updates would always preserve the flags.

So does it mean the function can go in core.c again :-p If it is likely
there will be other properties being added it might justify adding a new
source file, eg. of.c, and only compile it when CONFIG_OF is set. Just a
thought.

Regards,
Arend
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
