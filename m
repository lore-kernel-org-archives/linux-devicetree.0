From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] driver core: Disable late probes by default
Date: Mon, 19 Oct 2015 17:13:22 +0200
Message-ID: <1445267602-12576-1-git-send-email-tomeu.vizoso@collabora.com>
References: <20151016181129.GA1764@gradator.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151016181129.GA1764@gradator.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

To smooth the transition to late probes, make disabled the default for
DELAY_DEVICE_PROBES and let individual SoCs enable the option as they
get fixed.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Link: https://lkml.kernel.org/g/20151016181129.GA1764@gradator.net

---

Hi Rob,

I'm sending this in case you think it would be best to leave the
on-demand probe series in -next for now but have late probes disabled to
avoid hassle to some people.

Regards,

Tomeu
---
 drivers/base/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index b449b17055c9..17e711a725e3 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -326,7 +326,7 @@ endif
 
 config DELAY_DEVICE_PROBES
 	bool "Allow delaying the probe of some devices" if EXPERT
-	default y
+	default n
 	help
 	  Devices can be matched to a driver and probed from the moment they
 	  are registered, but early during boot their probes are likely to be
@@ -340,6 +340,6 @@ config DELAY_DEVICE_PROBES
 	  In some platforms there may be implicit assumptions about when some
 	  devices are probed, so enabling this option could cause problems there.
 
-	  If unsure, say Y here.
+	  If unsure, say N here.
 
 endmenu
-- 
2.5.0
