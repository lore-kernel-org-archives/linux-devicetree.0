From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/6] Add HiKey / HI6220 SoC Mali-450 support
Date: Fri, 19 Apr 2019 09:32:55 +0100
Message-ID: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
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
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de, xuwei5@hisilicon.com, mturquette@baylibre.com, sboyd@kernel.org, yuq825@gmail.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi folks,

This series adds support for the Mali450 MP4 GPU found on the
hi6220 SoC from HiSilicon. It has been tested with the
lima drm/mesa driver hosted on freedesktop.org gitlab,
and validated using Weston and kmscube.

As lima drm driver has now been merged this v2 series includes
one extra patch to avoid Oops when all Mali ip blocks share the
same irq.

regards,

Peter.

Changes since v1:
* Additional drm/lima patch to avoid Oops in shared irq case (Peter Griffin)
* Squash clock and reset driver parts to avoid bisection hole (Stephen Boyd)
* Add comment as to what other driver is probing same dt node (Stephen Boyd)
* Check regmap_write error code and return individually (Philipp Zabel)
* Add Rob Herring Reviewed by tags

Peter Griffin (6):
  dt-bindings: gpu: mali-utgard: add hisilicon,hi6220-mali compatible
  dt-bindings: reset: hisilicon: Update compatible documentation
  arm64: dts: hisilicon: Add Mali-450 MP4 GPU DT entry
  reset: hi6220: Add support for AO reset controller
  dt-bindings: reset: hisilicon: Add ao reset controller
  drm/lima: handle shared irq case for lima_pp_bcast_irq_handler

 .../devicetree/bindings/gpu/arm,mali-utgard.txt    |  5 ++
 .../bindings/reset/hisilicon,hi6220-reset.txt      |  1 +
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 38 +++++++++++++
 drivers/clk/hisilicon/clk-hi6220.c                 |  3 +-
 drivers/gpu/drm/lima/lima_pp.c                     |  8 ++-
 drivers/reset/hisilicon/hi6220_reset.c             | 65 +++++++++++++++++++++-
 include/dt-bindings/reset/hisi,hi6220-resets.h     |  7 +++
 7 files changed, 124 insertions(+), 3 deletions(-)

-- 
2.7.4
