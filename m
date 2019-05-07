From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] of: Add dummy for of_node_is_root if not CONFIG_OF
Date: Mon,  6 May 2019 21:48:01 -0700
Message-ID: <20190507044801.250396-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: linux-rockchip@lists.infradead.org, jwerner@chromium.org, groeck@chromium.org, briannorris@chromium.org, Douglas Anderson <dianders@chromium.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We'll add a dummy to just return false.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 0cf857012f11..62ae5c1cafa5 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -653,6 +653,11 @@ static inline bool of_have_populated_dt(void)
 	return false;
 }
 
+static inline bool of_node_is_root(const struct device_node *node)
+{
+	return false;
+}
+
 static inline struct device_node *of_get_compatible_child(const struct device_node *parent,
 					const char *compatible)
 {
-- 
2.21.0.1020.gf2820cf01a-goog
