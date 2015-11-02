From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: dwc2: optionally assert phy "full reset" when
 waking up
Date: Mon, 2 Nov 2015 10:12:32 -0600
Message-ID: <CAL_JsqKCEC3=PmD27zZ2KMY-UwZTjoZrwnEimWOvgqLeJ6wRjg@mail.gmail.com>
References: <1446236275-12698-1-git-send-email-dianders@chromium.org> <1446236275-12698-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446236275-12698-2-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Gregory Herrero <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 3:17 PM, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> On the rk3288 USB host-only port (the one that's not the OTG-enabled
> port) the PHY can get into a bad state when a wakeup is asserted (not
> just a wakeup from full system suspend but also a wakeup from
> autosuspend).

I would think re-enumerating means autosuspend is broken.

> We can get the PHY out of its bad state by asserting its "port reset",
> but unfortunately that seems to assert a reset onto the USB bus so it
> could confuse things if we don't actually deenumerate / reenumerate the
> device.
>
> We can also get the PHY out of its bad state by fully resetting it using
> the reset from the CRU (clock reset unit), which does a more full
> reset.  The CRU-based reset appears to actually cause devices on the bus
> to be removed and reinserted, which fixes the problem (albeit in a hacky
> way).

The reset from the CRU goes to the PHY, correct? Therefore, the
binding should reflect that. Connecting it to the host controller is a
hack.

So describe the reset connection properly and then add a .phy_reset()
hook to the phy subsystem. Then call that when flag property you added
is set.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
