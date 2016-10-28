From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 3/4] drivers: base: cacheinfo: add pr_fmt logging
Date: Fri, 28 Oct 2016 09:45:30 +0100
Message-ID: <1477644331-25559-4-git-send-email-sudeep.holla@arm.com>
References: <1477644331-25559-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477644331-25559-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, x86@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This cleanup patch just adds pr_fmt style logging for cacheinfo.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 70e13cf06ed0..f19d50bd8925 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -16,6 +16,8 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/acpi.h>
 #include <linux/bitops.h>
 #include <linux/cacheinfo.h>
-- 
2.7.4
