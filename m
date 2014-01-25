From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 00/18] Armada 370/XP watchdog support
Date: Sat, 25 Jan 2014 13:57:47 -0300
Message-ID: <20140125165746.GB12189@localhost>
References: <1390431915-5115-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390431915-5115-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 22, 2014 at 08:04:57PM -0300, Ezequiel Garcia wrote:
[..]
>=20
> Thanks to everyone who has helped reviewing the previous sets! It's c=
ertainly
> easier to move forward when you get so much nice feedback...
>=20
> Ezequiel Garcia (18):
>   ARM: Introduce atomic MMIO modify
>   clocksource: orion: Use atomic access for shared registers
>   watchdog: orion: Add clock error handling
>   watchdog: orion: Use atomic access for shared registers
>   watchdog: orion: Remove unused macros
>   watchdog: orion: Make sure the watchdog is initially stopped
>   watchdog: orion: Handle IRQ
>   watchdog: orion: Make RSTOUT register a separate resource
>   watchdog: orion: Remove unneeded BRIDGE_CAUSE clear
>   watchdog: orion: Introduce an orion_watchdog device structure
>   watchdog: orion: Introduce per-compatible of_device_id data
>   watchdog: orion: Add per-compatible clock initialization
>   watchdog: orion: Add per-compatible watchdog start implementation
>   watchdog: orion: Add support for Armada 370 and Armada XP SoC
>   ARM: mvebu: Enable Armada 370/XP watchdog in the devicetree
>   ARM: kirkwood: Add RSTOUT 'reg' entry to devicetree
>   watchdog: orion: Enable the build on ARCH_MVEBU
>   ARM: mvebu: Enable watchdog support in defconfig
>=20
[..]

If at all possible I'd like to get some acks or reviews from the people
that has followed, reviewed and discussed this series with me.

Jason, Arnd, Andrew?
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
