From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/2] add ethernet nodes for UniPhier PXs3 SoC
Date: Tue, 27 Mar 2018 19:32:44 +0900
Message-ID: <1522146766-14435-1-git-send-email-hayashi.kunihiko@socionext.com>
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This series adds ethernet nodes for UniPhier PXs3 SoC and the board,
and adds pinctrl groups for second ethernet instances because PXs3 has two
ethernet instances.

Kunihiko Hayashi (2):
  ARM: dts: uniphier: add pinctrl groups of ethernet for second instance
  arm64: dts: uniphier: add ethernet node for PXs3

 arch/arm/boot/dts/uniphier-pinctrl.dtsi            | 10 ++++++
 .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts | 22 +++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   | 36 ++++++++++++++++++++++
 3 files changed, 68 insertions(+)

-- 
2.7.4
