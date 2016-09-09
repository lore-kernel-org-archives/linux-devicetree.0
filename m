From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH 0/2] i2c: aspeed: added driver for Aspeed I2C
Date: Fri,  9 Sep 2016 12:54:28 -0700
Message-ID: <1473450870-10333-1-git-send-email-brendanhiggins@google.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au, jk@ozlabs.org
List-Id: devicetree@vger.kernel.org

This patch set adds initial master mode and slave mode support for the Aspeed
24xx and 25xx I2C controllers, as well as device binding documentation for the
new driver.

These changes have been tested on the ast2500 evaluation board from Aspeed.

Work still to be done:
 - The driver supports I2C protocol mangling in the form of sending stops after
   every transaction, the remaining mangling support has not yet been added.
 - SMBus Alert support.

Cheers!
