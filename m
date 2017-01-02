From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 3/3] cfg80211: support ieee80211-freq-limit DT property
Date: Mon, 2 Jan 2017 16:05:57 +0100
Message-ID: <CACna6rzvvkXBBHrDj4vVgcM0GmzTxM-Bh60nXYOkRH1-2WrWMQ@mail.gmail.com>
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
> Perhaps a better approach would be to not combine this with wiphy
> registration, but require drivers that may use this to call a new
> helper function *before* wiphy registration (and *after* calling
> set_wiphy_dev()), like e.g.
>
>    ieee80211_read_of_data(wiphy);
>
> (...)
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

I just think it may be better to stick to something like
ieee80211_read_of_freq_limits
or
wiphy_read_of_freq_limits

As you noted this function will be a bit specific because of modifying
(possibly shared) band channels. At some point we may want to add more
helpers for other OF properties which won't have extra requirements
for driver code. Some drivers may want to use them while not necessary
risking have shared band channels modified.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
