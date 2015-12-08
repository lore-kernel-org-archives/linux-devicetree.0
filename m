From: Alison Chaiken <alison_chaiken@mentor.com>
Subject: [PATCH v2 0/2] ARM: dts: imx6qdl-sabreauto: employ GPIO init-val for
 p-NOR
Date: Tue, 8 Dec 2015 15:48:38 -0800
Message-ID: <1449618520-3432-1-git-send-email-alison_chaiken@mentor.com>
References: <20151207082440.GY11966@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20151207082440.GY11966@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, alison@she-devel.com, rowand.list@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org, alison_chaiken@mentor.com
List-Id: devicetree@vger.kernel.org

The parallel NOR that is attached to the i.MX6-SabreAuto WEIM switch
needs a GPIO asserted at boot in order to probe properly.  Employ the
GPIO init-val mechanism to set the GPIO.  Also, add partitions subnode
to NOR device-tree node to make MTD initialization work.

Alison Chaiken (2):
  ARM: dts: imx6qdl-sabreauto: assert GPIO at boot in order to connect
    NOR
  ARM: dts: imx6qdl-sabreauto: enable partitions for parallel NOR

 arch/arm/boot/dts/imx6qdl-sabreauto-eim-nor.dtsi | 43 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi         |  4 +++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6qdl-sabreauto-eim-nor.dtsi

-- 
2.6.2
