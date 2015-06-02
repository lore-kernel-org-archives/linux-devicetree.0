From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] Make CONFIG_OF user selectable
Date: Tue,  2 Jun 2015 17:46:41 -0500
Message-ID: <1433285204-4307-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are a couple of reasons we'd like to have CONFIG_OF be user 
visible and enabled. The first is DT overlays can be used on 
architectures regardless of whether they use DT for booting. One example 
is running DT unittests on x86. The second is simply to expand the 
compile coverage of the DT code. This change enables building DT code on 
x86 allyesconfig and allmodconfig.

Rob

Rob Herring (3):
  MIPS: prepare for user enabling of CONFIG_OF
  of: make CONFIG_OF user selectable
  of: make unittest select OF_EARLY_FLATTREE instead of depend on it

 arch/mips/include/asm/prom.h |  2 +-
 arch/mips/kernel/prom.c      |  1 +
 drivers/of/Kconfig           | 12 ++++++------
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
