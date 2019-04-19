From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 6/6] drm/lima: handle shared irq case for
 lima_pp_bcast_irq_handler
Date: Fri, 19 Apr 2019 09:33:01 +0100
Message-ID: <1555662781-22570-7-git-send-email-peter.griffin@linaro.org>
References: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1555662781-22570-1-git-send-email-peter.griffin@linaro.org>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Hikey board all lima ip blocks are shared with one irq.
This patch avoids a NULL ptr deref crash on this platform
on startup. Tested with Weston and kmscube.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_pp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_pp.c
index d29721e..8fef224 100644
--- a/drivers/gpu/drm/lima/lima_pp.c
+++ b/drivers/gpu/drm/lima/lima_pp.c
@@ -64,7 +64,13 @@ static irqreturn_t lima_pp_bcast_irq_handler(int irq, void *data)
 	struct lima_ip *pp_bcast = data;
 	struct lima_device *dev = pp_bcast->dev;
 	struct lima_sched_pipe *pipe = dev->pipe + lima_pipe_pp;
-	struct drm_lima_m450_pp_frame *frame = pipe->current_task->frame;
+	struct drm_lima_m450_pp_frame *frame;
+
+	/* for shared irq case */
+	if (!pipe->current_task)
+		return IRQ_NONE;
+
+	frame = pipe->current_task->frame;
 
 	for (i = 0; i < frame->num_pp; i++) {
 		struct lima_ip *ip = pipe->processor[i];
-- 
2.7.4
