From: Patrick Venture <venture@google.com>
Subject: [PATCH 0/3] update aspeed-bmc-opp-zaius device-tree
Date: Tue, 16 Apr 2019 09:21:48 -0700
Message-ID: <20190416162150.150154-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: venture@google.com, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@aj.id.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series contains three updates to the Zaius ASPEED device-tree to
add voltrage regulators, and update addresses and aliases.  The Infineon
and Intersil drivers are staged on hwmon-next, and the trivial device
dt-bindings changed are up for review.

Maxim Sloyko (1):
  ARM: dts: aspeed: zaius: add Infineon and Intersil regulators

Robert Lippert (2):
  ARM: dts: aspeed: zaius: update 12V brick I2C address
  ARM: dts: aspeed: zaius: fixed I2C bus numbers for pcie slots

 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 121 +++++++++++++++++++--
 1 file changed, 113 insertions(+), 8 deletions(-)

-- 
2.21.0.392.gf8f6787159e-goog
