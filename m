From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 0/2] iio: chemical: pms7003: add other supported sensors
Date: Sun, 17 Feb 2019 20:22:11 +0100
Message-ID: <20190217192213.15803-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

This series extends the supported sensors list with a new ones belonging
to the PMSxxyy family. All share the very same binary protocol and
are capable of measuring PM1.0, PM2.5 and PM10 dust particles.

Tomasz Duszynski (2):
  iio: chemical: pms7003: extend supported sensors list
  dt-bindings: iio: chemical: pms7003: extend supported sensors list

 .../bindings/iio/chemical/plantower,pms7003.txt           | 8 +++++++-
 drivers/iio/chemical/pms7003.c                            | 5 +++++
 2 files changed, 12 insertions(+), 1 deletion(-)

--
2.20.1
