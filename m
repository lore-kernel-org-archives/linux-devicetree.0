From: J Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/4] mfd: Palmas: Correct the DT Node properties naming convention and add documentation.
Date: Mon, 18 Feb 2013 10:40:15 +0530
Message-ID: <1361164215-3093-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, b-cousson@ti.com, sameo@linux.intel.com, broonie@opensource.wolfsonmicro.com
Cc: j-keerthy@ti.com, gg@slimlogic.co.uk
List-Id: devicetree@vger.kernel.org

The series corrects the DT node properties naming convention and adds
Documentation for the Palmas PMIC.

Graeme Gregory (1):
  documentation: add palmas dts definition

J Keerthy (3):
  mfd: palmas: Change the DT node property names to follow the
    convention
  regulator: palmas: Removing duplicated code
  regulator: palmas: Change the DT node property names to follow the
    convention

 Documentation/devicetree/bindings/mfd/palmas.txt |   67 ++++++++++++++++++++++
 drivers/mfd/palmas.c                             |    6 +-
 drivers/regulator/palmas-regulator.c             |   13 +---
 3 files changed, 74 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/palmas.txt

-- 
1.7.5.4

