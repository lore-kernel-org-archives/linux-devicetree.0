From: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Subject: [PATCH 0/2] mfd: add Ricoh RC5T619 PMIC support
Date: Sat,  5 Nov 2016 17:19:23 +0100
Message-ID: <20161105161925.14910-1-phh@phh.me>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds RC5T619 support. This PMIC is used on many
rockchip-based devices, for instance the GPD XD, or the Archos 101 Oxygen

---
 Documentation/devicetree/bindings/mfd/rn5t618.txt |   16 +++--
 drivers/mfd/Kconfig                               |    3 -
 drivers/mfd/rn5t618.c                             |    1 
 drivers/regulator/Kconfig                         |    4 -
 drivers/regulator/rn5t618-regulator.c             |   35 ++++++++++--
 include/linux/mfd/rn5t618.h                       |   15 +++++
 6 files changed, 61 insertions(+), 13 deletions(-)


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
