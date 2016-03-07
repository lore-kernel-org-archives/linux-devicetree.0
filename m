From: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH v4 4/8] bindings: move cpm_qe binding from powerpc/fsl to soc/fsl
Date: Mon, 7 Mar 2016 10:28:04 +0800
Message-ID: <1457317688-20330-4-git-send-email-qiang.zhao@nxp.com>
References: <1457317688-20330-1-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457317688-20330-1-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org
Cc: oss@buserror.net, leoyang.li@nxp.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Zhao Qiang <qiang.zhao@nxp.com>
List-Id: devicetree@vger.kernel.org

cpm_qe is supported on both powerpc and arm.
and the QE code has been moved from arch/powerpc into
drivers/soc/fsl, so move cpm_qe binding from powerpc/fsl
to soc/fsl

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
Acked-by: Rob Herring<robh@kernel.org>
---
Changes for v3
	- NA
Changes for v4
	- NA

 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm.txt     | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/brg.txt | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/i2c.txt | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/pic.txt | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/usb.txt | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/gpio.txt    | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/network.txt | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe.txt      | 0
 .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/firmware.txt       | 0
 .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/par_io.txt         | 0
 .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/pincfg.txt         | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/ucc.txt  | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/usb.txt  | 0
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/serial.txt  | 0
 .../devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/uqe_serial.txt        | 0
 15 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/brg.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/i2c.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/pic.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/cpm/usb.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/gpio.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/network.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/firmware.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/par_io.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/pincfg.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/ucc.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/qe/usb.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/serial.txt (100%)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/cpm_qe/uqe_serial.txt (100%)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/brg.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/brg.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/brg.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/brg.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/i2c.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/i2c.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/i2c.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/i2c.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/pic.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/pic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/pic.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/pic.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/usb.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/usb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/cpm/usb.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/usb.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/gpio.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/gpio.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/gpio.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/gpio.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/network.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/firmware.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/firmware.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/firmware.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/firmware.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/par_io.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/pincfg.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/pincfg.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/pincfg.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/pincfg.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/ucc.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/ucc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/ucc.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/ucc.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/usb.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/usb.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/usb.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/serial.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/serial.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/serial.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/serial.txt
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/uqe_serial.txt
similarity index 100%
rename from Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
rename to Documentation/devicetree/bindings/soc/fsl/cpm_qe/uqe_serial.txt
-- 
2.1.0.27.g96db324
