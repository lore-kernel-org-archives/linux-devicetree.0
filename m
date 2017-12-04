From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] of: overlay: Fix of_overlay_apply() error path
Date: Mon,  4 Dec 2017 16:47:34 +0100
Message-ID: <1512402456-8176-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Pantelis, Rob, Frank,

Here's a replacement for commit bd80e2555c5c9d45 ("of: overlay: Fix
cleanup order in of_overlay_apply()"), which was applied by Rob, and
dropped later.

The first patch fixes the memory leak reported by Colin.
The second patch is a replacement for the bad dropped commit, and
depends on the first patch for proper cleanup.

All OF unittests pass.

Thanks!

Geert Uytterhoeven (2):
  of: overlay: Fix memory leak in of_overlay_apply() error path
  of: overlay: Fix cleanup order in of_overlay_apply()

 drivers/of/overlay.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
