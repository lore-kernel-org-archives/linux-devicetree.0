From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: dts: armada388: Introduce Clearfog Base DT
Date: Wed, 04 Jan 2017 16:48:20 +0100
Message-ID: <8760lug723.fsf@free-electrons.com>
References: <E1cO41M-0007xc-Id@rmk-PC.armlinux.org.uk>
        <E1cO43Q-0007yJ-ON@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1cO43Q-0007yJ-ON-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org> (Russell King's
        message of "Mon, 02 Jan 2017 14:57:40 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,
 
 On lun., janv. 02 2017, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> This patch series, based upon the previously submitted fix for the SPI
> flash, reworks the Clearfog DT files to add support for the SolidRun
> Clearfog Base platform.
>
> The conventional model is now known as the "Clearfog Pro" module, which
> has the DSA switch and two PCIe sockets.  The base model is a smaller
> board without the DSA switch, replacing it with a second copper gigabit
> port, and only one PCIe socket.
>
> We retain the original DT file (named armada-388-clearfog.dtb) for
> compatibility with existing installations - not only the filename,
> but also the board name exposed in userspace.


All the series applied on mvebu/dt.

I amended the last two patches because the license text was mangled as
spotted by Alexandre Belloni, so I fixed it while applying the patches.


Thanks,

Gregory


>
>  arch/arm/boot/dts/Makefile                         |   2 +
>  arch/arm/boot/dts/armada-388-clearfog-base.dts     |  94 ++++++
>  arch/arm/boot/dts/armada-388-clearfog-pro.dts      |  55 ++++
>  arch/arm/boot/dts/armada-388-clearfog.dts          | 364 ++++-----------------
>  arch/arm/boot/dts/armada-388-clearfog.dtsi         | 310 ++++++++++++++++++
>  .../arm/boot/dts/armada-38x-solidrun-microsom.dtsi |  21 ++
>  6 files changed, 548 insertions(+), 298 deletions(-)
>  create mode 100644 arch/arm/boot/dts/armada-388-clearfog-base.dts
>  create mode 100644 arch/arm/boot/dts/armada-388-clearfog-pro.dts
>  create mode 100644 arch/arm/boot/dts/armada-388-clearfog.dtsi
>
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
