From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH 0/2] set regulator constraints for standby state
Date: Tue, 13 Nov 2018 14:47:29 +0000
Message-ID: <1542120469-15450-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

This patch series adds support for setting the regulator constraints
when entering standby Linux state.

The new bindings are called regulator-state-standby and have
the same syntax as regulator-state-mem/disk.

Before this patch, if the regulator driver implemented
set_suspend_voltage/mode the rdev_warn message: "No configuration"
(drivers/regulator/core.c:suspend_set_state) would be issued when
resuming from standby.

Andrei Stefanescu (2):
  regulator: dt-bindings: add regulator-state-standby bindings
  regulator: of: add support for parsing regulator-state-standby

 Documentation/devicetree/bindings/regulator/regulator.txt | 5 ++++-
 drivers/regulator/of_regulator.c                          | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

--=20
2.7.4
