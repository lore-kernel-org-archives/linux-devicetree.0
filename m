From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V2 3/3] cfg80211: support ieee80211-freq-limit DT
 property
Date: Mon, 02 Jan 2017 16:10:44 +0100
Message-ID: <1483369844.21014.13.camel@sipsolutions.net>
References: <20170102132747.3491-1-zajec5@gmail.com>
         <20170102132747.3491-3-zajec5@gmail.com>
         <1483365844.21014.6.camel@sipsolutions.net>
         <CACna6rzvvkXBBHrDj4vVgcM0GmzTxM-Bh60nXYOkRH1-2WrWMQ@mail.gmail.com>
         (sfid-20170102_160558_947240_E0DB4C21)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rzvvkXBBHrDj4vVgcM0GmzTxM-Bh60nXYOkRH1-2WrWMQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (sfid-20170102_160558_947240_E0DB4C21)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-01-02 at 16:05 +0100, Rafał Miłecki wrote:
> On 2 January 2017 at 15:04, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
> wrote:
> > Perhaps a better approach would be to not combine this with wiphy
> > registration, but require drivers that may use this to call a new
> > helper function *before* wiphy registration (and *after* calling
> > set_wiphy_dev()), like e.g.
> > 
> >    ieee80211_read_of_data(wiphy);
> > 
> > (...)

> I just think it may be better to stick to something like
> ieee80211_read_of_freq_limits
> or
> wiphy_read_of_freq_limits

I have no objection to that.

> As you noted this function will be a bit specific because of
> modifying (possibly shared) band channels. At some point we may want
> to add more helpers for other OF properties which won't have extra
> requirements for driver code. Some drivers may want to use them while
> not necessary risking have shared band channels modified.

That makes sense, although at that time we might still wish to have a
common "read it all" with the combined requirements. But we can cross
that bridge when we get to it.

johannes
