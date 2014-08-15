From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] ARM: BCM63XX: add BCM63138 minimal Device Tree
Date: Thu, 14 Aug 2014 20:03:35 -0700
Message-ID: <CAGVrzcZZEDBLkBq1=SC-1Ege3AE-jn4e8v9SYBELwFnO6_riGA@mail.gmail.com>
References: <1408061487-20984-1-git-send-email-f.fainelli@gmail.com> <1408061487-20984-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408061487-20984-4-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mbizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, elder-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-08-14 17:11 GMT-07:00 Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Add a very minimalistic BCM63138 Device Tree include file which
> describes the BCM63138 SoC with only the basic set of required
> peripherals:
>
> - Cortex A9 CPUs
> - ARM GIC
> - ARM SCU
> - PL310 Level-2 cache controller
> - ARM TWD & Global timers
> - ARM TWD watchdog
> - legacy MIPS bus (UBUS)
> - BCM6345-style UARTs (disabled by default)
>
> Since the PL310 L2 cache controller does not come out of reset with
> correct default values, we need to override the 'cache-sets' and
> 'cache-size' properties to get its geometry right.
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[snip]

> +       /* ARM bus */
> +       axi@80000000 {
> +               compatible = "simple-bus";
> +               ranges = <0 0x80000000 0x84000>;

I made a typo here, the range declared here is narrower than it really
is, I will re-submit this after getting some more feedback. Thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
