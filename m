From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] GPIO: Add driver for ThunderX and OCTEON-TX SoCs
Date: Fri, 6 Jan 2017 15:24:50 -0800
Message-ID: <82a012d5-1035-91ec-8152-d7b6b5c6e197@caviumnetworks.com>
References: <1483491334-167095-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483491334-167095-1-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This version is obsolete.  v2 has been sent.

Thanks,
David Daney

On 01/03/2017 04:55 PM, David Daney wrote:
> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>
> The subject says it all.  The Cavium ThunderX and OCTEON-TX family of
> SoCs have on-chip GPIO lines.  This patch set adds a driver for these.
>
> David Daney (3):
>   dt-bindings: gpio: Add binding documentation for gpio-thunderx
>   gpio: Add gpio driver support for ThunderX and OCTEON-TX
>   MAINTAINERS: Add entry for THUNDERX GPIO Driver.
>
>  .../devicetree/bindings/gpio/gpio-thunderx.txt     |  33 ++
>  MAINTAINERS                                        |   5 +
>  drivers/gpio/Kconfig                               |   7 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-thunderx.c                       | 467 +++++++++++++++++++++
>  5 files changed, 513 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
>  create mode 100644 drivers/gpio/gpio-thunderx.c
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
