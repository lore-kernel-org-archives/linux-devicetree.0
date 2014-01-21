From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 02/15] clocksource: orion: Use atomic access for shared
 registers
Date: Tue, 21 Jan 2014 10:58:17 +0100
Message-ID: <52DE44B9.70308@gmail.com>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com> <1390295561-3466-3-git-send-email-ezequiel.garcia@free-electrons.com> <5118193.GjKusj569J@wuerfel>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5118193.GjKusj569J@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/21/14 10:46, Arnd Bergmann wrote:
> On Tuesday 21 January 2014 06:12:28 Ezequiel Garcia wrote:
>> -/*
>> - * Thread-safe access to TIMER_CTRL register
>> - * (shared with watchdog timer)
>> - */
>> -void orion_timer_ctrl_clrset(u32 clr, u32 set)
>> -{
>> -       spin_lock(&timer_ctrl_lock);
>> -       writel((readl(timer_base + TIMER_CTRL) & ~clr) | set,
>> -               timer_base + TIMER_CTRL);
>> -       spin_unlock(&timer_ctrl_lock);
>> -}
>> -EXPORT_SYMBOL(orion_timer_ctrl_clrset);
>
> I don't understand what's wrong with this function, it seems like
> a cleaner approach than touching the register directly from two
> different drivers. Is this something that would only work on
> orion but not on armadaxp?

The real problem with this is that it resides in orion-time.c which
is fine for Orion SoCs. Armada 370/XP use a different timer and
therefore the _common_ watchdog driver cannot call this function.

Moreover, Dove (out of Orion) and Armada 370/XP will happily live in
one V7 kernel with both time-orion and time-armada-370-xp compiled in.

The idea of the atomic readl/writel was to have something lightweight
and _early_ to allow such locking even for timers.

IIRC, there was some kind of consensus that it is okay to have atomic
readl/writel here.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
