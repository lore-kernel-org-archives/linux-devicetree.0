From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 0/3] add Maxbotix ultrasonic iio sensors with gpio bitbanging
Date: Tue, 9 Apr 2019 21:09:53 +0200
Message-ID: <20190409190952.ctgf6mbx47nwvfs5@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, songqiang1304521@gmail.com, robh@kernel.org, m.othacehe@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for Maxbotix ultrasonic iio sensors with
gpio bitbanging protocol.

These sensors are quite similiar to the existing srf04. This is why the
existing one was changed to support a driver specific configuration
containing the differences between the different types.

This patch series needs the formerly submitted 
"[PATCH v2] devantech-srf04.yaml: transform DT binding to YAML" 
because it relies on the yaml documentation of devantech-srf04.yaml

Andreas Klinger (3):
  srf04.c: add maxbotix ultrasonic sensors
  devantech-srf04.yaml: add Maxbotix ultrasonic iio proximity sensors
  Kconfig: change configuration of srf04 ultrasonic iio sensor

 .../bindings/iio/proximity/devantech-srf04.yaml    | 25 +++++++++-----
 drivers/iio/proximity/Kconfig                      | 11 +++++--
 drivers/iio/proximity/srf04.c                      | 38 +++++++++++++++++-----
 3 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.11.0
