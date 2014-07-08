From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: [PATCH 0/3] Support for Qualcomm QPNP PMIC's
Date: Tue,  8 Jul 2014 18:54:26 +0300
Message-ID: <1404834869-23049-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Josh Cartwright <joshc@codeaurora.org>, Stanimir Varbanov <svarbanov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

Hello to all,

Here is patch set which adds Qualcomm QPNP PMIC's support.
I've removed RFC tag and sending as regular set hoping that
this time more comments will come out. The link to the RFCv2
at [1].

The first patch in the set implements an *of* based parsing of
PMIC peripheral resources and adding mfd cell for it.
The devicetree node should contain a compatible and reg
proparties. The intention was to keep things simple and similar
to the other mfd drivers. 

The second patch adds binding document for qpnp-spmi.

The third patch describes the devicetree binding of the slave
devices attached to the SPMI interface. 

Comments are welcome.

regards,
Stan

[1] https://lkml.org/lkml/2014/7/3/443

Ivan T. Ivanov (2):
  mfd: qpnp-spmi: document DT bindings for Qualcomm QPNP PMICs
  dt: qcom: msm8974: add qpnp-spmi device nodes

Josh Cartwright (1):
  mfd: qpnp-spmi: add support for Qualcomm QPNP PMICs

 .../devicetree/bindings/qpnp/qcom,qpnp-spmi.txt    |   53 +++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                |   45 ++++++
 drivers/mfd/Kconfig                                |   15 ++
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/qpnp-spmi.c                            |  145 ++++++++++++++++++++
 5 files changed, 259 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/qpnp/qcom,qpnp-spmi.txt
 create mode 100644 drivers/mfd/qpnp-spmi.c
