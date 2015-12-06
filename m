From: alchaiken@gmail.com
Subject: [PATCH 0/2] ARM: i.MX6QDL-SabreAuto: assert GPIO hog for imx-weim
Date: Sat,  5 Dec 2015 19:30:55 -0800
Message-ID: <1449372657-18496-1-git-send-email-alison_chaiken@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: frowand.list@gmail.com, shawnguo@kernel.org, alison_chaiken@mentor.com, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Alison Chaiken <alison_chaiken@mentor.com>

The parallel NOR that is attached to the i.MX6-SabreAuto WEIM switch
needs a GPIO asserted at boot in order to probe properly.  Employ the
GPIO hogging mechanism to set the GPIO properly.  Also, add partitions
subnode to NOR device-tree node to make MTD initialization work.

Alison Chaiken (2):
  bus: imx-weim: assert GPIO at boot in order to connect NOR
  ARM: dts: imx6qdl-sabreauto: enable partitions for parallel NOR

 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi |  5 ++++
 drivers/bus/imx-weim.c                   | 45 ++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

-- 
2.6.2
