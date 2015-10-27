From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/4] Patches to fix remote wakeup on rk3288 dwc2 "host" port
Date: Mon, 26 Oct 2015 18:43:00 -0700
Message-ID: <CAD=FV=VKhBheVVBFT9DRDgd32o54RV8Er8sKqCHUvZm3ChnBRA@mail.gmail.com>
References: <1445624891-31680-1-git-send-email-dianders@chromium.org>
	<562B9F5F.1080800@kernel.org>
	<CAD=FV=VgYU8sZfSkbNbbOFpb-nt=Yy9NjybxADBnAiQXfasDpw@mail.gmail.com>
	<CAL_JsqLtYrzvreV68V5S0wFJNAR6JusnqZrLjsJwT6yXgrQKHg@mail.gmail.com>
	<CAD=FV=UfdEN4MzAwZLWDTQ4qMakhchpr063U1e3uk6R96wScJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=UfdEN4MzAwZLWDTQ4qMakhchpr063U1e3uk6R96wScJw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Herrero, Gregory" <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Oct 26, 2015 at 4:49 PM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> One note: the "full" PHY reset is actually not in the register map of
> the PHY.  It is amazingly enough in the CRU (clock reset unit).  So if
> we actually exposed the "full" reset through the PHY framework, the
> PHY would then turn around and pass it off to the reset framework,
> which is how the full PHY reset is exposed from the CRU.

Interestingly enough, it looks like there's a reasonable chance that
we won't be able to use the PHY port reset.  We might have to go back
to the full PHY reset (though it causes de-enumeration and
re-enumeration) for safety, since there might be some side effects of
the "phy port reset".

Probably shouldn't land this series until we can figure that out.
...but in that case we still have the question of how we should export
it.  It would certainly be easy to keep using the reset framework...
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
