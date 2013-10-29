From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] documentation/devicetree: Move DT bindigns from gpio to watchdog
Date: Tue, 29 Oct 2013 08:41:53 +0100
Message-ID: <20131029074153.GE19569@spo001.leaseweb.com>
References: <1377088929-23694-1-git-send-email-johannes.thumshirn@men.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1377088929-23694-1-git-send-email-johannes.thumshirn-csrFAY9JiS4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Johannes,

> I accidently put the devicetree bindings for the MEN A21 watchdog driver in
> Documentation/devicetree/bindings/gpio instead of
> Documentation/devicetree/bindings/watchdog, this patch addresses this error.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> ---
>  .../bindings/{gpio => watchdog}/men-a021-wdt.txt   |    0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{gpio => watchdog}/men-a021-wdt.txt (100%)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/men-a021-wdt.txt b/Documentation/devicetree/bindings/watchdog/men-a021-wdt.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/gpio/men-a021-wdt.txt
> rename to Documentation/devicetree/bindings/watchdog/men-a021-wdt.txt

This patch has been added to linux-watchdog-next.

Kind regards,
Wim.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
