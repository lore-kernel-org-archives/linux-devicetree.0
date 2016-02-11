From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 2/4] mailbox: mailbox-test: fix the compatible string
Date: Thu, 11 Feb 2016 17:13:26 +0000
Message-ID: <1455210808-29395-3-git-send-email-sudeep.holla@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Underscores are usually forbidden in the compatible strings. So lets
remove it before the first users of this is seen.

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 Documentation/devicetree/bindings/mailbox/sti-mailbox.txt | 2 +-
 drivers/mailbox/mailbox-test.c                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
index b61eec920359..351f612673fc 100644
--- a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
@@ -44,7 +44,7 @@ Optional properties
 Example:
 
 mailbox_test {
-	compatible	= "mailbox_test";
+	compatible	= "mailbox-test";
 	reg		= <0x[shared_memory_address], [shared_memory_size]>;
 	mboxes		= <&mailbox2 0 1>, <&mailbox0 2 1>;
 	mbox-names	= "tx",	"rx";
diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index 3813f6d9eba9..036a852b5fa1 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -342,7 +342,7 @@ static int mbox_test_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mbox_test_match[] = {
-	{ .compatible = "mailbox_test" },
+	{ .compatible = "mailbox-test" },
 	{},
 };
 
-- 
1.9.1
