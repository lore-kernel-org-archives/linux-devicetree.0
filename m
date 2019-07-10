From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 0/2] iio: chemical: pms7003: convert bindings to yaml
Date: Wed, 10 Jul 2019 21:21:53 +0200
Message-ID: <20190710192155.11489-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert plantower pms7003 air pollution sensor bindings to yaml and
while at it add myself as a driver maintainer.

Tomasz Duszynski (2):
  dt-bindings: iio: chemical: pms7003: convert bindings to yaml
  MAINTAINERS: add entry for plantower pms7003 driver

 .../iio/chemical/plantower,pms7003.txt        | 26 ----------
 .../iio/chemical/plantower,pms7003.yaml       | 51 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 3 files changed, 57 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml

--
2.22.0
