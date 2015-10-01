From: Rob Herring <robh@kernel.org>
Subject: [PATCH 5/8] dt-bindings: consolidate various misc bindings
Date: Thu,  1 Oct 2015 17:12:31 -0500
Message-ID: <1443737554-10352-6-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Move various bindings in misc to appropriate subsystem directories.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 Documentation/devicetree/bindings/{nvec => arm/tegra}/nvidia,nvec.txt     | 0
 Documentation/devicetree/bindings/{misc => iio/accel}/lis302.txt          | 0
 Documentation/devicetree/bindings/{misc => iio/dac}/ti,dac7512.txt        | 0
 Documentation/devicetree/bindings/{misc => iio/pressure}/bmp085.txt       | 0
 Documentation/devicetree/bindings/{hid => input}/hid-over-i2c.txt         | 0
 Documentation/devicetree/bindings/{ => interrupt-controller}/open-pic.txt | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{nvec => arm/tegra}/nvidia,nvec.txt (100%)
 rename Documentation/devicetree/bindings/{misc => iio/accel}/lis302.txt (100%)
 rename Documentation/devicetree/bindings/{misc => iio/dac}/ti,dac7512.txt (100%)
 rename Documentation/devicetree/bindings/{misc => iio/pressure}/bmp085.txt (100%)
 rename Documentation/devicetree/bindings/{hid => input}/hid-over-i2c.txt (100%)
 rename Documentation/devicetree/bindings/{ => interrupt-controller}/open-pic.txt (100%)

diff --git a/Documentation/devicetree/bindings/nvec/nvidia,nvec.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
similarity index 100%
rename from Documentation/devicetree/bindings/nvec/nvidia,nvec.txt
rename to Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
diff --git a/Documentation/devicetree/bindings/misc/lis302.txt b/Documentation/devicetree/bindings/iio/accel/lis302.txt
similarity index 100%
rename from Documentation/devicetree/bindings/misc/lis302.txt
rename to Documentation/devicetree/bindings/iio/accel/lis302.txt
diff --git a/Documentation/devicetree/bindings/misc/ti,dac7512.txt b/Documentation/devicetree/bindings/iio/dac/ti,dac7512.txt
similarity index 100%
rename from Documentation/devicetree/bindings/misc/ti,dac7512.txt
rename to Documentation/devicetree/bindings/iio/dac/ti,dac7512.txt
diff --git a/Documentation/devicetree/bindings/misc/bmp085.txt b/Documentation/devicetree/bindings/iio/pressure/bmp085.txt
similarity index 100%
rename from Documentation/devicetree/bindings/misc/bmp085.txt
rename to Documentation/devicetree/bindings/iio/pressure/bmp085.txt
diff --git a/Documentation/devicetree/bindings/hid/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
similarity index 100%
rename from Documentation/devicetree/bindings/hid/hid-over-i2c.txt
rename to Documentation/devicetree/bindings/input/hid-over-i2c.txt
diff --git a/Documentation/devicetree/bindings/open-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/open-pic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/open-pic.txt
rename to Documentation/devicetree/bindings/interrupt-controller/open-pic.txt
-- 
2.1.4
