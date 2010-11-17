From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] Enable OF drivers for non-PPC
Date: Wed, 17 Nov 2010 17:50:21 -0600
Message-ID: <1290037824-24978-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Grant,

Here is updated patch series incorporating your feedback.

I dropped the sja1000 and isp1760 drivers. They already have platform driver
variants and need a more complicated merge that I wouldn't test.

I found another implicit include needing fixing in of_serial as well.

This is now compile tested on ARM and sparc. (BTW, allmodconfig was already
pretty broken on sparc). ipmi was run on ARM as well.

Regards,
Rob

Rob Herring (3):
  ipmi: convert OF driver to platform driver
  of_serial: explicitly include of_irq.h
  OF: make drivers depend on CONFIG_OF instead of CONFIG_PPC_OF

 drivers/char/ipmi/ipmi_si_intf.c |   50 +++++++++++++++++++++----------------
 drivers/mmc/host/Kconfig         |    4 ++-
 drivers/mtd/Kconfig              |    2 +-
 drivers/mtd/maps/Kconfig         |    2 +-
 drivers/serial/Kconfig           |    2 +-
 drivers/serial/of_serial.c       |    1 +
 6 files changed, 35 insertions(+), 26 deletions(-)
