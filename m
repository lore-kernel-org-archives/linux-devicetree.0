From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 0/3] RFC/RFT: Powering on MMC Wifi/BT modules in MMC core
Date: Sun, 19 Jan 2014 19:56:52 -0800
Message-ID: <1390190215-22700-1-git-send-email-olof@lixom.net>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.ok, galak@codeaurora.org, chris@printf.net
List-Id: devicetree@vger.kernel.org

This is a small series enhancing the MMC core code to power on modules
before the host in cases where needed, and the corresponding DT bindings
changes.

I've got some other issues to debug on the Chromebook, i.e. the interface
doens't actually work. So far it seems unrelated to this patch set so
it's worth posting this and get things going since others need the same
functionality (i.e Cubox-i).

As mentioned in the patch in the series, I haven't implemented power-down
yet, I wanted to make sure that the power-on side will be adequate for
those who are looking to use it right away.

Comments/test reports/etc welcome.


-Olof

