From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/3] of/overlay: Update aliases when added or removed
Date: Tue, 30 Jun 2015 16:51:13 +0200
Message-ID: <1435675876-2159-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi,

Currently the list of aliases is not updated when a DT overlay that adds
an alias is loaded or unloaded. This break drivers (e.g. serial) that
rely on of_alias_get_id(). This RFC patch series fixes that.

This is definitely not a final solution to be applied, as (1) it doesn't
fix all possible cases, and as (2) there's an unresolved issue w.r.t.
object lifetime. More about this in the last patch.

But it's Good Enough For My Use Case(TM), which is enabling/disabling
serial ports on expansion headers by (un)loading DTBOs.

Thanks for your comments!

Geert Uytterhoeven (3):
  [RFC] of: Extract of_alias_create()
  [RFC] of: Add of_alias_destroy()
  [RFC] of/dynamic: Update list of aliases on aliases changes

 drivers/of/base.c    | 72 +++++++++++++++++++++++++++++++++-------------------
 drivers/of/dynamic.c | 24 ++++++++++++++++++
 include/linux/of.h   |  3 +++
 3 files changed, 73 insertions(+), 26 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
