From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: irqchip heirarchy DT "break" series awareness?
Date: Mon, 6 Apr 2015 14:46:47 +0000
Message-ID: <20150406144647.GC7873@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Arnd, Olof, others,

Have you been following Marc's irqchip series(es) leveraging stacked
domains to remove the abuse of gic_arch_extn ?

  Tegra LIC
  https://lkml.kernel.org/r/1426088583-15097-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org

  OMAP Crossbar
  https://lkml.kernel.org/r/1426088629-15377-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org

  Exynos PM
  https://lkml.kernel.org/r/1426088693-15724-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org

  shmobile, ux500, zynq irq_set_wake
  https://lkml.kernel.org/r/1426088737-15817-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org

  imx6 was taken by Shawn
  https://lkml.kernel.org/r/1426262737-32762-1-git-send-email-marc.zyngier-5wv7dgnIgG8@public.gmane.org

You can find the patches in one series per branch at:

  git://git.infradead.org/users/jcooper/linux.git irqchip/stacked-tegra
  git://git.infradead.org/users/jcooper/linux.git irqchip/stacked-omap
  git://git.infradead.org/users/jcooper/linux.git irqchip/stacked-exynos
  git://git.infradead.org/users/jcooper/linux.git irqchip/stacked-irq_set_wake

I ask because with Thomas' (tglx) absence, it looks like I'm going to be
sending the pull request directly to Linus.  This has increased my
pucker factor a bit. :-)

The logistical stuff is in order.  It'll be my second pull request, and
it'll only contain the changes relevant.  The whole set has gone through
several rounds of review.  All the arm sub-arch maintainers have either
taken the part relevant to them, Acked me taking them, or failed to
object while they've been in linux-next for several weeks now.

My concern is the DT ABI stability problem.  In short, we fucked up.
When we added several of the irqchip bindings, we designed them based on
the Linux implementation (gic_arch_extn).  *Not* by describing the
hardware.

Marc's series undoes this in the best way possible.  He changes the DT
bindings to actually describe the hardware, which then gets modeled in
stacked domains quite well.

This causes two problems:

 1) Upgrade kernel, but not DTB.

	System will boot, and print a big fat warning that
	suspend/resume will not work until the DTB is upgraded.

 2) Upgrade DTB, but not kernel.

	System will fail to boot.

In light of Thomas Petazonni's well-researched talk at ELC:

  "The Device Tree as a stable ABI: a fairy tale?"
  http://events.linuxfoundation.org/sites/events/files/slides/petazzoni-dt-as-stable-abi-fairy-tale.pdf

I'm confident that #2 won't be an issue.  Distro's and OEMs seem to have
worked around the instability by keeping the dtb tied to the kernel
version.

And, on the off chance that end users upgrade their kernel, say, by
building mainline, there's a very clear warning that tells them exactly
what to do:  Upgrade the dtb as well.

Do you foresee any problem with this?  Is there anything I haven't
considered?  Or extra information I'll need to present in my pull
request?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
