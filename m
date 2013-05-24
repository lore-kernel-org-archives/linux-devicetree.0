From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 0/3] drivers: mfd: Versatile Express SPC support
Date: Fri, 24 May 2013 13:53:03 +0100
Message-ID: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Achin Gupta <achin.gupta-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series introduces support for the Versatile Express Serial
Power Controller (SPC) present in ARM Versatile Express TC2 core tiles.
SPC driver is a fundamental component of TC2 power management and allows
to carry out C-state management and DVFS for A15 and A7 clusters.

First two patches provide changes required by SPC to comply with the
Versatile Express config API, third patch is the SPC driver implementation.

Code extensively exercised through CPUidle and CPUfreq power states and
operating point transitions.

Lorenzo Pieralisi (2):
  drivers: mfd: vexpress: add timeout API to vexpress config interface
  drivers: mfd: vexpress: add Serial Power Controller (SPC) support

Pawel Moll (1):
  drivers: mfd: refactor the vexpress config bridge API

 Documentation/devicetree/bindings/mfd/vexpress-spc.txt |  35 +
 drivers/mfd/Kconfig                                    |   7 +
 drivers/mfd/Makefile                                   |   1 +
 drivers/mfd/vexpress-config.c                          |  87 +-
 drivers/mfd/vexpress-spc.c                             | 626 ++++++++++
 drivers/mfd/vexpress-sysreg.c                          |   2 +-
 include/linux/vexpress.h                               |  82 +-
 7 files changed, 800 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/vexpress-spc.txt
 create mode 100644 drivers/mfd/vexpress-spc.c

-- 
1.8.2.2
