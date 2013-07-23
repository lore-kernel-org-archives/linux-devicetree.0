From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v8 15/28] bus: mvebu-mbus: Update main description
Date: Tue, 23 Jul 2013 10:31:19 -0300
Message-ID: <1374586292-4941-16-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374586292-4941-1-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, valentin.longchamp@keymile.com, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, gerlando.falauto@keymile.com, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

After replacing the MBus name-based by the new ID-based API
let's fix the general description of the driver at the beginning
of the file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/bus/mvebu-mbus.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index c182ef5..26af145 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -35,13 +35,9 @@
  *
  * - Provides an API for platform code or device drivers to
  *   dynamically add or remove address decoding windows for the CPU ->
- *   device accesses. This API is mvebu_mbus_add_window(),
- *   mvebu_mbus_add_window_remap_flags() and
- *   mvebu_mbus_del_window(). Since the (target, attribute) values
- *   differ from one SoC family to another, the API uses a 'const char
- *   *' string to identify devices, and this driver is responsible for
- *   knowing the mapping between the name of a device and its
- *   corresponding (target, attribute) in the current SoC family.
+ *   device accesses. This API is mvebu_mbus_add_window_by_id(),
+ *   mvebu_mbus_add_window_remap_by_id() and
+ *   mvebu_mbus_del_window().
  *
  * - Provides a debugfs interface in /sys/kernel/debug/mvebu-mbus/ to
  *   see the list of CPU -> SDRAM windows and their configuration
-- 
1.8.1.5
