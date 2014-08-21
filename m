From: Dan Murphy <dmurphy@ti.com>
Subject: input: drv2667: add support for drv2667 haptic driver
Date: Thu, 21 Aug 2014 13:19:01 -0500
Message-ID: <1408645143-25690-1-git-send-email-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Adding support for the TI DRV2667 haptic driver.
This device driver a linear resonant actuator (LRA)
based on user space requests to provide either a
vibration or a haptic tactile response to an input.

This device has the ability to store wave patterns in RAM
and these patterns can be executed based on user input.

For this initial series I added just the basic vibration
pattern along that will continuously execute until
the user indicates to stop.

[PATCH 1/2] doc: dt/bindings: input: introduce TI DRV2667 haptic
[PATCH 2/2] input: misc: Add support for the DRV2667 haptic driver
