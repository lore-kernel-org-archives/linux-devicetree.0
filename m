From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/5] Qualcomm remote filesystem shared memory driver
Date: Wed,  4 Oct 2017 20:32:53 -0700
Message-ID: <20171005033258.12825-1-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, David Brown <david.brown@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@chromium.org>, Rob Herring <robh+dt@kernel.org>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some remote processors (in particular the modem) found in Qualcomm platforms
stores configuration parameters and other data in a file system. As the remotes
does not have direct storage access it needs to relay block accesses through a
service running on the application CPU.

The memory is described in DeviceTree by a new reserved-memory compatible and
the implementation provides the user space service a read/write interface to
this chunk of memory.

Bjorn Andersson (5):
  of/platform: Generalize /reserved-memory handling
  of: reserved_mem: Accessor for acquiring reserved_mem
  dt-binding: soc: qcom: Add binding for rmtfs memory
  soc: qcom: Remote filesystem memory driver
  arm64: dts: msm8916: Mark rmtfs node as qcom,rmtfs-mem compatible

 .../bindings/reserved-memory/qcom,rmtfs-mem.txt    |  51 ++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   3 +
 drivers/of/of_reserved_mem.c                       |  26 ++
 drivers/of/platform.c                              |  19 +-
 drivers/soc/qcom/Kconfig                           |  11 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/rmtfs_mem.c                       | 272 +++++++++++++++++++++
 include/linux/of_reserved_mem.h                    |   5 +
 8 files changed, 380 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.txt
 create mode 100644 drivers/soc/qcom/rmtfs_mem.c

-- 
2.12.0
