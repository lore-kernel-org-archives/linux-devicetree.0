From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [bbb-overlays] Fixing overlay configfs for v4.14
Date: Tue, 21 Nov 2017 21:24:40 +0100
Message-ID: <1511295880-24987-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi Pantelis,

Using overlay configfs on v4.14 requires two fixes, both due to commit
d1651b03c2df75db ("of: overlay: add overlay symbols to live device
tree"):

 1. As the symbols were added to the ovinfo[] array without calling
    of_fill_overlay_info(), the new of_overlay_info.info field (added by
    your bbb-overlays patches) is not set up, causing a NULL pointer
    dereference.

    As calling of_fill_overlay_info() is not appropriate here, the patch
    below fixes this by filling it in manually.  Feel free to fold into
    "of: overlay: add per overlay sysfs attributes".

 2. "of: overlay: Pick up label symbols from overlays." must be
    reverted, else loading overlays fails with:

	OF: changeset: add_property failed @/__symbols__/...
	OF: Error applying changeset (-17)

I've updated my topic/overlays and topic/renesas-overlays branches in
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
accordingly.

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index afa681014e19e3da..3cb6ae9ecb998d5e 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -569,6 +569,7 @@ static int of_build_overlay_info(struct of_overlay *ov,
 	if (node) {
 		ovinfo[cnt].overlay = node;
 		ovinfo[cnt].target = of_find_node_by_path("/__symbols__");
+		ovinfo[cnt].info = of_node_get(node);
 		ovinfo[cnt].is_symbols_node = 1;
 
 		if (!ovinfo[cnt].target) {

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
