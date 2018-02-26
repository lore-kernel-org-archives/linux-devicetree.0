From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] dt-bindings: arm: Improve Renesas Board Documentation
Date: Mon, 26 Feb 2018 19:03:41 +0100
Message-ID: <1519668225-12548-1-git-send-email-geert+renesas@glider.be>
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
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

This patch series improves the DT binding documentation for Renesas
boards.

Thanks!

Geert Uytterhoeven (4):
  dt-bindings: arm: Document SoC compatible value for Armadillo-800 EVA
  dt-bindings: arm: Document Renesas V3MSK and Wheat board part numbers
  dt-bindings: arm: Document Renesas R-Car M3-N-based Salvator-X board
  dt-bindings: arm: Document Renesas R-Car M3-N-based Salvator-XS board

 Documentation/devicetree/bindings/arm/shmobile.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
