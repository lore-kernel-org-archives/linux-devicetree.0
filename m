From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: irqchip heirarchy DT "break" series awareness?
Date: Tue, 7 Apr 2015 11:59:22 +0200
Message-ID: <20150407115922.5d4c6233@free-electrons.com>
References: <20150406144647.GC7873@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150406144647.GC7873-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jason,

On Mon, 6 Apr 2015 14:46:47 +0000, Jason Cooper wrote:

> This causes two problems:
> 
>  1) Upgrade kernel, but not DTB.
> 
> 	System will boot, and print a big fat warning that
> 	suspend/resume will not work until the DTB is upgraded.
> 
>  2) Upgrade DTB, but not kernel.
> 
> 	System will fail to boot.

(2) has never been something that has ever planned of being guaranteed,
as far as I know. Only (1) is the supposed consequence of DT ABI
stability, but definitely not (2), so I'm unsure why you even mention
(2).

> In light of Thomas Petazonni's well-researched talk at ELC:
> 
>   "The Device Tree as a stable ABI: a fairy tale?"
>   http://events.linuxfoundation.org/sites/events/files/slides/petazzoni-dt-as-stable-abi-fairy-tale.pdf
> 
> I'm confident that #2 won't be an issue.  Distro's and OEMs seem to have
> worked around the instability by keeping the dtb tied to the kernel
> version.

I'm glad you raised my slides as an argument in a DT ABI stability
discussion :-)

However, my slides are definitely not about #2 (which as said earlier,
was never planned to be something we should worry about), but really
about #1.

But the point of the slides stand: even for a piece of hardware as
well-documented as the GIC, as widely used as the GIC, with as many
bright and smart engineers looking into it, the community has not been
able to put out a DT binding that can be kept stable. How can we expect
such a DT binding stability to occur for undocumented hardware, or
SoC-specific hardware blocks that are definitely a lot less used than
the GIC ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
