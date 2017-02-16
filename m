From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 16/36] UAPI: Add media UAPI Kbuild file
Date: Wed, 15 Feb 2017 18:19:18 -0800
Message-ID: <1487211578-11360-17-git-send-email-steve_longerbeam@mentor.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add an empty UAPI Kbuild file for media UAPI headers.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
---
 include/uapi/Kbuild       | 1 +
 include/uapi/media/Kbuild | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 include/uapi/media/Kbuild

diff --git a/include/uapi/Kbuild b/include/uapi/Kbuild
index 245aa6e..9a51957 100644
--- a/include/uapi/Kbuild
+++ b/include/uapi/Kbuild
@@ -6,6 +6,7 @@
 header-y += asm-generic/
 header-y += linux/
 header-y += sound/
+header-y += media/
 header-y += mtd/
 header-y += rdma/
 header-y += video/
diff --git a/include/uapi/media/Kbuild b/include/uapi/media/Kbuild
new file mode 100644
index 0000000..aafaa5a
--- /dev/null
+++ b/include/uapi/media/Kbuild
@@ -0,0 +1 @@
+# UAPI Header export list
-- 
2.7.4
