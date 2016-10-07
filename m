From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [RFC 0/2] Juniper DT based connector driver
Date: Fri,  7 Oct 2016 18:16:10 +0300
Message-ID: <1475853372-21997-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alon Ronen <aronen@juniper.net>, Debjit Ghosh <dghosh@juniper.net>, Dhruva Diveneni <ddevineni@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, Yu-Lin Lu <ylu@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
List-Id: devicetree@vger.kernel.org

Introduce a Juniper PTX router series DT overlay based
connector driver.

This is submitted as an RFC since some OF infrastructure
patches (like changeset helpers etc) are not yet mainlined.

The Juniper series of routers comprise of both x86 and powerpc
platforms that contain similar hardware components necessitating
common support methods.

Note that this is the first submission and we expect things to be
moved around as required.

This patchset is against mainline as of today: v4.8-9431-g3477d16
and is dependent on the "Juniper prerequisites",
"Juniper infrastructure" and "Juniper PCI methods" patchsets
sent earlier.

Guenter Roeck (2):
  staging: jnx: Add Juniper connector driver
  staging: jnx-connector: add device tree binding

 .../devicetree/bindings/jnx/jnx-connector          |   59 +
 drivers/staging/jnx/Kconfig                        |   15 +
 drivers/staging/jnx/Makefile                       |    1 +
 drivers/staging/jnx/jnx-connector.c                | 2172 ++++++++++++++++++++
 4 files changed, 2247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/jnx/jnx-connector
 create mode 100644 drivers/staging/jnx/jnx-connector.c

-- 
1.9.1
