From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: enable touchpad button for
 rk3399-gru-kevin
Date: Tue, 10 Oct 2017 10:03:57 -0700
Message-ID: <20171010170355.GA136735@google.com>
References: <20171009184028.11829-1-kernel@esmil.dk>
 <4174027.Z5MyPRUDcj@phil>
 <CANBLGcx187QrX3pgUAjvBmPbyJsX7ZiYdWXhamM-atEe+Mqe3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANBLGcx187QrX3pgUAjvBmPbyJsX7ZiYdWXhamM-atEe+Mqe3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Renner Berthing <kernel-sKpHZLTYfq0@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ Dmitry, who can probably answer better than I can

On Tue, Oct 10, 2017 at 01:04:20PM +0200, Emil Renner Berthing wrote:
> On 10 October 2017 at 11:33, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> > Am Montag, 9. Oktober 2017, 20:40:28 CEST schrieb Emil Renner Berthing:
> >> Adding the linux,gpio-keymap entry also has
> >> the side-effect of making the driver register
> >> the touchpad as a touchpad rather than another
> >> touchscreen.
> >>
> >> The index for BTN_LEFT was found by trial and error.
> >>
> >> Signed-off-by: Emil Renner Berthing <kernel-sKpHZLTYfq0@public.gmane.org>
> >
> > looks good to me. I'll just give the ChromeOS people a chance to
> > respond before applying [maybe they can even tell what the other
> > keys are :-) ]
> 
> Good plan. As far as I can tell their kernel doesn't send anything but
> BTN_LEFT either. It's just that the controller supports multiple
> buttons, but not all are necessarily connected to any button.
> Their version of the driver has logic to detect the proper keymap
> whereas the mainline driver gets it from this devicetree entry.

I believe Emil is mostly correct. We only are using a BTN_LEFT in our
copy of the driver, and I'm not sure the others are connected to
anything. As Dmitry has explained to me (when I also wondered about
"detect[ing] the proper keymap"), we don't exactly "auto"discover
things; we just heuristically determine the configurations we know are
used on Chrome devices.

So from the sound of it, this keymap property is reasonable. I haven't
actually checked what our driver "auto" detects on gru-kevin, but if
this works then I'll bet it's correct :)

IOW, I don't know enough to ACK this patch, but I'm certainly not going
to NAK it.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
