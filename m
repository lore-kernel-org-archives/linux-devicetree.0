From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 0/2] iio: chemical: sps30: convert bindings to yaml
Date: Thu, 20 Jun 2019 21:50:09 +0200
Message-ID: <20190620195011.30942-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert sensirion sps30 particulate matter sensor bindings to yaml
format and while at it add myself as a driver maintainer.

Tomasz Duszynski (2):
  dt-bindings: iio: chemical: sps30: convert bindings to yaml
  MAINTAINERS: add entry for sensirion sps30 driver

 .../bindings/iio/chemical/sensirion,sps30.txt | 12 ------
 .../iio/chemical/sensirion,sps30.yaml         | 39 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 3 files changed, 45 insertions(+), 12 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml

--
2.22.0
