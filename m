From: Anders Berg <anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Add platform support for LSI AXM55xx
Date: Thu, 15 May 2014 14:59:00 +0200
Message-ID: <CAE0=X_2YsfGRZHC5XY0F-5Td_k20s7ADRhhv=3a9bRT7wqxNGw@mail.gmail.com>
References: <cover.1400072260.git.anders.berg@avagotech.com>
	<6334605.NlytHCzYVP@wuerfel>
	<CAE0=X_15Yk3VhHTwG-piA_eYL1mKW9wu_Szp-yL0YyfL8m0ecA@mail.gmail.com>
	<30207873.oHzEC0kjdd@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <30207873.oHzEC0kjdd@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 2:39 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> I don't see the dependency: The clock driver is built only when CONFIG_ARCH_AXXIA
> is set, and that only gets introduced in the platform patches. As long
> as the header files come with the platform, it should be fine.

You're right of course. I didn't think that all the way though...

I'll send a v4 of the series (minus the clk patch) when I get an OK on
the binding of the clk driver.

/Anders
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
