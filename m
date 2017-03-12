From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 00/23] MAINTAINERS: Add file patterns for subsystem device tree bindings
Date: Sun, 12 Mar 2017 14:16:44 +0100
Message-ID: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi all,

Submitters of device tree binding documentation regularly forget to CC
the subsystem maintainer due to missing entries in MAINTAINERS for
Documentation/devicetree/bindings/. This patch series is an attempt to
add (most) missing entries.

Maintainers: Please apply the appropriate patch(es) directly if you want
to be involved in device tree binding documentation for your subsystem.

Changes compared to v1 ("[PATCH 00/54] MAINTAINERS: Add file patterns
for device tree bindings", which was against v4.6):
  - Rebase on top of v4.11-rc1 / next-20170310,
  - Drop 32 accepted patches,
  - Drop 3 rejected patches,
  - Add 4 patches (auxdisplay, infiniband, ipmi, perf),
  - Add Acked-by, Reviewed-by.

Thanks!

Geert Uytterhoeven (23):
  MAINTAINERS: Add file patterns for auxdisplay device tree bindings
  MAINTAINERS: Add file patterns for clocksource device tree bindings
  MAINTAINERS: Add file patterns for cpufreq device tree bindings
  MAINTAINERS: Add file patterns for cris device tree bindings
  MAINTAINERS: Add file patterns for dove device tree bindings
  MAINTAINERS: Add file patterns for dsa device tree bindings
  MAINTAINERS: Add file patterns for fpga device tree bindings
  MAINTAINERS: Add file patterns for h8300 device tree bindings
  MAINTAINERS: Add file patterns for infiniband device tree bindings
  MAINTAINERS: Add file patterns for ipmi device tree bindings
  MAINTAINERS: Add file patterns for mailbox device tree bindings
  MAINTAINERS: Add file patterns for media device tree bindings
  MAINTAINERS: Add file patterns for mediatek device tree bindings
  MAINTAINERS: Add file patterns for nios2 device tree bindings
  MAINTAINERS: Add file patterns for perf device tree bindings
  MAINTAINERS: Add file patterns for powerpc device tree bindings
  MAINTAINERS: Add file patterns for pps device tree bindings
  MAINTAINERS: Add file patterns for serio device tree bindings
  MAINTAINERS: Add file patterns for ti device tree bindings
  MAINTAINERS: Add file patterns for tpm device tree bindings
  MAINTAINERS: Add file patterns for w1 device tree bindings
  MAINTAINERS: Add file patterns for x86 device tree bindings
  MAINTAINERS: Add file patterns for xillybus device tree bindings

 MAINTAINERS | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
