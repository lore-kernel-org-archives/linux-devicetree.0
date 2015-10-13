From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 0/5] ARM: dts: add device tree support for NS, NSP, and NS2 clocks
Date: Tue, 13 Oct 2015 17:22:22 -0400
Message-ID: <1444771347-11382-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org


This patch series adds device tree support for the Broadcom Northstar,
Northstar Plus, and Northstar 2 clocks.  This is being sent as a
separate patch series due to the the clk maintainer(s) not wanting to
pull in device tree changes into the clk repo.  This series is an RFC
due to a potential merge "race" between the device tree changes and the
clk changes.  If the device tree changes go in before the clk changes,
there is a window where there are non-working clk entries in the device
tree.  So, these patches will be officially pushed once the clk changes
are merged.

Thanks,
Jon
