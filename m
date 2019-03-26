From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 0/2] transform devantech-srf04.txt into yaml format
Date: Tue, 26 Mar 2019 13:30:45 +0100
Message-ID: <20190326123044.putlbpnkecsley5q@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

use yaml description language to document Devantech SRF04 ultrasonic iio
proximity driver

Andreas Klinger (2):
  devantech-srf04.yaml: transform DT binding to YAML
  devantech-srf04.txt: remove old DT documentation

 .../bindings/iio/proximity/devantech-srf04.txt     | 28 ----------
 .../bindings/iio/proximity/devantech-srf04.yaml    | 62 ++++++++++++++++++++++
 2 files changed, 62 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.yaml

-- 
2.11.0


-- 
Andreas Klinger
Grabenreith 27
84508 Burgkirchen
+49 8623 919966
ak@it-klinger.de
www.it-klinger.de
www.grabenreith.de
