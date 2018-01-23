From: richard.gong@linux.intel.com
Subject: [PATCHv1] Add Intel Stratix10 service layer binding
Date: Tue, 23 Jan 2018 13:25:01 -0600
Message-ID: <1516735502-16745-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: richard.gong@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Intel Stratix10 SoC is composed of a 64 bit quad-core ARM Cortex A53 hard
processor system (HPS) and Secure Device Manager (SDM). When the FPGA is
configured from HPS, there needs to be a way for HPS to notify SDM the
location and size of the configuration data. Then SDM will get the
configuration data from that location and perform the FPGA configuration.

To meet the whole system security needs and support virtual machine requesting
communication with SDM, only the secure world of software (EL3, Exception
Layer 3) can interface with SDM. All software entities running on other
exception layers must channel through the EL3 software whenever it needs
service from SDM.

Intel Stratix10 service layer driver, running at privileged exception level
(EL1, Exception Layer 1), interfaces with the service providers and provides
the services for FPGA configuration, QSPI, Crypto and warm reset. Service layer
driver also manages secure monitor call (SMC) to communicate with secure monitor
code running in EL3.

This patch adds a device tree binding for Intel Stratix10 service layer driver

Richard Gong (1):
  dt-bindings: misc: add Intel Stratix10 service layer binding

 .../devicetree/bindings/misc/intel-service.txt     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/intel-service.txt

-- 
2.7.4
