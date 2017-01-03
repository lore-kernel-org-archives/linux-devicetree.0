From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V3 2/2] cfg80211: support ieee80211-freq-limit DT
 property
Date: Tue, 03 Jan 2017 08:06:17 +0100
Message-ID: <1483427177.15591.5.camel@sipsolutions.net>
References: <20170102163209.2445-1-zajec5@gmail.com>
         <20170102163209.2445-2-zajec5@gmail.com>
         <1483379548.15591.1.camel@sipsolutions.net>
         <CACna6ryrYY5G=Fvmsrq_sD3iX5dWreyz7R8mGEd6ogUck=twnQ@mail.gmail.com>
         (sfid-20170102_231255_379430_96267468)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6ryrYY5G=Fvmsrq_sD3iX5dWreyz7R8mGEd6ogUck=twnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (sfid-20170102_231255_379430_96267468)
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> When driver uses custom regulatory it registers initial channels at
> init but it can also react to regdom changes using reg_notifier. Is
> that correct?

We can treat regulatory and OF data as entirely independent, I think.
At least that's my suggestion:

 * use OF data to populate the original channel list, saying which
   channels are valid (or not)
 * use regulatory later to further restrict settings of the channels

> So I'm looking at brcmf_cfg80211_reg_notifier which calls
> brcmf_setup_wiphybands which calls brcmf_construct_chaninfo.
> That last one reworks all channels on every call. It first marks all
> existing channels as DISABLED then queries firmware for the list of
> supported channels and updates wiphy channels one by one.
> So if I understand this correctly, every regdom change can result in
> rebuilding channels pretty much from the scratch. That's why I
> believed I need to call wiphy_freq_limits_apply on runtime, not just
> during the init.
> 
> Is there some flow in my understanding?

I think maybe there's a problem in my understanding :)

All the regulatory code usually takes into account channel->orig_flags. 
If this code also did, then we could have the original DISABLED flag
taken from OF still be valid here.

johannes

johannes
