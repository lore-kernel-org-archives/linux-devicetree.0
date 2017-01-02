From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V2 1/3] cfg80211: allow passing struct device in the
 wiphy_new call
Date: Mon, 02 Jan 2017 15:10:09 +0100
Message-ID: <1483366209.21014.7.camel@sipsolutions.net>
References: <20170102132747.3491-1-zajec5@gmail.com>
         <1483364298.21014.3.camel@sipsolutions.net>
         <CACna6rzc2hk2xosd54eZVSUCtqgtT5E2vii24rgWBV96PR1W7A@mail.gmail.com>
         (sfid-20170102_150530_098112_601BD14A)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rzc2hk2xosd54eZVSUCtqgtT5E2vii24rgWBV96PR1W7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (sfid-20170102_150530_098112_601BD14A)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> 2) mac80211 - it's a big one as it's used in SET_IEEE80211_DEV
> 
> I was planning to work on mac80211 drivers later. This will require
> similar modification of ieee80211_alloc_hw.

Ah, ok, thanks for the explanation.

johannes
