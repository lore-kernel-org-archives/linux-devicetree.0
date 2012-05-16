From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 0/4] MFD: twl6040: Device tree support
Date: Wed, 16 May 2012 14:11:54 +0300
Message-ID: <1337166718-8458-1-git-send-email-peter.ujfalusi@ti.com>
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
Cc: Dmitry Torokhov <dtor-JGs/UdohzUI@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, Misael Lopez Cruz <misael.lopez-l0cyMroinI0@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Changes since v2:
- Child devices are no longer described in dts, they are created with
  mfd_add_devices()
- ASoC codec device is created unconditionally (main function of twl6040)

Changes since v1:
- Commit message for patch 2 (Allocate IRQ numbers dynamically) has been updated
  to describe that the twl6040 can not be used as IRQ extender type of device.

Commit message from v1:

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
Peter Ujfalusi (4):
  MFD: twl6040: Code cleanup in interrupt initialization part
  MFD: twl6040: Allocate IRQ numbers dynamically
  MFD: twl6040: Register the child for the ASoC codec unconditionally
  MFD: twl6040: Add support for Device Tree

 Documentation/devicetree/bindings/mfd/twl6040.txt |   62 ++++++++++++++++++
 drivers/mfd/twl6040-core.c                        |   69 ++++++++++++---------
 drivers/mfd/twl6040-irq.c                         |   32 +++++++---
 3 files changed, 124 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

-- 
1.7.8.6
