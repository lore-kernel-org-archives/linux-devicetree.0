From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree fixes for 3.7
Date: Thu, 18 Oct 2012 11:02:01 -0500
Message-ID: <508027F9.3060908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DeviceTree fixes for 3.7.

Rob

The following changes since commit ddffeb8c4d0331609ef2581d84de4d763607bd37:

  Linux 3.7-rc1 (2012-10-14 14:41:04 -0700)

are available in the git repository at:

  git://sources.calxeda.com/kernel/linux.git tags/dt-fixes-for-3.7

for you to fetch changes up to 205a8eb7ce713c7f1722297dd97d19dcea6f266c:

  dtc: fix for_each_*() to skip first object if deleted (2012-10-17 15:53:04 -0500)

----------------------------------------------------------------
DeviceTree fixes for 3.7

A handful of fixes:
- a fix for dtc from upstream
- sparse fixes in DeviceTree code
- stub of_get_child_by_name for !OF builds

----------------------------------------------------------------
Kim Phillips (3):
      of/address: sparse fixes
      of/irq: sparse fixes
      of/platform: sparse fix

Olof Johansson (1):
      of: add stub of_get_child_by_name for non-OF builds

Stephen Warren (1):
      dtc: fix for_each_*() to skip first object if deleted

 drivers/of/address.c       |   24 ++++++++++++------------
 drivers/of/irq.c           |    8 +++++---
 drivers/of/platform.c      |    2 +-
 include/linux/of.h         |    7 +++++++
 include/linux/of_address.h |    4 ++--
 include/linux/of_irq.h     |    4 ++--
 scripts/dtc/dtc.h          |   44 ++++++++++----------------------------------
 7 files changed, 39 insertions(+), 54 deletions(-)
