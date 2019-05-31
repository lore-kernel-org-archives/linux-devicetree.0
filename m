From: Alex Elder <elder@linaro.org>
Subject: [PATCH v2 00/17] net: introduce Qualcomm IPA driver
Date: Thu, 30 May 2019 22:53:31 -0500
Message-ID: <20190531035348.7194-1-elder@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, arnd@arndb.de, bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org
Cc: evgreen@chromium.org, benchan@google.com, ejcaruso@google.com, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series presents the driver for the Qualcomm IP Accelerator (IPA).

This is version 2 of the series.  This version has addressed almost
all of the feedback received in the first version:
  https://lore.kernel.org/lkml/20190512012508.10608-1-elder@linaro.org/
More detail is included in the individual patches, but here is a
high-level summary of what's changed since then:
  - Two spinlocks have been removed.
      - The code for enabling and disabling endpoint interrupts has
        been simplified considerably, and the spinlock is no longer
	required
      - A spinlock used when updating ring buffer pointers is no
        longer needed.  Integers indexing the ring are used instead
	(and they don't even have to be atomic).
  - One spinlock remains to protect list updates, but it is always
    acquired using spin_lock_bh() (no more irqsave).
  - Information about the queueing and completion of messages is now
    supplied to the network stack in batches rather than one at a
    time.
  - I/O completion handling has been simplified, with the IRQ
    handler now consisting mainly of disabling the interrupt and
    calling napi_schedule().
  - Some comments have been updated and improved througout.

What follows is the introduction supplied with v1 of the series.

-----

The IPA is a component present in some Qualcomm SoCs that allows
network functions such as aggregation, filtering, routing, and NAT
to be performed without active involvement of the main application
processor (AP).

Initially, these advanced features are disabled; the IPA driver
simply provides a network interface that makes the modem's LTE
network available to the AP.  In addition, only support for the
IPA found in the Qualcomm SDM845 SoC is provided.

This code is derived from a driver developed internally by Qualcomm.
A version of the original source can be seen here:
  https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree
in the "drivers/platform/msm/ipa" directory.  Many were involved in
developing this, but the following individuals deserve explicit
acknowledgement for their substantial contributions:

    Abhishek Choubey
    Ady Abraham
    Chaitanya Pratapa
    David Arinzon
    Ghanim Fodi
    Gidon Studinski
    Ravi Gummadidala
    Shihuan Liu
    Skylar Chang

A version of this code was posted in November 2018 as an RFC.
  https://lore.kernel.org/lkml/20181107003250.5832-1-elder@linaro.org/
All feedback received was addressed.  The code has undergone
considerable further rework since that time, and most of the
"future work" described then has now been completed.

This code is available in buildable form here, based on kernel
v5.2-rc1:
  remote: ssh://git@git.linaro.org/people/alex.elder/linux.git
  branch: ipa-v2_kernel-v5.2-rc2
    75adf2ac1266 arm64: defconfig: enable build of IPA code

The branch depends on a commit now found in in net-next.  It has
been cherry-picked, and (in this branch) has this commit ID:
  13c627b5a078 net: qualcomm: rmnet: Move common struct definitions to include
by 

					-Alex

Alex Elder (17):
  bitfield.h: add FIELD_MAX() and field_max()
  dt-bindings: soc: qcom: add IPA bindings
  soc: qcom: ipa: main code
  soc: qcom: ipa: configuration data
  soc: qcom: ipa: clocking, interrupts, and memory
  soc: qcom: ipa: GSI headers
  soc: qcom: ipa: the generic software interface
  soc: qcom: ipa: GSI transactions
  soc: qcom: ipa: IPA interface to GSI
  soc: qcom: ipa: IPA endpoints
  soc: qcom: ipa: immediate commands
  soc: qcom: ipa: IPA network device and microcontroller
  soc: qcom: ipa: AP/modem communications
  soc: qcom: ipa: support build of IPA code
  MAINTAINERS: add entry for the Qualcomm IPA driver
  arm64: dts: sdm845: add IPA information
  arm64: defconfig: enable build of IPA code

 .../devicetree/bindings/net/qcom,ipa.yaml     |  180 ++
 MAINTAINERS                                   |    6 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   51 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/net/Kconfig                           |    2 +
 drivers/net/Makefile                          |    1 +
 drivers/net/ipa/Kconfig                       |   16 +
 drivers/net/ipa/Makefile                      |    7 +
 drivers/net/ipa/gsi.c                         | 1635 +++++++++++++++++
 drivers/net/ipa/gsi.h                         |  246 +++
 drivers/net/ipa/gsi_private.h                 |  148 ++
 drivers/net/ipa/gsi_reg.h                     |  376 ++++
 drivers/net/ipa/gsi_trans.c                   |  624 +++++++
 drivers/net/ipa/gsi_trans.h                   |  116 ++
 drivers/net/ipa/ipa.h                         |  131 ++
 drivers/net/ipa/ipa_clock.c                   |  297 +++
 drivers/net/ipa/ipa_clock.h                   |   52 +
 drivers/net/ipa/ipa_cmd.c                     |  377 ++++
 drivers/net/ipa/ipa_cmd.h                     |  116 ++
 drivers/net/ipa/ipa_data-sdm845.c             |  245 +++
 drivers/net/ipa/ipa_data.h                    |  267 +++
 drivers/net/ipa/ipa_endpoint.c                | 1283 +++++++++++++
 drivers/net/ipa/ipa_endpoint.h                |   97 +
 drivers/net/ipa/ipa_gsi.c                     |   48 +
 drivers/net/ipa/ipa_gsi.h                     |   49 +
 drivers/net/ipa/ipa_interrupt.c               |  279 +++
 drivers/net/ipa/ipa_interrupt.h               |   53 +
 drivers/net/ipa/ipa_main.c                    |  921 ++++++++++
 drivers/net/ipa/ipa_mem.c                     |  234 +++
 drivers/net/ipa/ipa_mem.h                     |   83 +
 drivers/net/ipa/ipa_netdev.c                  |  251 +++
 drivers/net/ipa/ipa_netdev.h                  |   24 +
 drivers/net/ipa/ipa_qmi.c                     |  402 ++++
 drivers/net/ipa/ipa_qmi.h                     |   35 +
 drivers/net/ipa/ipa_qmi_msg.c                 |  583 ++++++
 drivers/net/ipa/ipa_qmi_msg.h                 |  238 +++
 drivers/net/ipa/ipa_reg.h                     |  279 +++
 drivers/net/ipa/ipa_smp2p.c                   |  304 +++
 drivers/net/ipa/ipa_smp2p.h                   |   47 +
 drivers/net/ipa/ipa_uc.c                      |  208 +++
 drivers/net/ipa/ipa_uc.h                      |   32 +
 include/linux/bitfield.h                      |   14 +
 42 files changed, 10358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ipa.yaml
 create mode 100644 drivers/net/ipa/Kconfig
 create mode 100644 drivers/net/ipa/Makefile
 create mode 100644 drivers/net/ipa/gsi.c
 create mode 100644 drivers/net/ipa/gsi.h
 create mode 100644 drivers/net/ipa/gsi_private.h
 create mode 100644 drivers/net/ipa/gsi_reg.h
 create mode 100644 drivers/net/ipa/gsi_trans.c
 create mode 100644 drivers/net/ipa/gsi_trans.h
 create mode 100644 drivers/net/ipa/ipa.h
 create mode 100644 drivers/net/ipa/ipa_clock.c
 create mode 100644 drivers/net/ipa/ipa_clock.h
 create mode 100644 drivers/net/ipa/ipa_cmd.c
 create mode 100644 drivers/net/ipa/ipa_cmd.h
 create mode 100644 drivers/net/ipa/ipa_data-sdm845.c
 create mode 100644 drivers/net/ipa/ipa_data.h
 create mode 100644 drivers/net/ipa/ipa_endpoint.c
 create mode 100644 drivers/net/ipa/ipa_endpoint.h
 create mode 100644 drivers/net/ipa/ipa_gsi.c
 create mode 100644 drivers/net/ipa/ipa_gsi.h
 create mode 100644 drivers/net/ipa/ipa_interrupt.c
 create mode 100644 drivers/net/ipa/ipa_interrupt.h
 create mode 100644 drivers/net/ipa/ipa_main.c
 create mode 100644 drivers/net/ipa/ipa_mem.c
 create mode 100644 drivers/net/ipa/ipa_mem.h
 create mode 100644 drivers/net/ipa/ipa_netdev.c
 create mode 100644 drivers/net/ipa/ipa_netdev.h
 create mode 100644 drivers/net/ipa/ipa_qmi.c
 create mode 100644 drivers/net/ipa/ipa_qmi.h
 create mode 100644 drivers/net/ipa/ipa_qmi_msg.c
 create mode 100644 drivers/net/ipa/ipa_qmi_msg.h
 create mode 100644 drivers/net/ipa/ipa_reg.h
 create mode 100644 drivers/net/ipa/ipa_smp2p.c
 create mode 100644 drivers/net/ipa/ipa_smp2p.h
 create mode 100644 drivers/net/ipa/ipa_uc.c
 create mode 100644 drivers/net/ipa/ipa_uc.h

-- 
2.20.1
