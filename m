From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 0/2] ASoC: OMAP4 DMIC,
	McPDM device tree support
Date: Wed, 16 May 2012 14:29:54 +0300
Message-ID: <1337167796-8632-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Tony Lindgren <tony@atomide.com>, peter.ujfalusi@ti.com, alsa-devel@alsa-project.org, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hello,

Add DT support and the binding documentation for OMAP4+ DMIC, and McPDM ASoC dai
drivers.

Changes since v1:
- Ducumentation update: add properties for register address/size, interrupt
  number (as Suggested by Mark and Tony).

I have not added Mark's acked-by since I think the changes are big enough from
v1.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: omap-mcpdm: Add device tree bindings
  ASoC: omap-dmic: Add device tree bindings

 .../devicetree/bindings/sound/omap-dmic.txt        |   21 ++++++++++++++++++++
 .../devicetree/bindings/sound/omap-mcpdm.txt       |   21 ++++++++++++++++++++
 sound/soc/omap/omap-dmic.c                         |    8 +++++++
 sound/soc/omap/omap-mcpdm.c                        |    8 +++++++
 4 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/omap-dmic.txt
 create mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt

-- 
1.7.8.6
