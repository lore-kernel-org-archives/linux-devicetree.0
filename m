From: <tthayer@opensource.altera.com>
Subject: [PATCH] Add EDAC peripheral init functions & Ethernet EDAC.
Date: Tue, 12 Apr 2016 17:12:55 -0500
Message-ID: <1460499181-23080-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

This patch set adds the memory initialization functions for Altera's
Arria10 peripherals, the first of which is the Ethernet EDAC. The
first 3 patches add the memory initialization functionality. The
last 3 patches add Ethernet EDAC support.

[PATCH 1/6] EDAC, altera: Check parent status for Arria10 EDAC block
[PATCH 2/6] EDAC, altera: Move IRQ function declaration
[PATCH 3/6] EDAC, altera: Add Arria10 ECC memory init functions
[PATCH 4/6] Documentation: dt: socfpga: Add Arria10 Ethernet binding
[PATCH 5/6] EDAC, altera: Add Arria10 Ethernet EDAC support
[PATCH 6/6] ARM: dts: Add Arria10 Ethernet EDAC devicetree entry
