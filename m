From: Rob Herring <robh@kernel.org>
Subject: [RFC PATCH] of: Add a GitLab CI config file for unittests
Date: Fri, 30 Nov 2018 14:32:32 -0600
Message-ID: <20181130203232.5743-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: devicetree@vger.kernel.org

This adds a GitLab CI config file running the DT unittest in a usermode
Linux build. The corresponding CI job can be found here:

https://gitlab.com/robherring/linux-dt-unittest/pipelines

This CI job can be duplicated by others by creating a kernel repo on a
GitLab instance and configuring GitLab CI to use
drivers/of/.gitlab-ci.yml config file.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/.gitlab-ci.yml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 drivers/of/.gitlab-ci.yml

diff --git a/drivers/of/.gitlab-ci.yml b/drivers/of/.gitlab-ci.yml
new file mode 100644
index 000000000000..44a4824f5c33
--- /dev/null
+++ b/drivers/of/.gitlab-ci.yml
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+image: registry.gitlab.com/robherring/docker-images/ubuntu-kernel-build
+
+variables:
+  ARCH: um
+
+job-unittest:
+  artifacts:
+    paths:
+      - "*.log"
+
+  script:
+    - echo -e "CONFIG_OF=y\nCONFIG_OF_UNITTEST=y\nCONFIG_OF_OVERLAY=y" > kernel/configs/extra.config
+    - make defconfig extra.config
+    - make -s -j $(nproc) vmlinux | tee build.log
+    - TMP=/tmp ./vmlinux > boot.log || true
+    - grep -E '\#\#\# dt-test \#\#\# end of unittest - [0-9]* passed, 0 failed' boot.log
-- 
2.19.1
