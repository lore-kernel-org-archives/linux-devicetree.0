From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 0/2] Allow VINDPM to be set in the device tree
Date: Mon, 20 May 2019 11:07:10 -0700
Message-ID: <20190520180712.32405-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Angus Ainslie (Purism)" <angus@akkea.ca>
List-Id: devicetree@vger.kernel.org

The BQ25890 can control the input voltage limit so allow it to be set.

Angus Ainslie (Purism) (1):
  dt-bindings: power: supply: Add documentation for the VINDPM
    properties

Eric Kuzmenko (1):
  power: supply: bq25890: Add support for setting bq25890 and bq25896's
    VINDPM

 .../devicetree/bindings/power/supply/bq25890.txt    |  8 ++++++++
 drivers/power/supply/bq25890_charger.c              | 13 ++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.17.1
