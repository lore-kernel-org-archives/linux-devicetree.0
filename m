From: Robert Yang <decatf@gmail.com>
Subject: [PATCH v2 0/3] Add device tree support for kxcjk1013 accelerometer
Date: Mon,  4 Mar 2019 10:19:09 -0500
Message-ID: <20190304151912.11485-1-decatf@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Yang <decatf@gmail.com>
List-Id: devicetree@vger.kernel.org

- Add a vendor prefix for Kionix Inc. to device tree bindings.
  There is already one other Kionix accelerometer (kxsd9) with device tree
  bindings but this vendor prefix hasn't been documented.
- Document the kxcjk1013 device tree bindings.
- Add device tree support for Kionix kxcjk1013 accelerometer sensors.

Changelog:

v2:     - Remove SMO8500 because it's an ACPI binding.

 .../bindings/iio/accel/kionix,kxcjk1013.txt     | 17 +++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt     |  1 +
 drivers/iio/accel/kxcjk-1013.c                  | 10 ++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/kionix,kxcjk1013.txt

-- 
2.17.1
