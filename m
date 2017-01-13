From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/6] Add some DT nodes for Mediatek MT2701
Date: Fri, 13 Jan 2017 16:42:52 +0800
Message-ID: <1484296978-18572-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series based on v4.10-rc2, include MT2701 spi/iommu/nand/auxadc/ethernet/thermal controller DT nodes.

Dependent on "Add clock and power domain DT nodes for Mediatek MT2701"[1].

Change in v2:
1. Add spi/auxadc pin setting
2. Add ethernet node and pin setting
3. Add thermal controller node

[1] http://lists.infradead.org/pipermail/linux-mediatek/2016-December/007637.html

Dawei Chien (1):
  arm: dts: mt2701: Add thermal device node.

Honghui Zhang (1):
  arm: dts: mt2701: Add iommu/smi device node

Leilk Liu (1):
  arm: dts: mt2701: Add spi device node

Sean Wang (1):
  arm: dts: mt2701: Add ethernet device node.

Xiaolei Li (1):
  arm: dts: mt2701: Add nand device node

Zhiyong Tao (1):
  arm: dts: mt2701: Add auxadc device node.

 arch/arm/boot/dts/mt2701-evb.dts |  94 +++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi    | 189 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 283 insertions(+)

--
1.9.1
