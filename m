From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] of: overlay: Fix uninitialized vars in dup_and_fixup_symbol_prop()
Date: Sun, 10 Sep 2017 12:26:04 +0200
Message-ID: <1505039164-25468-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

With gcc 4.1.2:

    drivers/of/overlay.c: In function ‘dup_and_fixup_symbol_prop’:
    drivers/of/overlay.c:108: warning: ‘overlay_name_len’ may be used uninitialized in this function
    drivers/of/overlay.c:100: warning: ‘ovinfo’ may be used uninitialized in this function

Indeed, if ov->count == 0, both variables are uninitialized, which may
lead to a crash when dereferencing ovinfo later.

Currently this is a false positive, as the sole creator of of_overlay
structures (of_build_overlay_info(), introduced in commit
7518b5890d8ac366 ("of/overlay: Introduce DT overlay support") checks for
this.

To prevent future issues, add a check for a zero ov->count to
dup_and_fixup_symbol_prop().  Note that this does not get rid of the
actual compiler warning.

Fixes: d1651b03c2df75db ("of: overlay: add overlay symbols to live device tree")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/of/overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8ecfee31ab6d3874..ebe19e0f8e4d1f4b 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -108,7 +108,7 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
 	int overlay_name_len;
 	int target_path_len;
 
-	if (!prop->value)
+	if (!ov->count || !prop->value)
 		return NULL;
 	symbol_path = prop->value;
 
-- 
2.7.4
