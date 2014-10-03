From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Fri, 3 Oct 2014 17:25:13 +0100
Message-ID: <20141003162513.GW26643@leverpostej>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net>
 <2386503.dNPayhXJTQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2386503.dNPayhXJTQ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From a system design point, it's still horrible that you have to use
> DT for a device that is on a discoverable bus like PCI, but as you describe,
> the reality is that products are shipping that use ath10k PCI devices
> without this data in them.

I'd see any DT property for this as a workaround, the use of which
should be discouraged.

A fun question that springs to mind is can the ath10k chip be removed,
and if so am I able to place it into a non-DT system (whereupon I have
no calibration data, so it won't work)?

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
