From: Hans Ole Hatzel <hohatzel@jusst.de>
Subject: [PATCH 0/4] imx7 sbc board support extensions
Date: Tue,  4 Dec 2018 12:07:37 +0100
Message-ID: <20181204110741.6943-1-hohatzel@jusst.de>
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
To: linux-arm-kernel@lists.infradead.org, ilya@compulab.co.il, devicetree@vger.kernel.org, linux-imx@nxp.com, fabio.estevam@nxp.com, shawnguo@kernel.org
Cc: Hans Ole Hatzel <hohatzel@jusst.de>
List-Id: devicetree@vger.kernel.org

The following patch series contains a number of extensions and fixes to
the board support for the imx7 sbc.

Hans Ole Hatzel (4):
  ARM: dts: imx7d: cl-som-imx7: fix pinctrl for i2c2
  ARM: dts: imx7d: cl-som-imx7: WiLink8 WLAN support
  ARM: dts: imx7d: sbc imx7: add uart2
  ARM: dts: imx7d: sbc imx7: add uart5

 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 100 +++++++++++++++++++++++-
 arch/arm/boot/dts/imx7d-sbc-imx7.dts    |   8 ++
 2 files changed, 106 insertions(+), 2 deletions(-)

-- 
2.19.2
