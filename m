From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/2] Add mt6755 basic chip support
Date: Wed, 29 Jun 2016 10:09:31 +0800
Message-ID: <1467166173-9029-1-git-send-email-mars.cheng@mediatek.com>
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
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds basic support for Mediatek's new 8-core chip, mt6755.
Based on 4.7-rc1

Changes in v3:
1. use evb as project suffix
2. add "disable" property for uart dts nodes
3. only alias uart0 as serial0, since we don't enable uart1
4. confirm all acks are added

Mars Cheng (2):
  Document: DT: Add bindings for mediatek MT6755 SoC Platform
  arm64: dts: mediatek: add mt6755 support

Mars Cheng (2):
  Document: DT: Add bindings for mediatek MT6755 SoC Platform
  arm64: dts: mediatek: add mt6755 support

 Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
 .../interrupt-controller/mediatek,sysirq.txt       |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6755-evb.dts        |   38 +++++
 arch/arm64/boot/dts/mediatek/mt6755.dtsi           |  145 ++++++++++++++++++++
 6 files changed, 190 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6755-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6755.dtsi

--
1.7.9.5
