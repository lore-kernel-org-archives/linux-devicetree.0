From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v5 1/4] watchdog: at91sam9_wdt: better watchdog support
Date: Fri, 4 Oct 2013 15:30:18 -0700
Message-ID: <20131004223018.GA3685@roeck-us.net>
References: <1380871455-7324-1-git-send-email-b.brezillon@overkiz.com>
 <1380871455-7324-2-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380871455-7324-2-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Guenter Roeck <groeck7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yang Wenyou <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 04, 2013 at 09:24:12AM +0200, Boris BREZILLON wrote:
> The at91sam9 watchdog timer can only be configured once, and the current
> implementation tries to configure it in a static way:
> - 2 seconds timeout
> - wdt restart every 500ms
> 
> If the timer has already been configured with different values, it returns an
> error and do not create any watchdog device.
> 
> This is not critical if the watchdog is disabled, but if it has been enabled with
> different timeout values it will lead to a SoC reset.
> 
> This patch series tries to address this issue by adapting the heartbeat value
> according the WDT timer config:
> - it first tries to configure the timer as requested.
> - if it fails it fallbacks to the current config, adapting its heartbeat timer
> to the needs
> 
> This patch series also move to a dynamically allocated at91wdt device instead
> of the static instance.
> 
> It adds a new at91 wdt type: software. This new type make use of the at91 wdt
> interrupt to trigger a software reboot.
> 
> Finally it adds several properties to the device tree bindings.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
