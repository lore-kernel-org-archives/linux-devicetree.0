From: Hoan Tran <hotran@apm.com>
Subject: [PATCH v2 0/3] hwmon: xgene: Add support for X-Gene hwmon driver
Date: Mon, 11 Jul 2016 17:30:13 -0700
Message-ID: <1468283416-12780-1-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Duc Dang <dhdang@apm.com>, lho@apm.com, Hoan Tran <hotran@apm.com>
List-Id: devicetree@vger.kernel.org

This patch set adds hardware temperature and power reading support =E2=80=
=8Bfor
APM X-Gene SoC using the mailbox communication interface.
=46or device tree, it is the standard DT mailbox.
=46or ACPI, it is the PCC mailbox.

=46or ACPI, tested with this patch[1] which supports PCC subspace 2
[1] http://www.spinics.net/lists/linux-acpi/msg66041.html
 - [PATCH v3] mailbox: pcc: Support HW-Reduced Communication Subspace t=
ype 2

v2
 - Increase power reading accurateness by using 2 registers
(a register for Watt, another for milli-Watt)
 - Remove power reading for SoC
 - Fix review comments from Guenter

v1
 - Initial

Hoan Tran (3):
  Documentation: dtb: xgene: Add hwmon dts binding documentation
  hwmon: xgene: Add hwmon driver
  arm64: dts: apm: Add X-Gene SoC hwmon to device tree

 .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt  |  14 +
 Documentation/hwmon/xgene-hwmon                    |  30 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |   5 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   5 +
 drivers/hwmon/Kconfig                              |   7 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/xgene-hwmon.c                        | 772 +++++++++++++=
++++++++
 7 files changed, 834 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-h=
wmon.txt
 create mode 100644 Documentation/hwmon/xgene-hwmon
 create mode 100644 drivers/hwmon/xgene-hwmon.c

--=20
1.9.1

