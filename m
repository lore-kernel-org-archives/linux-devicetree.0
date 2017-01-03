From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V3 2/2] cfg80211: support ieee80211-freq-limit DT
 property
Date: Tue, 03 Jan 2017 08:00:58 +0100
Message-ID: <1483426858.15591.3.camel@sipsolutions.net>
References: <20170102163209.2445-1-zajec5@gmail.com>
         <20170102163209.2445-2-zajec5@gmail.com>
         <1483379548.15591.1.camel@sipsolutions.net>
         <e194b980-1048-8da6-624b-26f824ff655d@broadcom.com>
         (sfid-20170102_211210_491488_1DB64A4C)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e194b980-1048-8da6-624b-26f824ff655d-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> (sfid-20170102_211210_491488_1DB64A4C)
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> I suppose this then can also be done early in the wiphy_register()
> function itself, right?

No, because of the shared channel data issue. If this is
unconditionally in wiphy_register() then we can no longer guarantee
that sharing it is acceptable - which it is today under certain
circumstances the driver controls. This would move it out of driver
control, making it never possible to share any more.

> So does it mean the function can go in core.c again :-p If it is
> likely there will be other properties being added it might justify
> adding a new source file, eg. of.c, and only compile it when
> CONFIG_OF is set. Just a thought.

Yeah, whatever :)
We can figure that out once we have the mechanisms in place.

johannes
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
