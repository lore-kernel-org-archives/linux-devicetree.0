From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] of/platform: Add missing const qualifier in of_link_property
Date: Wed, 31 Jul 2019 11:17:34 -0700
Message-ID: <20190731181733.60422-1-natechancellor@gmail.com>
References: <20190729221101.228240-4-saravanak@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729221101.228240-4-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: saravanak@google.com
Cc: collinsd@codeaurora.org, corbet@lwn.net, devicetree@vger.kernel.org, frowand.list@gmail.com, gregkh@linuxfoundation.org, kernel-team@android.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, rafael@kernel.org, robh+dt@kernel.org, Nathan Chancellor <natechancellor@gmail.com>, kbuild test robot <lkp@intel.com>
List-Id: devicetree@vger.kernel.org

Clang errors:

drivers/of/platform.c:632:28: error: initializing 'struct
supplier_bindings *' with an expression of type 'const struct
supplier_bindings [4]' discards qualifiers
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
        struct supplier_bindings *s = bindings;
                                  ^   ~~~~~~~~
1 error generated.

Fixes: 05f812549f53 ("of/platform: Add functional dependency link from DT bindings")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Given this is still in the driver-core-testing branch, I am fine with
this being squashed in if desired.

 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index e2da90e53edb..21838226d68a 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -629,7 +629,7 @@ static bool of_link_property(struct device *dev, struct device_node *con_np,
 			     const char *prop)
 {
 	struct device_node *phandle;
-	struct supplier_bindings *s = bindings;
+	const struct supplier_bindings *s = bindings;
 	unsigned int i = 0;
 	bool done = true, matched = false;
 
-- 
2.22.0
