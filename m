From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: mvebu: Add core-divider clock
Date: Thu, 26 Sep 2013 15:29:37 -0300
Message-ID: <20130926182936.GA7772@localhost>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130925213730.GA19371@localhost>
 <20130926082404.GA18244@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130926082404.GA18244-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hey Andrew,

On Thu, Sep 26, 2013 at 10:24:04AM +0200, Andrew Lunn wrote:
>=20
> +   /*
> +    * Wait for clocks to settle down, and then clear all the
> +     * ratios request and the reload request.
> +      */
> +      udelay(1000);
> +      reg &=3D ~(CORE_CLOCK_DIVIDER_RATIO_MASK | CORE_CLOCK_DIVIDER_=
RATIO_RELOAD);
> +      writel(reg, corediv->reg);
> +      udelay(1000);
>=20
>=20
> Documentation/timers/timers-howto.txt says:=20
>=20
>        SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms):
>        		* Use usleep_range
>=20

Given the set_rate should be protected by spinlocks (as you pointed out=
),
I guess we can't afford using usleep_range (the context is now non-atom=
ic).

Now, according to arch/arm/include/asm/delay.h this is the suggestion
for udelay and friends:

 * Use only for very small delays ( < 2 msec).  Should probably use a
 * lookup table, really, as the multiplications take much too long with
 * short delays.  This is a "reasonable" implementation, though (and
 * the first constant multiplications gets optimized away if the delay =
is
 * a constant) =20

Which means we could just use udelay(1000) without much trouble.

On the other side, since we know the rate the clock is running, we coul=
d
use __delay() just as drivers/clk/sunxi/clk-factors.c is doing.
__delay() has a much simpler implementation, which feels correct in
this case of "wait until the clock settles".

Therefore, I'm currently going to try that option.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
