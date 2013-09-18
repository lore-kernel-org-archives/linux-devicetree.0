From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/2] move of_find_next_cache_node to DT core
Date: Wed, 18 Sep 2013 11:53:03 +0100
Message-ID: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>

Hi,

The cache bindings are generic and used by many other architectures
apart from PPC. These patches fixes and move the existing definition
of of_find_next_cache_node to DT common code.

Regards,
Sudeep

Sudeep KarkadaNagesha (2):
  powerpc: remove big endianness assumption in of_find_next_cache_node
  of: move definition of of_find_next_cache_node into common code.

 arch/powerpc/include/asm/prom.h |  3 ---
 arch/powerpc/kernel/prom.c      | 31 -------------------------------
 drivers/of/base.c               | 31 +++++++++++++++++++++++++++++++
 include/linux/of.h              |  2 ++
 4 files changed, 33 insertions(+), 34 deletions(-)

-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
