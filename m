From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v5 1/7] remoteproc: debugfs: Check of invalid 'count' value
Date: Tue, 12 Jan 2016 12:46:15 +0000
Message-ID: <1452602781-22424-2-git-send-email-lee.jones@linaro.org>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ohad@wizery.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, kernel@stlinux.com, Nathan_Lynch@mentor.com, Lee Jones <lee.jones@linaro.org>, ludovic.barre@st.com, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

If 'count' value is invalid, return early with an error.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 9d30809..f63464c 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -156,8 +156,8 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 	char buf[10];
 	int ret;
 
-	if (count > sizeof(buf))
-		return count;
+	if (count > sizeof(buf) || count <= 0)
+		return -EINVAL;
 
 	ret = copy_from_user(buf, user_buf, count);
 	if (ret)
-- 
1.9.1
