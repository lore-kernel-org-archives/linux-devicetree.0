From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: g12a board node order
Date: Fri, 10 May 2019 17:53:25 +0200
Message-ID: <20190510155327.5759-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The order of the nodes in the u200 and sei510 is bit fancy.
Order nodes by address, then node name, then aliases.

This makes rebasing is little less painful

Jerome Brunet (2):
  arm64: dts: meson: sei510: consistently order nodes
  arm64: dts: meson: u200: consistently order nodes

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 92 +++++++++----------
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 50 +++++-----
 2 files changed, 72 insertions(+), 70 deletions(-)

-- 
2.20.1
