From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] checkpatch: struct of_device_id should usually be const
Date: Wed, 10 Sep 2014 09:15:46 +0200
Message-ID: <1410333346-29062-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b385bcbbf2f5..01f503e0ebbd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4941,6 +4941,7 @@ sub process {
 				mtrr_ops|
 				neigh_ops|
 				nlmsvc_binding|
+				of_device_id|
 				pci_raw_ops|
 				pipe_buf_operations|
 				platform_hibernation_ops|
--=20
2.1.0
