From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] of: overlay: Crash fix and improvement
Date: Fri,  8 Dec 2017 14:13:01 +0100
Message-ID: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Pantelis, Rob, Frank,

This patch series fixes memory corruption when applying overlays.

I first noticed this when using OF configfs.  After lots of failed
debugging attempts, I bisected it to "of: overlay: add per overlay sysfs
attributes", which is not upstream.  But that was a red herring: that
commit enlarged struct fragment to exactly 64-bytes, which just made it
more likely to cause random corruption when writing beyond the end of an
array of fragment structures.  With the smaller structure size before,
such writes usually ended up in the unused holes between allocated
blocks, causing no harm.

The first patch is the real fix, and applies to both v4.15-rc2 and Rob's
for-next branch.
The second patch is a small improvement, and applies to Rob's for-next
branch only.

I've updated my topic/overlays and topic/renesas-overlays branches at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
accordingly.

Thanks!

Geert Uytterhoeven (2):
  of: overlay: Fix out-of-bounds write in init_overlay_changeset()
  of: overlay: Make node skipping in init_overlay_changeset() clearer

 drivers/of/overlay.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
