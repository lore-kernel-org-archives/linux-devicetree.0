From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/3] input: rmi4: Regulator supply support
Date: Fri,  6 May 2016 21:40:05 -0700
Message-ID: <1462596008-21381-1-git-send-email-bjorn.andersson@linaro.org>
References: <20160506005832.GB1256@tuxbot>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20160506005832.GB1256@tuxbot>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrew Duggan <aduggan@synaptics.com>, Christopher Heiny <cheiny@synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The first version of the regulator support patch suffered from being
implemented in the transport driver, as a work around for resource availability
racing (EPROBE_DEFER of the core driver) with the interrupt handler.

After reconsidering the solutions discussed following that I concluded that the
interrupt management is not really part of the transport, neither conceptually
or electrically. I therefor here suggest (patch 1/3) to move the interrupt
registration and handling to the core rmi driver.

This solves the potential race of interrupts being delivered in the transport
driver before the core driver have been given a chance to recover from probe
deferral.

Patch 2/3 then add the necessary code for acquiring regulator handles and
enabling these.

Patch 3/3 removes the set_page() done in the transport drivers, as we can't
rely on the chip becoming available at any time during the initialization/probe
phase.

Bjorn Andersson (3):
  input: rmi4: Move IRQ handling to rmi_driver
  input: rmi4: Acquire and enable VDD and VIO supplies
  input: rmi4: Remove set_page() call before core is initialized

 .../devicetree/bindings/input/rmi4/rmi_i2c.txt     |  6 ++
 .../devicetree/bindings/input/rmi4/rmi_spi.txt     |  6 ++
 drivers/input/rmi4/rmi_driver.c                    | 89 +++++++++++++++++++++-
 drivers/input/rmi4/rmi_i2c.c                       | 84 ++------------------
 drivers/input/rmi4/rmi_spi.c                       | 83 ++------------------
 include/linux/rmi.h                                | 11 ++-
 6 files changed, 118 insertions(+), 161 deletions(-)

-- 
2.5.0

