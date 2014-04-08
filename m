From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] driver: clocksource: fix age-old arch timer C3STOP
 detection issue
Date: Tue, 8 Apr 2014 14:01:54 -0500
Message-ID: <CAL_JsqLUjcrmXCcuA=UXEByUn9gjyOx9Wan=4rk+LRbTcJ+tNQ@mail.gmail.com>
References: <1396947872-6673-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396947872-6673-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 8, 2014 at 4:04 AM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> ARM arch timers are tightly coupled with the CPU logic and lose context
> on platform implementing HW power management when cores are powered
> down at run-time. Marking the arch timers as C3STOP regardless of power
> management capabilities causes issues on platforms with no power management,
> since in that case the arch timers cannot possibly enter states where the
> timer loses context at runtime and therefore can always be used as a high
> resolution clockevent device.
>
> In order to fix the C3STOP issue in a way compliant with how real HW
> works, this patch adds a boolean property to the arch timer bindings
> to define if the arch timer is managed by an always-on power domain.
>
> This power domain is present on all ARM platforms to date, and manages
> HW that must not be turned off, whatever the state of other HW
> components (eg power controller). On platforms with no power management
> capabilities, it is the only power domain present, which encompasses
> and manages power supply for all HW components in the system.
>
> If the timer is powered by the always-on power domain, the always-on
> property must be present in the bindings which means that the timer cannot
> be shutdown at runtime, so it is not a C3STOP clockevent device.
> If the timer binding does not contain the always-on property, the timer is
> assumed to be power-gateable, hence it must be defined as a C3STOP
> clockevent device.
>
> Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
> Cc: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
