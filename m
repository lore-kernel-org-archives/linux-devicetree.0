From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 1/3] devicetree: bindings: add Zarlink to the vendor prefixes
Date: Tue, 25 Mar 2014 14:41:53 +0100
Message-ID: <1395754915-14534-2-git-send-email-valentin.longchamp@keymile.com>
References: <1395754915-14534-1-git-send-email-valentin.longchamp@keymile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395754915-14534-1-git-send-email-valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Even though the company belongs to Microsemi, many chips are still
labeled as Zarlink. Among them is the family of network clock generators,
the zl3034x.

Signed-off-by: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>

---
Changes in v3: None
Changes in v2:
- add a patch so that the Zarlink vendor prefix is defined

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 40ce2df..4a6eba0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -95,3 +95,4 @@ winbond Winbond Electronics corp.
 wlf	Wolfson Microelectronics
 wm	Wondermedia Technologies, Inc.
 xlnx	Xilinx
+zarlink	Zarlink Semiconductor
-- 
1.8.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
