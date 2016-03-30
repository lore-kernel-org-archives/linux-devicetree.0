From: <tthayer@opensource.altera.com>
Subject: [PATCH] Addition of Altera Arria10 On-Chip RAM ECC
Date: Wed, 30 Mar 2016 10:27:41 -0500
Message-ID: <1459351668-14622-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

This series of patches adds the Arria10 OCRAM EDAC support.

[PATCH 1/7] EDAC, altera: New file operations for Arria10 ECC
[PATCH 2/7] EDAC, altera: Add register offset for ECC Enable
[PATCH 3/7] EDAC, altera: Make OCRAM ECC dependency check generic
[PATCH 4/7] Documentation: dt: socfpga: Add Altera Arria10 OCRAM
[PATCH 5/7] EDAC, altera: Addition of Arria10 OCRAM ECC
[PATCH 6/7] ARM: socfpga: Enable Arria10 OCRAM ECC on startup
[PATCH 7/7] ARM: dts: Add Altera Arria10 OCRAM EDAC devicetree entry
