From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] reset: uniphier: UniPhier reset data update for v4.14
Date: Sun,  6 Aug 2017 11:44:00 +0900
Message-ID: <1501987442-2583-1-git-send-email-yamada.masahiro@socionext.com>
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
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

Here are UniPhier SoCs updates for v4.14.

 - Remove old SoC support
 - Remove useless macros



Masahiro Yamada (2):
  reset: uniphier: remove sLD3 SoC support
  reset: uniphier: do not use per-SoC macro for system reset block

 .../devicetree/bindings/reset/uniphier-reset.txt   |  2 -
 drivers/reset/reset-uniphier.c                     | 96 +++++++---------------
 2 files changed, 31 insertions(+), 67 deletions(-)

-- 
2.7.4
