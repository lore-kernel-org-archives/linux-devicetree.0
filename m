From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 0/6] qcom: add OCMEM support
Date: Sun, 16 Jun 2019 09:29:24 -0400
Message-ID: <20190616132930.6942-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc: bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
that is needed in order to support some A3xx and A4xx based GPUs
upstream. This is based on Rob Clark's patch series that he submitted
in October 2015 and I am resubmitting updated patches with his
permission.

This was tested with the GPU on a LG Nexus 5 (hammerhead) phone and
this will work on other msm8974-based systems. For a summary of what
currently works upstream on the Nexus 5, see my status page at
https://masneyb.github.io/nexus-5-upstream/.

Brian Masney (3):
  dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
  dt-bindings: display: msm: gmu: add optional ocmem property
  drm/msm/gpu: add ocmem init/cleanup functions

Rob Clark (3):
  firmware: qcom: scm: add support to restore secure config
  firmware: qcom: scm: add OCMEM lock/unlock interface
  soc: qcom: add OCMEM driver

 .../devicetree/bindings/display/msm/gmu.txt   |   4 +
 .../bindings/soc/qcom/qcom,ocmem.yaml         |  66 +++
 drivers/firmware/qcom_scm-32.c                |  56 +++
 drivers/firmware/qcom_scm-64.c                |  18 +
 drivers/firmware/qcom_scm.c                   |  63 +++
 drivers/firmware/qcom_scm.h                   |  15 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |  33 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h         |   3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |  30 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h         |   3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  41 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  10 +
 drivers/soc/qcom/Kconfig                      |  10 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/ocmem.c                      | 402 ++++++++++++++++++
 drivers/soc/qcom/ocmem.xml.h                  |  86 ++++
 include/linux/qcom_scm.h                      |  28 ++
 include/soc/qcom/ocmem.h                      |  34 ++
 18 files changed, 857 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 drivers/soc/qcom/ocmem.xml.h
 create mode 100644 include/soc/qcom/ocmem.h

-- 
2.20.1
