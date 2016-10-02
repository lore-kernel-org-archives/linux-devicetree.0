From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: [RFC V2 PATCH 05/12] msm8992: defconfig updates to support initrd
Date: Sat,  1 Oct 2016 19:38:32 -0700
Message-ID: <1475375919-618-6-git-send-email-jmcnicol@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de
Cc: jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Given the mimimal hardware support for msm8992 currently enable
a reasonable sized initrd for booting.

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 26dc69a..d8dace3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -21,6 +21,9 @@ CONFIG_CGROUP_HUGETLB=y
 # CONFIG_NET_NS is not set
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=y
+CONFIG_BLK_DEV_RAM_SIZE=16384
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-- 
2.6.1
