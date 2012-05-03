From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/3] MFD: twl6040: Device tree support
Date: Thu,  3 May 2012 15:54:22 +0300
Message-ID: <1336049665-27777-1-git-send-email-peter.ujfalusi@ti.com>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Misael Lopez Cruz <misael.lopez-l0cyMroinI0@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

The following series adds device tree support for the twl6040 MFD core driver.
Support for the child drivers (vibra, ASoC codec) will be submitted via the
corresponding subsystem since there is no compile time dependency between them.

The first patch is a minor clean up patch to remove wrapped lines in the
twl6040-irq.c. The resulting code is more natural to read to me.

The series depends on the regulator support patch for the twl6040:
http://marc.info/?l=linux-kernel&m=133596703610515&w=2

Regards,
Peter
---
Peter Ujfalusi (3):
  MFD: twl6040: Code cleanup in interrupt initialization part
  MFD: twl6040: Allocate IRQ numbers dynamically
  MFD: twl6040: Support for DT

 Documentation/devicetree/bindings/mfd/twl6040.txt |   51 +++++++++++++++++++++
 drivers/mfd/twl6040-core.c                        |   26 +++++++---
 drivers/mfd/twl6040-irq.c                         |   32 +++++++++----
 3 files changed, 92 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

-- 
1.7.8.6
