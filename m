From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 8/8] tpm: add legacy sysfs attributes for tpm2
Date: Thu, 13 Jun 2019 11:09:31 -0700
Message-ID: <20190613180931.65445-9-swboyd@chromium.org>
References: <20190613180931.65445-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613180931.65445-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

From: Andrey Pronin <apronin@chromium.org>

Userland scripts and tests rely on certain sysfs attributes
present in the familiar location:
/sys/class/tpm/tpm0/device/enabled
/sys/class/tpm/tpm0/device/owned

This change:
1) Adds two RO properties to sysfs for tpm in TPM2.0 case:
   - owned: set to 1 if storage hierarchy is enabled
     (TPMA_STARTUP_CLEAR.shEnable == 1)
   - enabled: set to 1 if an owner authorizaton is set
     (TPMA_PERMANENT.ownerAuthSet == 1)
2) Makes the sysfs attributes available at the legacy location:
   the attributes are now created under /sys/class/tpm/tpm0/,
   so symlinks are created in /sys/class/tpm/tpm0/device.

Signed-off-by: Andrey Pronin <apronin@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

This probably isn't necessary, but it's sent so if anyone wants to test
out ChromeOS userspace they can easily do so. I believe Jason rejected
this in https://lkml.kernel.org/r/20160715032145.GE9347@obsidianresearch.com/

 drivers/char/tpm/tpm-chip.c  | 4 ++--
 drivers/char/tpm/tpm-sysfs.c | 8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
index 8804c9e916fd..43f99f4c4c8a 100644
--- a/drivers/char/tpm/tpm-chip.c
+++ b/drivers/char/tpm/tpm-chip.c
@@ -492,7 +492,7 @@ static void tpm_del_legacy_sysfs(struct tpm_chip *chip)
 {
 	struct attribute **i;
 
-	if (chip->flags & (TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_VIRTUAL))
+	if (chip->flags & TPM_CHIP_FLAG_VIRTUAL)
 		return;
 
 	sysfs_remove_link(&chip->dev.parent->kobj, "ppi");
@@ -510,7 +510,7 @@ static int tpm_add_legacy_sysfs(struct tpm_chip *chip)
 	struct attribute **i;
 	int rc;
 
-	if (chip->flags & (TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_VIRTUAL))
+	if (chip->flags & TPM_CHIP_FLAG_VIRTUAL)
 		return 0;
 
 	rc = __compat_only_sysfs_link_entry_to_kobj(
diff --git a/drivers/char/tpm/tpm-sysfs.c b/drivers/char/tpm/tpm-sysfs.c
index e9f6f7960023..fe3683f82d48 100644
--- a/drivers/char/tpm/tpm-sysfs.c
+++ b/drivers/char/tpm/tpm-sysfs.c
@@ -413,6 +413,12 @@ TPM2_PROP_FLAG_ATTR(ph_enable_nv,
 TPM2_PROP_FLAG_ATTR(orderly,
 		    TPM2_PT_STARTUP_CLEAR, TPM2_ATTR_ORDERLY);
 
+/* Aliases for userland scripts in TPM2 case */
+TPM2_PROP_FLAG_ATTR(enabled,
+		    TPM2_PT_STARTUP_CLEAR, TPM2_ATTR_SH_ENABLE);
+TPM2_PROP_FLAG_ATTR(owned,
+		    TPM2_PT_PERMANENT, TPM2_ATTR_OWNER_AUTH_SET);
+
 TPM2_PROP_U32_ATTR(lockout_counter, TPM2_PT_LOCKOUT_COUNTER);
 TPM2_PROP_U32_ATTR(max_auth_fail, TPM2_PT_MAX_AUTH_FAIL);
 TPM2_PROP_U32_ATTR(lockout_interval, TPM2_PT_LOCKOUT_INTERVAL);
@@ -431,6 +437,8 @@ static struct attribute *tpm2_dev_attrs[] = {
 	ATTR_FOR_TPM2_PROP(eh_enable),
 	ATTR_FOR_TPM2_PROP(ph_enable_nv),
 	ATTR_FOR_TPM2_PROP(orderly),
+	ATTR_FOR_TPM2_PROP(enabled),
+	ATTR_FOR_TPM2_PROP(owned),
 	ATTR_FOR_TPM2_PROP(lockout_counter),
 	ATTR_FOR_TPM2_PROP(max_auth_fail),
 	ATTR_FOR_TPM2_PROP(lockout_interval),
-- 
Sent by a computer through tubes
