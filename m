From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] drivers/peci: peci_match_id() can be static
Date: Thu, 22 Feb 2018 15:01:11 +0800
Message-ID: <20180222070111.GA22310@lkp-ne02>
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: linux-hwmon@vger.kernel.org, andrew@lunn.ch, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, jdelvare@suse.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kbuild-all@01.org, benh@kernel.crashing.org, linux@roeck-us.net, joel@jms.id.au
List-Id: devicetree@vger.kernel.org


Fixes: 99f5d2b99ecd ("drivers/peci: Add support for PECI bus driver core")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 peci-core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
index d976c73..4709b8c 100644
--- a/drivers/peci/peci-core.c
+++ b/drivers/peci/peci-core.c
@@ -770,8 +770,8 @@ peci_of_match_device(const struct of_device_id *matches,
 }
 #endif
 
-const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
-					   struct peci_client *client)
+static const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
+						  struct peci_client *client)
 {
 	if (!(id && client))
 		return NULL;
