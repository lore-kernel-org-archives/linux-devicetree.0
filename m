From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: irqchip heirarchy DT "break" series awareness?
Date: Tue, 7 Apr 2015 14:49:11 +0200
Message-ID: <20150407144911.1736c162@free-electrons.com>
References: <20150406144647.GC7873@io.lakedaemon.net>
	<20150407115922.5d4c6233@free-electrons.com>
	<20150407124016.GD7873@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150407124016.GD7873-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jason,

On Tue, 7 Apr 2015 12:40:16 +0000, Jason Cooper wrote:

> Because my goal here was to give *every* possible chance for an
> objection.  Hence, "dt" and "break" in the subject line, sent to the
> devicetree ML.  Also, Marc mentioned the possibility in at least the
> cover letter of each of his series.  I don't want anything hidden.
> 
> But you are absolutely correct.  (2) was never guaranteed, and it's also
> highly improbable as well.  See below.

Right.


> > However, my slides are definitely not about #2 (which as said earlier,
> > was never planned to be something we should worry about), but really
> > about #1.
> 
> I was referring to the slide where you mention that distros and vendors
> have tied the dtbs to the kernel versions (Slide 23/27, "Usefulness").
> I should have been more specific when taking something out of context.
> :-P
> 
> My point, not well made, was that everyone has decided to slave the
> upgrade of the dtb to the upgrade of the kernel.  There is no 'apt-get
> armv7-dtbs' that has no dependency structure on a kernel package.  So we
> agree, (2) was never guaranteed, and isn't probable either.

And so is (1), then :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
