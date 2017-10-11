From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/5] Qualcomm remote filesystem shared memory driver
Date: Tue, 10 Oct 2017 22:08:52 -0700
Message-ID: <20171011050857.7588-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
 drivers/soc/qcom/rmtfs_mem.c                       | 271 +++++++++++++++++++++
 include/linux/of_reserved_mem.h                    |   5 +
 8 files changed, 379 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.txt
 create mode 100644 drivers/soc/qcom/rmtfs_mem.c

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
