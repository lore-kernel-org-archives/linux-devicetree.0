From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] ARM: dts: oxnas: Update with dt-bindings
Date: Wed,  4 Jan 2017 10:30:44 +0100
Message-ID: <20170104093046.12428-1-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-oxnas@lists.tuxfamily.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchsets updates the OX810SE and OX820 dtsi with the reset and
clock dt-bindings includes then replaces magic values with bindings
defines.

Neil Armstrong (2):
  ARM: dts: OX810: Update with dt-bindings includes
  ARM: dts: OX820: Update with dt-bindings includes

 arch/arm/boot/dts/ox810se.dtsi | 10 ++++++----
 arch/arm/boot/dts/ox820.dtsi   | 14 ++++++++------
 2 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.7.0
