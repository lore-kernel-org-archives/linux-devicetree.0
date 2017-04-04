From: John Muir <john@jmuir.com>
Subject: [PATCH 0/2] Add Maxim Integrated MAX31760 fan controller driver.
Date: Tue,  4 Apr 2017 12:20:32 -0700
Message-ID: <20170404192034.158901-1-john@jmuir.com>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Cc: John Muir <john@jmuir.com>, Anatol Pomazau <anatol@google.com>, Mark Segal <segal@google.com>
List-Id: devicetree@vger.kernel.org

Add a device driver for the MAX31760 I2C device with a hwmon interface and
a few open firmware device properties.

John Muir (2):
  hwmon: Add MAX31760 fan controller driver.
  devicetree: Document the max31760 device binding.

 .../devicetree/bindings/hwmon/max31760.txt         |   58 +
 Documentation/hwmon/max31760                       |   41 +
 drivers/hwmon/Kconfig                              |   10 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/max31760.c                           | 1430 ++++++++++++++++++++
 5 files changed, 1540 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt
 create mode 100644 Documentation/hwmon/max31760
 create mode 100644 drivers/hwmon/max31760.c

-- 
2.12.2.715.g7642488e1d-goog

