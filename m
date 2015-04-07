From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: irqchip heirarchy DT "break" series awareness?
Date: Tue, 07 Apr 2015 11:21:35 +0100
Message-ID: <5523AFAF.6040000@arm.com>
References: <20150406144647.GC7873@io.lakedaemon.net> <20150407115922.5d4c6233@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150407115922.5d4c6233-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 07/04/15 10:59, Thomas Petazzoni wrote:

> But the point of the slides stand: even for a piece of hardware as
> well-documented as the GIC, as widely used as the GIC, with as many
> bright and smart engineers looking into it, the community has not been
> able to put out a DT binding that can be kept stable. How can we expect
> such a DT binding stability to occur for undocumented hardware, or
> SoC-specific hardware blocks that are definitely a lot less used than
> the GIC ?

The problem at hand is not so much the GIC itself, but the fact that
only the GIC was described in DT. The GIC binding is unchanged, but some
additional hardware is now described.

If the relationship between the GIC and the shadow interrupt controllers
had been described, we would have avoided breaking the compatibility. I
guess it was too tempting to reuse pre-DT mechanisms and to forget about
this entirely.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
