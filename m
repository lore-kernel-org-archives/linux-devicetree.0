From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 0/2] iio: light: bh1750: convert bindings to yaml
Date: Mon, 16 Sep 2019 21:00:22 +0200
Message-ID: <20190916190024.9955-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, robh+dt@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Convert ROHM BH1750 ambient light sensor bindings to yaml
format and while at it add myself as a driver maintainer.

Tomasz Duszynski (2):
  dt-bindings: iio: light: bh1750: convert bindings to yaml
  MAINTAINERS: add entry for ROHM BH1750 driver

 .../devicetree/bindings/iio/light/bh1750.txt  | 18 --------
 .../devicetree/bindings/iio/light/bh1750.yaml | 43 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 3 files changed, 49 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/light/bh1750.txt
 create mode 100644 Documentation/devicetree/bindings/iio/light/bh1750.yaml

--
2.23.0
