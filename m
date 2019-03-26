From: Shinji Kanematsu <kanematsu.shinji@socionext.com>
Subject: [PATCH 0/2] Add Updown Counter support for Milbeaut M10V SoC
Date: Tue, 26 Mar 2019 15:32:34 +0900
Message-ID: <1553581954-13487-1-git-send-email-kanematsu.shinji@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, orito.takao@socionext.com, sugaya.taichi@socionext.com, kasai.kazuhiro@socionext.com, kanematsu.shinji@socionext.com
List-Id: devicetree@vger.kernel.org

This is a series of patch which adds Updown Counter support on
Milbeaut M10V SoC.

The Updown Counter counts input pulse signal from external quadrature encoder.
It also has input pulse signal counter function.

Shinji Kanematsu (2):
  dt-bindings: iio: counter: Add Milbeaut Updown Counter
  iio: counter: Add support for Milbeaut Updown Counter

 .../bindings/iio/counter/milbeaut-updown_cnt.txt   |  22 ++
 drivers/iio/counter/Kconfig                        |  12 +
 drivers/iio/counter/Makefile                       |   1 +
 drivers/iio/counter/milbeaut-updown.h              |  38 ++
 drivers/iio/counter/milbeaut-updown_cnt.c          | 385 +++++++++++++++++++++
 5 files changed, 458 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/counter/milbeaut-updown_cnt.txt
 create mode 100644 drivers/iio/counter/milbeaut-updown.h
 create mode 100644 drivers/iio/counter/milbeaut-updown_cnt.c

-- 
1.9.1
