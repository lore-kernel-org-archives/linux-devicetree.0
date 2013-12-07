From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 4/9] clocksource/cadence_ttc: Use enable/disable_irq
Date: Sat, 7 Dec 2013 11:56:06 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1312071151340.30673@ionos.tec.linutronix.de>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-5-git-send-email-soren.brinkmann@xilinx.com> <52972F3A.9090103@linaro.org> <alpine.DEB.2.02.1311281507280.30673@ionos.tec.linutronix.de>
 <b2ed3cbc-c9df-4235-8137-93514c05bffa@DB8EHSMHS031.ehs.local> <alpine.DEB.2.02.1311281939000.30673@ionos.tec.linutronix.de> <f6d25456-8e30-4792-b184-21eb02dfaa1c@AM1EHSMHS001.ehs.local>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1212725415-1386413767=:30673"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f6d25456-8e30-4792-b184-21eb02dfaa1c-dAX9Bq04yCRZbvUCbuG1mrjjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?S=F6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1212725415-1386413767=:30673
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 6 Dec 2013, Sören Brinkmann wrote:
> On Thu, Nov 28, 2013 at 08:07:10PM +0100, Thomas Gleixner wrote:
> > There is a solution to this. We can identify the broadcast device in
> > the core and serialize all callers including interrupts on a different
> > cpu against the update. So no need for the disable/enable_irq() dance.
> 
> IIUC, and please correct me if I'm wrong, with the patch I'd simply call
> 'clockevents_update_freq() without having to disable IRQs. But I'm not
> sure whether periodic mode is covered. I found, that I had to reprogram
> the timer interval in my clock notifier callback when the timer
> frequency changes. I think 'clockevents_update_freq()' only handles
> oneshot mode. For that reason I call 'ttc_set_interval()' in the clock
> notifier in case the timer is in periodic mode. For that call we'd still
> have possible races. I guess the best solution would be to move that
> functionality into 'clockevents_update_freq()'?

Indeed.

--8323329-1212725415-1386413767=:30673--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
