From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] pinctrl: Allow indicating loss of pin states
 during low-power
Date: Wed, 20 Dec 2017 08:24:07 +0100
Message-ID: <CACRpkdaXrG0rMChf-SVngsPJrsHbAVbUNfH=4m+RX73NHz3iwg@mail.gmail.com>
References: <20171102231551.16220-1-f.fainelli@gmail.com> <20171102231551.16220-3-f.fainelli@gmail.com>
 <CACRpkdZtFRB_iy1bDPZ0wkK0jf7pkTGtbZG4gQUJVR+eiO+dhA@mail.gmail.com>
 <20171129170247.GI28152@atomide.com> <96cf5d74-3acf-07b9-9ad8-1011cd99a860@gmail.com>
 <CACRpkdbFHj9pM6R3azVPKgbQ-LMmitEdJHQ5BOEb7Vy=kpNk4A@mail.gmail.com> <908c66f9-f9bd-a4df-e241-75595a3a3e27@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <908c66f9-f9bd-a4df-e241-75595a3a3e27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 11, 2017 at 12:38 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/02/2017 04:48 AM, Linus Walleij wrote:

>> This should solve your problem without having to alter the semantics
>> of pinctrl_select_state() for everyone.
>
> This was exactly what I proposed initially here:
>
> http://patchwork.ozlabs.org/patch/734326/
>
> I really want to get this fixed, but I can't do that if we keep losing
> the context of the discussion (pun intended) :).

Oh sorry man. I am clearly too stupid for this job...

In accordance with things needing to be intuitive, something named
*force_* should of course force the setting into the hardware.

The original patch didn't mention the fact that it was hogs
and hogs only that was causing the trouble and that is why I
got lost. (I guess.) I have been going about this as if it was
something generic that affect all states in all devices, and to
me hogs is just an abscure corner of pin controlling...

I applied the patchwork patch from above, and elaborated
a bit on that it pertains to hogs, let's see what
happens.

For the case where a driver (not hog) needs to handle
suspend/resume transitions, proper states can hopefully
be used.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
