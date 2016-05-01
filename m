From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V4 0/2] vfio, platform: add ACPI support
Date: Sun,  1 May 2016 17:07:50 -0400
Message-ID: <1462136872-17590-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org
Cc: shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, vinod.koul@intel.com, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The patchset makes three different changes.
1. Add support for probing ACPI platform devices.
2. Add support for ACPI _RST method support during reset
3. Make reset driver a requirement by default with an optional
   kernel command line override

Sinan Kaya (2):
  vfio, platform: add support for ACPI during probe and reset
  vfio, platform: make reset driver a requirement by default

 drivers/vfio/platform/vfio_amba.c             |   5 +
 drivers/vfio/platform/vfio_platform.c         |   5 +
 drivers/vfio/platform/vfio_platform_common.c  | 184 +++++++++++++++++++++-----
 drivers/vfio/platform/vfio_platform_private.h |   8 +-
 4 files changed, 165 insertions(+), 37 deletions(-)

-- 
1.8.2.1
