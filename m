From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/12] ARM: dts: dragonboard-600c: Add on board leds
 support
Date: Tue, 29 Mar 2016 14:10:55 -0700
Message-ID: <20160329211055.GU8929@tuxbot>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762484-9768-1-git-send-email-srinivas.kandagatla@linaro.org>
 <20160327055012.GD8929@tuxbot>
 <56FA8F47.7070200@linaro.org>
 <20160329145115.GO8929@tuxbot>
 <CAP71WjwPQn8OuCy+8iuQpDrUW2baQ0qzaviLEDixVzTmUP_BTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAP71WjwPQn8OuCy+8iuQpDrUW2baQ0qzaviLEDixVzTmUP_BTw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Dechesne <nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue 29 Mar 11:32 PDT 2016, Nicolas Dechesne wrote:

> On Tue, Mar 29, 2016 at 4:51 PM, Bjorn Andersson
> <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >> Am ok, to change, did you get activity leds works with any of these strings
> >> with WLAN or BT?
> >>
> >
> > I did test them; rx, assoc and radio seems to work. Tx does not tickle
> > the led, but should probably.
> >
> > I didn't find the spec for the baord, so I'm not sure what the LEDs
> > should indicate. But it feels like radio or assoc makes most sense, and
> > follows what we can do with the BT led.
> 
> this is in the 96boards 'specs' at [1], which states
> 
> -
> The User LEDs shall be directly programmable from the SoC.
> 1. WiFi activity LED
> 2. Bluetooth activity LED
> -
> 
> [1] http://www.96boards.org/ce-specification

Thanks Nico. I presume "activity" here means it should be off and blink
upon data being transmitted in either direction?

Sounds like we need to plan some work to extend the existing triggers
with a phyXactivity and hciX-activity.


For now I think we should go with phy0assoc and hci-power though, so we
have something related to WiFi and BT.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
