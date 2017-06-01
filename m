From: Erin Lo <erin.lo@mediatek.com>
Subject: [PATCH 0/3] Add some DT nodes for Mediatek MT2701
Date: Thu, 1 Jun 2017 14:08:41 +0800
Message-ID: <1496297324-21091-1-git-send-email-erin.lo@mediatek.com>
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
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series based on v4.12-rc1, include MT2701 ethernet/disp bls/display function DT nodes.

Sean Wang (1):
  arm: dts: mt2701: Add ethernet device node

YT Shen (2):
  arm: dts: mt2701: Add display bls related nodes for MT2701
  arm: dts: mt2701: Add display subsystem related nodes for MT2701

 arch/arm/boot/dts/mt2701-evb.dts |  29 ++++++++++
 arch/arm/boot/dts/mt2701.dtsi    | 113 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

--
1.9.1
