From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/5] Qualcomm remote filesystem shared memory driver
Date: Wed,  2 Aug 2017 19:57:49 -0700
Message-ID: <20170803025754.19101-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
  dt-binding: soc: qcom: Add binding for RFSA
  soc: qcom: Remote FS memory driver
  arm64: dts: msm8916: Mark rmtfs node as qcom,rfsa compatible

 .../bindings/reserved-memory/qcom,rfsa.txt         |  44 ++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   3 +
 drivers/of/of_reserved_mem.c                       |  26 ++
 drivers/of/platform.c                              |  22 +-
 drivers/soc/qcom/Kconfig                           |   8 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/rfsa.c                            | 262 +++++++++++++++++++++
 include/linux/of_reserved_mem.h                    |   5 +
 8 files changed, 365 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,rfsa.txt
 create mode 100644 drivers/soc/qcom/rfsa.c

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
