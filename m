From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 0/11] Series adding Altera Arria10 L2 Cache EDAC
Date: Mon, 7 Mar 2016 13:42:56 -0600
Message-ID: <1457379787-8327-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

This version splits the larger patch in V1 into smaller,
patches.

 [PATCHv2 01/11] EDAC: Altera L2 Kconfig change from select to
 [PATCHv2 02/11] EDAC, altera: Move Device structs and defines to
 [PATCHv2 03/11] EDAC, altera: Add register offset for ECC Enable
 [PATCHv2 04/11] EDAC, altera: Add register offset for ECC Error
 [PATCHv2 05/11] EDAC, altera: Add register offset for ECC Error
 [PATCHv2 06/11] EDAC, altera: Add IRQ flags to private data struct
 [PATCHv2 07/11] EDAC, altera: Add status offset & masks
 [PATCHv2 08/11] Documentation: dt: socfpga: Add Altera Arria10 L2
 [PATCHv2 09/11] EDAC, altera: Addition of Arria10 L2 Cache ECC
 [PATCHv2 10/11] ARM: socfpga: Enable Arria10 L2 cache ECC on startup
 [PATCHv2 11/11] ARM: dts: Add Altera Arria10 L2 Cache EDAC
