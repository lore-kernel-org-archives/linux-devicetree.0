From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: pxa: fix gpio0 and gpio1 interrupts
Date: Sat, 08 Oct 2016 11:31:51 +0200
Message-ID: <8760p389vc.fsf@belgarion.home>
References: <1474874531-26703-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474874531-26703-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
        (Robert Jarzmik's message of "Mon, 26 Sep 2016 09:22:11 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org> writes:

> Since gpio-pxa was redesigned to differenciate gpio0, gpio1 and the
> gpio-mux interrupt as in the hardware IP, the device-tree description
> should be amended so that interrupts from gpio0 and gpio1 can be mapped
> to consumers.
>
> This is especially true on lubbock and mainstone devices where gpio0 is
> multiplexed on pxa_cplds for ethernet, sa1111, usb udc, and other
> devices.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Applied to pxa/dt.

Cheers.

-- 
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
