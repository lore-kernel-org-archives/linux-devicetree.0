From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 0/4] of Automatic console registration cleanups
Date: Wed, 18 Jun 2014 21:54:30 +0100
Message-ID: <1403124874-19929-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, olof@lixom.net, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

I posted this series a 1.5 months ago as an RFC. I'm going to put it in
my tree for merging in v3.17.

This series cleans up the selection of default console devices when
using the device tree. The device tree defines a way of specifying the
console by using a "stdout-path" property in the /chosen node, but very
few drivers actually attempt to use that data, and so for most platforms
there needs to be a "console=" line in the command line if a serial port
is intended to be used as the console.

With this series, if there is a /chosen/stdout-path property, and that
property points to a serial port node, then when the serial driver
registers he port, the core uart_add_one_port() function will notice
and if no console= argument was provided then add it as a preferred
console.
