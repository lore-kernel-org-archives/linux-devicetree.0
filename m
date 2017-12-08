From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH] dt-bindings: pinctrl: stm32: fix copyright and adopt SPDX identifier
Date: Fri, 8 Dec 2017 16:53:11 +0100
Message-ID: <1512748391-22004-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add missing copyright and add SPDX identifier.

Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>

diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index b8dfe31..b5a2174 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -1,3 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Torgue Alexandre <alexandre.torgue-qxv4g6HH51o@public.gmane.org> for STMicroelectronics.
+ */
+
 #ifndef _DT_BINDINGS_STM32_PINFUNC_H
 #define _DT_BINDINGS_STM32_PINFUNC_H
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
