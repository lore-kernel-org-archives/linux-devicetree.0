From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/2] Fixes for bbb-overlays
Date: Tue, 17 Nov 2015 13:43:58 +0100
Message-ID: <1447764240-10709-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

	Hi Pantelis,

Now HCH's configfs cleanups have entered v4.4-rc1, I had to upgrade to a
newer version of your overlay series.

The following 2 patches:
  - Kill a compiler warning on 64-bit (yes, using overlays on arm64 ;-),
  - Fix an ugly "allocation failure" backtrace when reading empty binary
    attributes.

I sent earlier versions of these before, but they had to be rebased to
adapt to changes in your bbb-overlays branch.

Geert Uytterhoeven (2):
  of/configfs: Use %zu to format size_t
  configfs: Fix reading empty binary attributes

 drivers/of/configfs.c | 2 +-
 fs/configfs/file.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1

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
